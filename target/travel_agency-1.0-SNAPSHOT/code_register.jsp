<%@include file="./WEB-INF/includes/db.jsp" %>
<%@page import="java.sql.*" %>
<%@page import="org.mindrot.jbcrypt.BCrypt" %>
<%
  String name     = request.getParameter("name");
  String email    = request.getParameter("email");
  String username = request.getParameter("username");
  String password = request.getParameter("password");
  String age      = request.getParameter("age");
  String dob      = request.getParameter("dob");
  String role     = request.getParameter("role");
  String phone    = request.getParameter("phone_number");

  if (name == null || email == null || username == null || password == null
      || name.isEmpty() || email.isEmpty() || username.isEmpty() || password.isEmpty()) {
    response.sendRedirect(request.getContextPath() + "/register.jsp?error=missing");
    return;
  }

  String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

  try (Connection con = getConnection()) {
    PreparedStatement check = con.prepareStatement(
      "SELECT id FROM users WHERE username=? OR email=?"
    );
    check.setString(1, username);
    check.setString(2, email);
    ResultSet rs = check.executeQuery();

    if (rs.next()) {
      response.sendRedirect(request.getContextPath() + "/register.jsp?error=exists");
    } else {
      PreparedStatement ps = con.prepareStatement(
        "INSERT INTO users(name, email, username, password, age, dob, role, phone_number) VALUES (?,?,?,?,?,?,?,?)"
      );
      ps.setString(1, name);
      ps.setString(2, email);
      ps.setString(3, username);
      ps.setString(4, hashedPassword);
      ps.setString(5, age);
      ps.setString(6, dob);
      ps.setString(7, role != null ? role : "User");
      ps.setString(8, phone);
      ps.executeUpdate();
      response.sendRedirect(request.getContextPath() + "/login.jsp?success=registered");
    }
  } catch (Exception ex) {
    out.print("<p class='text-danger'>Error: " + ex.getMessage() + "</p>");
  }
%>