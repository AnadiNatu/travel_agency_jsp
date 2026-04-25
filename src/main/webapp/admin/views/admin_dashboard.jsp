<%@ include file="../../auth.jsp" %>
<%@ include file="../admin_service.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
  String role = (String) session.getAttribute("role");
  if (role == null || !"Admin".equalsIgnoreCase(role)) {
    response.sendRedirect(request.getContextPath() + "/login.jsp?error=unauthorized");
    return;
  }
  int userCount = 0, tripCount = 0, pending = 0;
  try {
    userCount = getTotalUsers();
    tripCount = getTotalTrips();
    pending   = getPendingBookings();
  } catch (Exception e) { /* handled below */ }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin Dashboard | ExploreEase</title>
  <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@600&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/global.css">
</head>
<body>

<%@ include file="../admin_navbar.jsp" %>

<div class="admin-content">
  <div style="margin-bottom:2rem;">
    <span class="ee-section__label">Overview</span>
    <h2 style="color:var(--ocean);margin:0;">Dashboard</h2>
  </div>

  <div class="row g-4 mb-5">
    <div class="col-md-4">
      <div class="stat-card">
        <div class="stat-card__label">Total Users</div>
        <div class="stat-card__value"><%= userCount %></div>
        <i class="bi bi-people stat-card__icon"></i>
      </div>
    </div>
    <div class="col-md-4">
      <div class="stat-card">
        <div class="stat-card__label">Total Trips</div>
        <div class="stat-card__value"><%= tripCount %></div>
        <i class="bi bi-map stat-card__icon"></i>
      </div>
    </div>
    <div class="col-md-4">
      <div class="stat-card">
        <div class="stat-card__label">Pending Bookings</div>
        <div class="stat-card__value"><%= pending %></div>
        <i class="bi bi-clock-history stat-card__icon"></i>
      </div>
    </div>
  </div>

  <div>
    <h4 style="font-family:'Cormorant Garamond',serif;color:var(--ocean);margin-bottom:1.2rem;">Quick Access</h4>
    <div style="display:flex;gap:1rem;flex-wrap:wrap;">
      <a href="<%=request.getContextPath()%>/admin/views/user_table.jsp" class="btn-ee btn-ee--ocean"><i class="bi bi-people"></i> Manage Users</a>
      <a href="<%=request.getContextPath()%>/admin/views/trip_table.jsp" class="btn-ee btn-ee--primary"><i class="bi bi-map"></i> Manage Trips</a>
      <a href="<%=request.getContextPath()%>/admin/views/create_trip.jsp" class="btn-ee btn-ee--outline" style="color:var(--ocean);border-color:var(--ocean);"><i class="bi bi-plus-circle"></i> Create Trip</a>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>