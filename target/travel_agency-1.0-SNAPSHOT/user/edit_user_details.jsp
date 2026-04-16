<%@ page import="java.sql.*" %>
<%@ include file="../auth.jsp" %>

<%
    String authUser = (String) session.getAttribute("authUser");
    Integer userId = (Integer) session.getAttribute("id");

    if (authUser == null || userId == null) {
        response.sendRedirect("../login.jsp?error=invalid_session");
        return;
    }

    String name="", email="", username="", phone="", dob="", age="";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/jakarta_tutorial", "root", "");

        PreparedStatement ps = con.prepareStatement(
            "SELECT name,email,username,phone_number,dob,age FROM users WHERE id=?");
        ps.setInt(1, userId);

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            name = rs.getString("name");
            email = rs.getString("email");
            username = rs.getString("username");
            phone = rs.getString("phone_number");
            dob = rs.getString("dob");
            age = rs.getString("age");
        }

        rs.close(); ps.close(); con.close();

    } catch(Exception ex){
        out.print("<div class='text-danger'>Error loading profile: " + ex.getMessage() + "</div>");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit Profile | ExploreEase</title>

    <!-- STYLE LIBRARIES -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <style>
        body {
            background: url('https://images.unsplash.com/photo-1507525428034-b723cf961d3e')
                        center/cover fixed no-repeat;
            font-family: 'Poppins', sans-serif;
        }

        .glass-container {
            background: rgba(255,255,255,0.15);
            padding: 35px;
            border-radius: 20px;
            backdrop-filter: blur(18px);
            border: 1px solid rgba(255,255,255,0.25);
            box-shadow: 0 10px 28px rgba(0,0,0,0.25);
        }

        label {
            font-weight: 600;
            color: white;
        }

        .form-control {
            border-radius: 12px;
            border: none;
            padding: 10px 12px;
        }

        .btn-warning {
            background: #ffc107;
            border: none;
            font-weight: 600;
            border-radius: 12px;
        }

        .btn-warning:hover {
            background: #ffce3a;
        }

        h3 {
            color: #fff;
            font-weight: 700;
        }
    </style>
</head>

<body>

<%@ include file="user_navbar.jsp" %>

<div class="container py-5">
    <div class="col-lg-6 mx-auto glass-container">

        <h3 class="text-center mb-4">
            <i class="bi bi-person-lines-fill"></i> Edit Your Profile
        </h3>

        <form action="code_edit_user.jsp" method="post">

            <input type="hidden" name="id" value="<%= userId %>">

            <div class="mb-3">
                <label>Full Name</label>
                <input type="text" name="name" class="form-control" value="<%= name %>" required>
            </div>

            <div class="mb-3">
                <label>Username</label>
                <input type="text" name="username" class="form-control" value="<%= username %>" required>
            </div>

            <div class="mb-3">
                <label>Email</label>
                <input type="email" name="email" class="form-control" value="<%= email %>" required>
            </div>

            <div class="mb-3">
                <label>Phone Number</label>
                <input type="text" name="phone_number" class="form-control" value="<%= phone %>">
            </div>

            <div class="row g-3">
                <div class="col-md-6">
                    <label>Date of Birth</label>
                    <input type="date" name="dob" class="form-control" value="<%= dob %>">
                </div>

                <div class="col-md-6">
                    <label>Age</label>
                    <input type="number" name="age" class="form-control" value="<%= age %>">
                </div>
            </div>

            <button class="btn btn-warning w-100 mt-4">
                <i class="bi bi-check-circle"></i> Save Changes
            </button>

        </form>

    </div>
</div>

<%@ include file="user_footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
