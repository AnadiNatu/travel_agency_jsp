<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>ExploreEase | Register</title>

    <!-- Google Fonts + Bootstrap -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
          rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('https://images.unsplash.com/photo-1507525428034-b723cf961d3e')
                        center/cover no-repeat fixed;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .register-card {
            width: 100%;
            max-width: 450px;
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(15px);
            border-radius: 18px;
            padding: 35px;
            box-shadow: 0 8px 35px rgba(0,0,0,0.25);
            border: 1px solid rgba(255,255,255,0.25);
            color: #fff;
        }

        .register-card h3 {
            font-weight: 700;
        }

        .form-control, .form-select {
            border-radius: 12px;
            padding: 12px;
            border: 1px solid rgba(255,255,255,0.3);
            background: rgba(255,255,255,0.2);
            color: #fff;
        }

        .form-control::placeholder {
            color: #f1f1f1;
        }

        .form-control:focus, .form-select:focus {
            border-color: #ffc107;
            box-shadow: 0 0 5px #ffc107;
        }

        .btn-warning {
            font-weight: 600;
            border-radius: 12px;
            padding: 12px;
            transition: 0.3s ease;
        }

        .btn-warning:hover {
            background: #ffcf3a;
            transform: translateY(-2px);
        }

        a {
            color: #ffe27a;
        }

        a:hover {
            color: #ffd24d;
        }

        .alert {
            border-radius: 10px;
        }

        @media (max-width: 480px) {
            .register-card {
                padding: 25px;
            }
            .register-card h3 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>

<body>

<div class="register-card">

    <h3 class="text-center mb-3 text-warning">Create an Account</h3>

    <% if ("exists".equals(request.getParameter("error"))) { %>
        <div class="alert alert-danger text-center py-2">
            User already exists!
        </div>
    <% } %>

    <!-- Registration Form -->
    <form method="POST" action="code_register.jsp">

        <div class="mb-3">
            <label class="form-label">Full Name</label>
            <input type="text" name="name" class="form-control" placeholder="Your Name" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" name="email" class="form-control" placeholder="Your Email" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Username</label>
            <input type="text" name="username" class="form-control" placeholder="Choose a Username" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" name="password" class="form-control" placeholder="Create Password" required>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label class="form-label">Age</label>
                <input type="number" name="age" class="form-control" placeholder="Age" required>
            </div>

            <div class="col-md-6 mb-3">
                <label class="form-label">Date of Birth</label>
                <input type="date" name="dob" class="form-control" required>
            </div>
        </div>

        <div class="mb-3">
            <label class="form-label">Phone Number</label>
            <input type="text" name="phone_number" class="form-control" placeholder="Phone Number" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Role</label>
            <select name="role" class="form-select">
                <option value="User" selected>User</option>
                <option value="Admin">Admin</option>
            </select>
        </div>

        <button type="submit" class="btn btn-warning w-100 mt-2">Register</button>

        <% if ("missing".equals(request.getParameter("error"))) { %>
    <div class="alert alert-warning text-center py-2">
        Please fill all required fields!
    </div>
<% }%>
    </form>

    <p class="text-center mt-3 mb-0">
        Already have an account?
        <a href="login.jsp" class="fw-semibold">Login here</a>
    </p>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
