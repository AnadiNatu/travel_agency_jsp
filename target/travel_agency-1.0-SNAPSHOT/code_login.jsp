<%@page import="org.mindrot.jbcrypt.BCrypt"%>
<%@include file="./WEB-INF/includes/db.jsp" %>
<%@ include file="./WEB-INF/includes/util/jwt_filter.jsp" %>

<%
  String username = request.getParameter("username");
  String password = request.getParameter("password");

  if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
    response.sendRedirect(request.getContextPath() + "/login.jsp?error=missing");
    return;
  }

  try (Connection con = getConnection()) {
    PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE username=?");
    ps.setString(1, username);
    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
      String dbPassword = rs.getString("password");
      if (!BCrypt.checkpw(password, dbPassword)) {
        response.sendRedirect(request.getContextPath() + "/login.jsp?error=invalid");
        return;
      }
      int id       = rs.getInt("id");
      String role  = rs.getString("role");
      String token = generateToken(username, role, id);
      session.setAttribute("authToken", token);

      if ("Admin".equalsIgnoreCase(role)) {
        response.sendRedirect(request.getContextPath() + "/admin/views/admin_dashboard.jsp");
      } else {
        response.sendRedirect(request.getContextPath() + "/user/views/user_dashboard.jsp");
      }
    } else {
      response.sendRedirect(request.getContextPath() + "/login.jsp?error=invalid");
    }
  } catch (Exception ex) {
    out.println("<p>Error: " + ex.getMessage() + "</p>");
  }
%>