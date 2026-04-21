<%@ include file="../auth.jsp" %>
<%@ include file="admin_service.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
String role = (String) session.getAttribute("role");

if (role == null || !"Admin".equalsIgnoreCase(role)) {
    response.sendRedirect("../login.jsp?error=unauthorized");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Create Trip</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<style>
body {
    background: #f5f6fa;
}

.main-content {
    margin-left: 260px;
    padding: 30px;
}

.card {
    border-radius: 15px;
}

.form-control {
    border-radius: 8px;
}

</style>
</head>

<body>

<%@ include file="admin_navbar.jsp" %>

<div class="main-content">

<div class="container">

<div class="card shadow-lg p-4">

<h3 class="mb-4 text-success fw-bold">
    <i class="bi bi-plus-circle"></i> Create New Trip
</h3>

<form action="actions/create_trip_action.jsp" method="post" enctype="multipart/form-data">
<div class="row">

<div class="col-md-6 mb-3">
<label>Tour Title</label>
<input type="text" name="tour_title" class="form-control" required>
</div>

<div class="col-md-6 mb-3">
<label>Country</label>
<input type="text" name="country" class="form-control" required>
</div>

</div>

<div class="row">

<div class="col-md-6 mb-3">
<label>City</label>
<input type="text" name="city" class="form-control" required>
</div>

<div class="col-md-6 mb-3">
<label>Travel Date</label>
<input type="date" name="travel_date" class="form-control" required>
</div>

</div>

<div class="mb-3">
<label>Destination Image</label>
<input type="file" name="image" class="form-control" required>
</div>

<button class="btn btn-success px-4">
    <i class="bi bi-check-circle"></i> Create Trip
</button>

<a href="admin_dashboard.jsp" class="btn btn-secondary ms-2">
    Back
</a>

</form>

</div>

</div>

</div>

</body>
</html>