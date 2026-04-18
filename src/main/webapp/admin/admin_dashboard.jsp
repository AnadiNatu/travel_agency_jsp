<%@ include file="../auth.jsp" %>
<%@ include file="admin_service.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    String role = (String) session.getAttribute("role");

    // 🔐 Admin-only access (safe null check)
    if (role == null || !"Admin".equalsIgnoreCase(role)) {
        response.sendRedirect("../login.jsp?error=unauthorized");
        return;
    }

    int userCount = 0;
    int tripCount = 0;
    int pending = 0;

    try {
        userCount = getTotalUsers();
        tripCount = getTotalTrips();
        pending = getPendingBookings();
    } catch (Exception e) {
        out.print("<div class='alert alert-danger'>Error loading dashboard data</div>");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard | Explore Ease</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f5f6fa;
        }

        .sidebar {
            height: 100vh;
            width: 260px;
            position: fixed;
            left: 0;
            top: 0;
            background: #343a40;
            color: white;
            padding-top: 20px;
        }

        .sidebar a {
            display: block;
            padding: 12px 20px;
            color: #ddd;
            text-decoration: none;
            font-weight: 500;
        }

        .sidebar a:hover {
            background: #495057;
            color: white;
        }

        .sidebar .active {
            background: #ffc107;
            color: black !important;
        }

        .content-area {
            margin-left: 260px;
            padding: 30px;
        }

        .card-box {
            border-radius: 12px;
        }
    </style>
</head>

<body>

<!-- SIDEBAR -->
<div class="sidebar">

    <h4 class="text-center mb-4">Admin Panel</h4>

    <a href="admin_dashboard.jsp" class="active">
        <i class="bi bi-speedometer2"></i> Dashboard
    </a>

    <a href="user_table.jsp">
        <i class="bi bi-people"></i> User Management
    </a>

    <a href="trip_table.jsp">
        <i class="bi bi-map"></i> Trip Bookings
    </a>

    <a href="../login.jsp">
        <i class="bi bi-box-arrow-in-right"></i> Back to Login
    </a>
    
        <a href="create_trip.jsp" class="btn btn-success">
        <i class="bi bi-plus-circle"></i> New Trip
    </a>

    <hr class="text-light">

    <a href="../logout.jsp" class="text-danger">
        <i class="bi bi-power"></i> Logout
    </a>
</div>

<!-- MAIN CONTENT -->
<div class="content-area">

    <h2 class="fw-bold mb-4">Admin Dashboard</h2>

    <div class="row g-4">

        <!-- TOTAL USERS -->
        <div class="col-md-4">
            <div class="card shadow card-box p-4">
                <h5><i class="bi bi-people text-warning"></i> Total Users</h5>
                <h3 class="fw-bold text-warning"><%= userCount %></h3>
            </div>
        </div>

        <!-- TOTAL TRIPS -->
        <div class="col-md-4">
            <div class="card shadow card-box p-4">
                <h5><i class="bi bi-map text-primary"></i> Total Trips</h5>
                <h3 class="fw-bold text-primary"><%= tripCount %></h3>
            </div>
        </div>

        <!-- PENDING BOOKINGS -->
        <div class="col-md-4">
            <div class="card shadow card-box p-4">
                <h5><i class="bi bi-clock-history text-success"></i> Pending Bookings</h5>
                <h3 class="fw-bold text-success"><%= pending %></h3>
            </div>
        </div>

    </div>

    <!-- QUICK LINKS -->
    <div class="mt-5">
        <h4 class="mb-3 fw-semibold">Quick Access</h4>

        <a href="user_table.jsp" class="btn btn-dark px-4 me-2">
            <i class="bi bi-people"></i> Manage Users
        </a>

        <a href="trip_table.jsp" class="btn btn-warning px-4 text-dark">
            <i class="bi bi-map"></i> Manage Trips
        </a>
        
        <a href="create_trip.jsp" class="btn btn-success px-4 ms-2">
    <i class="bi bi-plus-circle"></i> Create Trip
</a>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>