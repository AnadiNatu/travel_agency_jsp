<%@include file="../auth.jsp" %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html;charset=UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");

int id = Integer.parseInt(request.getParameter("id"));
String name = "" , email = "" , phone = "" , role = "";

/***********************
    LOAD USER DETAILS
***********************/
try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/jakarta_tutorial" , "root" , ""
    );

    PreparedStatement ps = con.prepareStatement(
        "SELECT name , email , phone_number , role FROM users WHERE id=?"
    );
    ps.setInt(1 , id);
    ResultSet rs = ps.executeQuery();

    if(rs.next()){
        name = rs.getString("name");
        email = rs.getString("email");
        phone = rs.getString("phone_number");
        role = rs.getString("role");
    }

    rs.close();
    ps.close();
    con.close();
}catch(Exception ex){
    out.print("<div class='text-danger'>Error loading user: " + ex.getMessage() + "</div>");
}


/*************************************
    PROCESS UPDATE ONLY ON POST
*************************************/
if ("POST".equalsIgnoreCase(request.getMethod())) {

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/jakarta_tutorial", "root", ""
        );

        PreparedStatement ps = con.prepareStatement(
            "UPDATE users SET name=?, email=?, phone_number=?, role=? WHERE id=?"
        );

        ps.setString(1, request.getParameter("name"));
        ps.setString(2, request.getParameter("email"));
        ps.setString(3, request.getParameter("phone"));
        ps.setString(4, request.getParameter("role"));
        ps.setInt(5, id);

        ps.executeUpdate();
        con.close();

        response.sendRedirect("user_table.jsp?msg=updated");
        return;

    } catch(Exception ex) {
        out.print("<div class='text-danger'>Update Error: "+ex.getMessage()+"</div>");
    }
}
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Edit User | Admin</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
</head>

<body class="bg-light">

<%@ include file="admin_navbar.jsp" %>

<div class="admin-content p-4">

    <h3 class="text-warning fw-bold mb-3">
        <i class="bi bi-person-gear"></i> Edit User Details
    </h3>

    <div class="card shadow-sm">
        <div class="card-body">

            <form method="post">
                <input type="hidden" name="id" value="<%= id %>">

                <div class="mb-3">
                    <label class="form-label">Full Name</label>
                    <input type="text" class="form-control" name="name"
                           value="<%= name %>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" class="form-control" name="email"
                           value="<%= email %>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Phone Number</label>
                    <input type="text" class="form-control" name="phone"
                           value="<%= phone %>">
                </div>

                <div class="mb-3">
                    <label class="form-label">Role</label>
                    <select name="role" class="form-select">
                        <option value="User"  <%= "User".equalsIgnoreCase(role) ? "selected" : "" %>>User</option>
                        <option value="Admin" <%= "Admin".equalsIgnoreCase(role) ? "selected" : "" %>>Admin</option>
                    </select>
                </div>

                <button class="btn btn-warning">
                    <i class="bi bi-save"></i> Save Changes
                </button>
                <a href="user_table.jsp" class="btn btn-secondary ms-2">Back</a>
            </form>

        </div>
    </div>
</div>

</body>
</html>
