<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ include file="../../auth.jsp"%>

<%
if (!"Admin".equalsIgnoreCase((String)session.getAttribute("role"))) {
    response.sendRedirect(request.getContextPath() + "/login.jsp?error=unauthorized");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Trip Details | Admin</title>
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@600&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/global.css">
</head>

<body>

<%@ include file="../admin_navbar.jsp" %>

<div class="admin-content">
<h3 style="color:var(--ocean);">All Trip Bookings</h3>
<hr>

<div style="overflow-x:auto;">
<table class="ee-table">
<thead>
<tr>
    <th>ID</th>
    <th>User ID</th>
    <th>City</th>
    <th>Country</th>
    <th>Email</th>
    <th>Status</th>
    <th>Action</th>
</tr>
</thead>

<tbody>

<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jakarta_tutorial","root","");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM trips ORDER BY id DESC");

    while (rs.next()) {
%>

<tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getInt("user_id") %></td>
    <td><%= rs.getString("city") %></td>
    <td><%= rs.getString("country") %></td>
    <td><%= rs.getString("email") %></td>
    <td><%= rs.getString("status") %></td>
    <td>
        <a href="<%=request.getContextPath()%>/admin/views/edit_booking_details.jsp?id=<%= rs.getInt("id") %>" class="btn-ee btn-ee--ocean btn-ee--sm">Edit</a>
        <a href="<%=request.getContextPath()%>/admin/controller/delete_booking.jsp?id=<%= rs.getInt("id") %>" class="btn-ee btn-ee--danger btn-ee--sm">Delete</a>
    </td>
</tr>

<%
    }

    rs.close();
    con.close();

} catch(Exception e) {
    out.print("<tr><td colspan='7' class='text-danger'>Error: "+e.getMessage()+"</td></tr>");
}
%>

</tbody>
</table>
</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>