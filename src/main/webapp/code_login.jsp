<%@page import="java.sql.*"%>
<%@ include file="jwt_util.jsp" %>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username == null || password == null) {
        response.sendRedirect("login.jsp?error=missing");
        return;
    }

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jakarta_tutorial", "root", "");

        ps = con.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
        ps.setString(1, username);
        ps.setString(2, password);

        rs = ps.executeQuery();

        if (rs.next()) {
            int id = rs.getInt("id");
            String role = rs.getString("role");

            // Generate token
            String token = generateToken(username, role, id);

            // Store in session
            session.setAttribute("authToken", token);

            // Redirect by role
            String ctx = request.getContextPath();
            if ("Admin".equalsIgnoreCase(role)) {
                response.sendRedirect(ctx + "/admin/admin_dashboard.jsp");
            } else {
                response.sendRedirect(ctx + "/user/user_dashboard.jsp");
            }

        } else {
            response.sendRedirect("login.jsp?error=invalid");
        }

    } catch (Exception ex) {
        out.print("<p>Error: " + ex.getMessage() + "</p>");

    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (ps != null) ps.close(); } catch (Exception e) {}
        try { if (con != null) con.close(); } catch (Exception e) {}
    }
%>
