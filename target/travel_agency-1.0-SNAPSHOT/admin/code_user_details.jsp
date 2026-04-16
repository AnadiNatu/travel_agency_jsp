<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Code Users Details</title>
    </head>
    <body>
        <h1>Code Users Details</h1>
    </body>
</html>

<%@page import="java.sql.*"%>
<%@include file="../auth.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>User Details | Admin</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"/>
</head>

<body class="p-4">

<h3 class="text-warning fw-bold">Registered Users</h3>
<hr>

<table class="table table-bordered table-striped">
<thead class="table-warning">
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Username</th>
    <th>Email</th>
    <th>Phone</th>
    <th>Action</th>
</tr>
</thead>

<tbody>

<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jakarta_tutorial","root","");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM users");

    while (rs.next()) {
%>

<tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getString("username") %></td>
    <td><%= rs.getString("email") %></td>
    <td><%= rs.getString("phone_number") %></td>

    <td>
        <a href="edit_user_details.jsp?id=<%= rs.getInt("id") %>" class="btn btn-sm btn-primary">Edit</a>
        <a href="delete_user_details.jsp?id=<%= rs.getInt("id") %>" class="btn btn-sm btn-danger">Delete</a>
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
