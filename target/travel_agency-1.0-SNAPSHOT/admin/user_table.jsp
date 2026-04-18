<%@ include file="../auth.jsp" %>
<%@ include file="admin_service.jsp" %>
<%@ page contentType="text/html;charset=UTF-8"%>

<%
String role = (String) session.getAttribute("role");

if (role == null || !"Admin".equalsIgnoreCase(role)) {
    response.sendRedirect("../login.jsp?error=unauthorized");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>User Management</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<style>
body {
    background: #f5f6fa;
    font-family: 'Poppins', sans-serif;
}

.table-card {
    border-radius: 15px;
    overflow: hidden;
}

.table thead {
    background: #343a40;
    color: white;
}

.table-hover tbody tr:hover {
    background-color: #f1f1f1;
    transition: 0.2s;
}

.badge-role {
    padding: 6px 10px;
    border-radius: 8px;
    font-size: 12px;
}

.role-admin {
    background: #ffc107;
    color: black;
}

.role-user {
    background: #0d6efd;
    color: white;
}

.action-btn {
    margin-right: 5px;
}

.main-content{
    margin-left: 260px;   /* same as sidebar width */
    padding: 30px;
}
</style>

</head>

<body>

<%@ include file="admin_navbar.jsp" %>

<div class="main-content">

<div class="card shadow table-card p-4">

<h3 class="mb-4 fw-bold text-warning">
    <i class="bi bi-people"></i> User Management
</h3>

<div class="table-responsive">

<%
try {
    ResultSet rs = getAllUsers();
%>

<table class="table table-hover align-middle text-center">

<thead>
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Username</th>
    <th>Phone</th>
    <th>Role</th>
    <th>Actions</th>
</tr>
</thead>

<tbody>

<% while(rs.next()) { %>

<tr>
    <td><strong>#<%= rs.getInt("id") %></strong></td>

    <td>
        <i class="bi bi-person-circle me-1"></i>
        <%= rs.getString("name") %>
    </td>

    <td><%= rs.getString("email") %></td>

    <td>
        <span class="text-muted">@<%= rs.getString("username") %></span>
    </td>

    <td><%= rs.getString("phone_number") %></td>

    <td>
        <% if("Admin".equalsIgnoreCase(rs.getString("role"))) { %>
            <span class="badge badge-role role-admin">Admin</span>
        <% } else { %>
            <span class="badge badge-role role-user">User</span>
        <% } %>
    </td>

    <td>

        <!-- EDIT BUTTON -->
        <a href="edit_user_details.jsp?id=<%= rs.getInt("id") %>"
           class="btn btn-sm btn-primary action-btn">
            <i class="bi bi-pencil"></i>
        </a>

        <!-- DELETE BUTTON -->
        <a href="delete_user_details.jsp?id=<%= rs.getInt("id") %>"
           onclick="return confirm('Are you sure you want to delete this user?');"
           class="btn btn-sm btn-danger action-btn">
            <i class="bi bi-trash"></i>
        </a>

    </td>
</tr>

<% } %>

</tbody>

</table>

<%
} catch(Exception e) {
    out.print("<div class='alert alert-danger'>" + e.getMessage() + "</div>");
}
%>

</div>
</div>

</div>

</body>
</html>