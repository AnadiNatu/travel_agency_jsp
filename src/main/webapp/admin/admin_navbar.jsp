<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/global.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<div class="admin-sidebar">
  <div class="admin-sidebar__brand">
    <i class="bi bi-compass"></i> ExploreEase
  </div>

  <a href="<%=request.getContextPath()%>/admin/views/admin_dashboard.jsp">
    <i class="bi bi-speedometer2"></i> Dashboard
  </a>
  <a href="<%=request.getContextPath()%>/admin/views/user_table.jsp">
    <i class="bi bi-people"></i> Users
  </a>
  <a href="<%=request.getContextPath()%>/admin/views/trip_table.jsp">
    <i class="bi bi-map"></i> Trips
  </a>
  <a href="<%=request.getContextPath()%>/admin/views/create_trip.jsp">
    <i class="bi bi-plus-circle"></i> New Trip
  </a>

  <hr class="admin-sidebar__divider">

  <a href="<%=request.getContextPath()%>/logout.jsp" class="danger">
    <i class="bi bi-box-arrow-right"></i> Logout
  </a>
</div>