<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Login | Explore Ease</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: "Poppins", sans-serif;
            margin: 0;
            height: 100vh;
            background: linear-gradient(rgba(0,0,0,0.35), rgba(0,0,0,0.45)),
                        url('https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=1600&q=80')
                        center/cover no-repeat;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-card {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            padding: 35px 30px;
            border-radius: 16px;
            width: 380px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.25);
            color: #fff;
        }

        .login-card h3 {
            font-weight: 600;
        }

        .login-card label {
            font-weight: 500;
        }

        .form-control {
            border-radius: 10px;
        }

        .btn-login {
            border-radius: 10px;
            font-weight: 600;
            background: #ffc107;
            border: none;
            color: #333;
        }

        .btn-login:hover {
            background: #ffcf33;
        }

        a {
            text-decoration: none;
            font-weight: 500;
        }

        a:hover {
            opacity: 0.8;
        }

        .bottom-links a {
            color: #ffc107;
            margin: 5px;
            display: inline-block;
        }

    </style>
</head>

<body>

<div class="login-card">

    <h3 class="text-center mb-3">
        <i class="fa-solid fa-plane-departure text-warning"></i>  
        Explore Ease Login
    </h3>

    <% 
        String error = request.getParameter("error");
        if ("missing".equals(error)) {
    %>
        <div class="alert alert-warning py-2">Please enter username & password.</div>

    <% } else if ("invalid".equals(error)) { %>
        <div class="alert alert-danger py-2">Invalid credentials.</div>

    <% } else if ("loginrequired".equals(error)) { %>
        <div class="alert alert-info py-2">Please login first.</div>

    <% } else if ("invalid_session".equals(error)) { %>
        <div class="alert alert-danger py-2">Session expired. Please login again.</div>

    <% } %>

    <!-- LOGIN FORM -->
    <form action="code_login.jsp" method="post" class="mt-3">

        <div class="mb-3">
            <label><i class="fa-solid fa-user"></i> Username</label>
            <input name="username" type="text" class="form-control" required>
        </div>

        <div class="mb-3">
            <label><i class="fa-solid fa-lock"></i> Password</label>
            <input name="password" type="password" class="form-control" required>
        </div>

        <button class="btn btn-login w-100 mt-2">Login</button>

    </form>

    <!-- QUICK DEV LINKS (kept but now styled properly) -->
    <div class="bottom-links text-center mt-4">
        <a href="home.jsp">Home</a> |
        <a href="register.jsp">Register</a> |
        <a href="./user/user_dashboard.jsp">User Dashboard</a> |
        <a href="./admin/admin_dashboard.jsp">Admin Dashboard</a>
    </div>

    <p class="text-center mt-3">
        Don't have an account?  
        <a href="register.jsp" class="text-warning">Register</a>
    </p>

</div>

</body>
</html>
