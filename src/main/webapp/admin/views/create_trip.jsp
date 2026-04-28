<%@ include file="../../auth.jsp" %>
<%@ include file="../admin_service.jsp" %>
<%--<%@ page contentType="text/html;charset=UTF-8" %>--%>
<%
  String role = (String) session.getAttribute("role");
  if (role == null || !"Admin".equalsIgnoreCase(role)) {
    response.sendRedirect(request.getContextPath() + "/login.jsp?error=unauthorized");
    return;
  }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Create Trip | Admin</title>
  <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@600&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/global.css">
</head>
<body>

<%@ include file="../admin_navbar.jsp" %>

<div class="admin-content">
  <div style="margin-bottom:2rem;">
    <span class="ee-section__label">Add New</span>
    <h2 style="color:var(--ocean);margin:0;">Create Trip</h2>
  </div>

  <div style="max-width:680px;background:var(--white);border-radius:var(--radius-md);padding:2.5rem;box-shadow:var(--shadow-md);">
    <form action="<%=request.getContextPath()%>/admin/controller/create_trip_action.jsp" method="post" enctype="multipart/form-data">
      <div class="row">
        <div class="col-md-6">
          <div class="ee-form-group">
            <label>Tour Title</label>
            <input type="text" name="tour_title" class="ee-input" required>
          </div>
        </div>
        <div class="col-md-6">
          <div class="ee-form-group">
            <label>Country</label>
            <input type="text" name="country" class="ee-input" required>
          </div>
        </div>
        <div class="col-md-6">
          <div class="ee-form-group">
            <label>City</label>
            <input type="text" name="city" class="ee-input" required>
          </div>
        </div>
        <div class="col-md-6">
          <div class="ee-form-group">
            <label>Travel Date</label>
            <input type="date" name="travel_date" class="ee-input" required>
          </div>
        </div>
        <div class="col-12">
          <div class="ee-form-group">
            <label>Destination Image</label>
            <input type="file" name="image" class="ee-input" required>
          </div>
        </div>
      </div>
      <div style="display:flex;gap:1rem;margin-top:0.5rem;">
        <button type="submit" class="btn-ee btn-ee--primary">
          <i class="bi bi-check-circle"></i> Create Trip
        </button>
        <a href="<%=request.getContextPath()%>/admin/views/admin_dashboard.jsp" class="btn-ee btn-ee--ocean">
          <i class="bi bi-arrow-left"></i> Back
        </a>
      </div>
    </form>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>