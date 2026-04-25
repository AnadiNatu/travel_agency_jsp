

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Code Trip Details</title>
    </head>
    <body>
        <h1>Code Trip Details</h1>
    </body>
</html>

<%@page import="java.sql.*"%>
<%@include file="../auth.jsp"%>

<%
if (!"Admin".equalsIgnoreCase((String)session.getAttribute("role"))) {
    response.sendRedirect("../login.jsp?error=unauthorized");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Trip Details | Admin</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"/>
</head>

<body class="p-4">

<h3 class="text-warning fw-bold">All Trip Bookings</h3>
<hr>

<table class="table table-bordered table-striped">
<thead class="table-warning">
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
        <a href="edit_booing_details.jsp?id=<%= rs.getInt("id") %>" class="btn btn-sm btn-primary">Edit</a>
        <a href="delete_trip_details.jsp?id=<%= rs.getInt("id") %>" class="btn btn-sm btn-danger">Delete</a>
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

</body>
</html>
