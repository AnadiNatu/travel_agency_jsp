<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/global.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<div class="admin-sidebar">
  <div class="admin-sidebar__brand"><i class="bi bi-compass"></i> ExploreEase</div>

  <a href="${pageContext.request.contextPath}/admin/views/admin_dashboard.jsp">
    <i class="bi bi-speedometer2"></i> Dashboard
  </a>
  <a href="${pageContext.request.contextPath}/admin/views/user_table.jsp">
    <i class="bi bi-people"></i> Users
  </a>
  <a href="${pageContext.request.contextPath}/admin/views/trip_table.jsp">
    <i class="bi bi-map"></i> Trips
  </a>
  <a href="${pageContext.request.contextPath}/admin/views/create_trip.jsp">
    <i class="bi bi-plus-circle"></i> New Trip
  </a>

  <hr class="admin-sidebar__divider">

  <a href="${pageContext.request.contextPath}/logout.jsp" class="danger">
    <i class="bi bi-box-arrow-right"></i> Logout
  </a>
</div>