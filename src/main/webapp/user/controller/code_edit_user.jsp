<%@ page import="java.sql.*" %>
<%@ include file="../../auth.jsp" %>

<%
    request.setCharacterEncoding("UTF-8");

    Integer userId = (Integer) session.getAttribute("id");
    if (userId == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp?error=invalid_session");
        return;
    }

    String name     = request.getParameter("name");
    String email    = request.getParameter("email");
    String username = request.getParameter("username");
    String phone    = request.getParameter("phone_number");
    String dob      = request.getParameter("dob");
    String age      = request.getParameter("age");

    if (name == null || email == null || username == null) {
        response.sendRedirect(request.getContextPath() + "/user/views/edit_user_details.jsp?error=missing");
        return;
    }

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/jakarta_tutorial", "root", "");

        PreparedStatement ps = con.prepareStatement(
            "UPDATE users SET name=?, email=?, username=?, phone_number=?, dob=?, age=? WHERE id=?"
        );

        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, username);
        ps.setString(4, phone);
        ps.setString(5, dob);
        ps.setString(6, age);
        ps.setInt(7, userId);

        ps.executeUpdate();
        ps.close();
        con.close();

        session.setAttribute("authUser", username);

        response.sendRedirect(request.getContextPath() + "/user/views/user_dashboard.jsp?updated=success");

    } catch (Exception e) {
        out.print("<div style='color:red;padding:20px;'>Error updating user: " + e.getMessage() + "</div>");
    }
%>