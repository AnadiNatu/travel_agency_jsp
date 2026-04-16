<%--<%@ page contentType="text/html;charset=UTF-8" %>--%>

<!-- Admin Sidebar Styles (shared) -->
<style>
    body {
        font-family: 'Poppins', sans-serif;
    }

    .admin-sidebar {
        height: 100vh;
        width: 260px;
        position: fixed;
        top: 0;
        left: 0;
        background: #343a40;
        padding-top: 20px;
        z-index: 999;
    }

    .admin-sidebar .brand {
        color: #ffc107;
        font-size: 20px;
        font-weight: 700;
        padding: 0 20px 15px 20px;
        border-bottom: 1px solid rgba(255,255,255,0.1);
        margin-bottom: 10px;
    }

    .admin-sidebar a {
        display: block;
        padding: 12px 20px;
        color: #ddd;
        text-decoration: none;
        font-weight: 500;
        font-size: 14px;
    }

    .admin-sidebar a i {
        margin-right: 8px;
    }

    .admin-sidebar a:hover,
    .admin-sidebar a.active {
        background: #ffc107;
        color: #000 !important;
    }

    .admin-sidebar hr {
        border-color: rgba(255,255,255,0.15);
        margin: 10px 0;
    }

    /* Content wrapper for admin pages */
    .admin-content {
        margin-left: 260px;
        padding: 20px;
    }
</style>

<!-- Admin Sidebar -->
<div class="admin-sidebar">
    <div class="brand">
        <i class="bi bi-compass"></i> ExploreEase Admin
    </div>

    <a href="admin_dashboard.jsp">
        <i class="bi bi-speedometer2"></i> Dashboard
    </a>

    <a href="user_table.jsp">
        <i class="bi bi-people"></i> Users
    </a>

    <a href="trip_table.jsp">
        <i class="bi bi-map"></i> Trips
    </a>

    <hr>

    <a href="../logout.jsp" class="text-danger">
        <i class="bi bi-box-arrow-right"></i> Logout
    </a>
</div>
