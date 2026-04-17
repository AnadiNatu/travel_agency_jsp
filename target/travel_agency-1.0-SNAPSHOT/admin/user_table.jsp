<%@ include file="../auth.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8"%>

<!--<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>User Management | Admin</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body { background: #f8f9fa; font-family: 'Poppins', sans-serif; }
        .table-container { margin-left: 260px; padding: 20px; }
        .sidebar {
            height: 100vh; width: 260px;
            position: fixed; top: 0; left: 0;
            background: #343a40; padding-top: 20px;
        }
        .sidebar a {
            display: block; padding: 12px 20px;
            color: #ddd; text-decoration: none;
            font-weight: 500;
        }
        .sidebar a:hover, .active { background: #ffc107; color: black !important; }
    </style>
</head>

<body>

<div class="sidebar">
    <a href="admin_dashboard.jsp"><i class="bi bi-speedometer2"></i> Dashboard</a>
    <a class="active" href="user_table.jsp"><i class="bi bi-people"></i> User Management</a>
    <a href="trip_table.jsp"><i class="bi bi-map"></i> Trip Bookings</a>
    <hr class="text-light">
    <a href="../logout.jsp" class="text-danger"><i class="bi bi-power"></i> Logout</a>
</div>-->
<!--
<div class="table-container">
    <h2 class="fw-bold mb-4">User Management</h2>-->

    <%
//        Connection con = null;
//        ResultSet rs = null;
//
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jakarta_tutorial","root","");
//            PreparedStatement ps = con.prepareStatement(
//                "SELECT id, name, email, username, phone_number, role, created_at FROM users ORDER BY id DESC"
//            );
//            rs = ps.executeQuery();
    %>

<!--    <table class="table table-hover table-bordered bg-white shadow-sm">
        <thead class="table-warning">
            <tr>
                <th>ID</th><th>Name</th><th>Email</th><th>Username</th>
                <th>Phone</th><th>Role</th><th>Created At</th>
                <th>Actions</th>
            </tr>
        </thead>

        <tbody>-->
        <% 
//while(rs.next()) { %>
            <!--<tr>-->
                <!--<td><%= // rs.getInt("id") %></td>-->
                <!--<td><%= // rs.getString("name") %></td>-->
                <!--<td><%= // rs.getString("email") %></td>-->
                <!--<td><%= // rs.getString("username") %></td>-->
                <!--<td><%= // rs.getString("phone_number") %></td>-->
                <!--<td><%= // rs.getString("role") %></td>-->
                <!--<td><%= // rs.getString("created_at") %></td>-->

<!--                <td>
                    <a href="edit_user_details.jsp?id=<%= // rs.getInt("id") %>"
                       class="btn btn-sm btn-primary">
                        <i class="bi bi-pencil"></i> Edit
                    </a>

                    <a onclick="return confirm('Delete this user?');"
                       href="delete_user_details.jsp?id=<%= // rs.getInt("id") %>"
                       class="btn btn-sm btn-danger">
                        <i class="bi bi-trash"></i> Delete
                    </a>
                </td>
            </tr>-->
        <% // } %>
<!--        </tbody>

    </table>-->

    <% // } catch(Exception ex) { out.print("<div class='text-danger'>"+ex.getMessage()+"</div>"); } %>

<!--</div>

</body>
</html>-->
<%@ include file="/auth.jsp" %>
<%@ include file="admin_service.jsp" %>

<%
String role = (String) session.getAttribute("role");

if (!"Admin".equalsIgnoreCase(role)) {
    response.sendRedirect("../login.jsp?error=unauthorized");
    return;
}
%>

<div class="table-container">
    <h2>User Management</h2>

    <%
    try {
        ResultSet rs = getAllUsers();
    %>

    <table class="table table-bordered">
        <tr>
            <th>ID</th><th>Name</th><th>Email</th><th>Username</th>
            <th>Phone</th><th>Role</th><th>Actions</th>
        </tr>

        <% while(rs.next()) { %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("username") %></td>
            <td><%= rs.getString("phone_number") %></td>
            <td><%= rs.getString("role") %></td>

            <td>
                <a href="edit_user_details.jsp?id=<%= rs.getInt("id") %>">Edit</a>
                <a href="delete_user_details.jsp?id=<%= rs.getInt("id") %>">Delete</a>
            </td>
        </tr>
        <% } %>
         </table>

    <% } catch(Exception e) {
        out.print(e.getMessage());
    } %>
</div>