<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ExploreEase | Register</title>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,600;1,300&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/global.css">
    <style>
        body {
            background: url('https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=1600')
                        center/cover no-repeat fixed;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        .register-card {
            width: 100%;
            max-width: 480px;
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(15px);
            border-radius: 18px;
            padding: 35px;
            box-shadow: 0 8px 35px rgba(0,0,0,0.25);
            border: 1px solid rgba(255,255,255,0.25);
            color: #fff;
        }
    </style>
</head>
<body>

<div class="register-card">
    <h3 class="text-center mb-3 text-gold">Create an Account</h3>

    <% if ("exists".equals(request.getParameter("error"))) { %>
        <div class="alert alert-danger text-center py-2">User already exists!</div>
    <% } %>
    <% if ("missing".equals(request.getParameter("error"))) { %>
        <div class="alert alert-warning text-center py-2">Please fill all required fields!</div>
    <% } %>

    <form method="POST" action="<%=request.getContextPath()%>/code_register.jsp">
        <div class="mb-3">
            <label class="form-label">Full Name</label>
            <input type="text" name="name" class="ee-input ee-input--glass" placeholder="Your Name" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" name="email" class="ee-input ee-input--glass" placeholder="Your Email" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Username</label>
            <input type="text" name="username" class="ee-input ee-input--glass" placeholder="Choose a Username" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" name="password" class="ee-input ee-input--glass" placeholder="Create Password" required>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label class="form-label">Age</label>
                <input type="number" name="age" class="ee-input ee-input--glass" placeholder="Age" required>
            </div>

            <div class="col-md-6 mb-3">
                <label class="form-label">Date of Birth</label>
                <input type="date" name="dob" class="ee-input ee-input--glass" required>
            </div>
        </div>

        <div class="mb-3">
            <label class="form-label">Phone Number</label>
            <input type="text" name="phone_number" class="ee-input ee-input--glass" placeholder="Phone Number" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Role</label>
            <select name="role" class="ee-input ee-input--glass" style="color: #333;">
                <option value="User" selected>User</option>
                <option value="Admin">Admin</option>
            </select>
        </div>

        <button type="submit" class="btn-ee btn-ee--primary" style="width:100%;justify-content:center;">Register</button>
    </form>

    <p class="text-center mt-3 mb-0" style="color:rgba(255,255,255,0.7);">
        Already have an account?
        <a href="<%=request.getContextPath()%>/login.jsp" style="color:var(--gold-light);" class="fw-semibold">Login here</a>
    </p>
</div>

</body>
</html>