<%@ include file="/auth.jsp" %>
<%@ include file="admin_service.jsp" %>
<%@ page contentType="text/html;charset=UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");

String roleSession = (String) session.getAttribute("role");

if (!"Admin".equalsIgnoreCase(roleSession)) {
    response.sendRedirect("../login.jsp?error=unauthorized");
    return;
}

int id = Integer.parseInt(request.getParameter("id"));

String name = "", email = "", phone = "", role = "";

try {
    ResultSet rs = getUserById(id);

    if(rs.next()){
        name = rs.getString("name");
        email = rs.getString("email");
        phone = rs.getString("phone_number");
        role = rs.getString("role");
    }

} catch(Exception ex){
    out.print("<div class='text-danger'>Error loading user: " + ex.getMessage() + "</div>");
}

if ("POST".equalsIgnoreCase(request.getMethod())) {

    try {

        boolean success = updateUser(
            id,
            request.getParameter("name"),
            request.getParameter("email"),
            request.getParameter("phone"),
            request.getParameter("role")
        );

        if (success) {
            response.sendRedirect("user_table.jsp?msg=updated");
            return;
        }

    } catch(Exception ex) {
        out.print("<div class='text-danger'>Update Error: " + ex.getMessage() + "</div>");
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

<div class="container mt-4">

    <h3 class="text-warning fw-bold mb-3">
        <i class="bi bi-person-gear"></i> Edit User Details
    </h3>

    <div class="card shadow-sm">
        <div class="card-body">

            <form method="post">

                <div class="mb-3">
                    <label>Full Name</label>
                    <input type="text" class="form-control" name="name"
                           value="<%= name %>" required>
                </div>

                <div class="mb-3">
                    <label>Email</label>
                    <input type="email" class="form-control" name="email"
                           value="<%= email %>" required>
                </div>

                <div class="mb-3">
                    <label>Phone</label>
                    <input type="text" class="form-control" name="phone"
                           value="<%= phone %>">
                </div>

                <div class="mb-3">
                    <label>Role</label>
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