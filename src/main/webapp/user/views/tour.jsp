<%@include file="../../auth.jsp"%>
<%@include file="../user_service.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Tours | ExploreEase</title>
  <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,600;1,300&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/global.css">
</head>
<body style="background:var(--ivory);">

<%@include file="../user_navbar.jsp"%>

<div class="page-header">
  <div class="container" style="position:relative;z-index:2;">
    <span class="ee-section__label">Explore the World</span>
    <h1 style="color:white;margin:0;">Available Tours</h1>
  </div>
</div>

<div class="container py-5">
  <!-- SEARCH -->
  <form method="get" class="row g-3 mb-5" style="background:white;padding:1.5rem;border-radius:var(--radius-md);box-shadow:var(--shadow-sm);">
    <div class="col-md-5">
      <input type="text" name="search" class="ee-input" placeholder="Search destination or city..." value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">
    </div>
    <div class="col-md-4">
      <select name="country" class="ee-input">
        <option value="">All Countries</option>
        <option>India</option><option>France</option><option>Japan</option><option>UAE</option><option>Indonesia</option>
      </select>
    </div>
    <div class="col-md-3">
      <button type="submit" class="btn-ee btn-ee--primary" style="width:100%;justify-content:center;"><i class="bi bi-search"></i> Search</button>
    </div>
  </form>

  <div class="row g-4">
  <%
    try {
      ResultSet rs = getAllDestination();
      while (rs.next()) {
        String img = rs.getString("destination_image");
        if (img == null || img.isEmpty()) img = "https://images.unsplash.com/photo-1488646953014-85cb44e25828?w=600";
  %>
    <div class="col-md-4">
      <div class="ee-card">
        <div style="overflow:hidden;">
          <img src="<%= img %>" class="ee-card__img tour-card-img" alt="">
        </div>
        <div class="ee-card__body">
          <h5 class="ee-card__title"><%= rs.getString("tour_title") %></h5>
          <p class="ee-card__meta"><i class="bi bi-geo-alt-fill text-gold"></i> <%= rs.getString("city") %>, <%= rs.getString("country") %></p>
          <p style="font-size:0.82rem;color:var(--text-light);margin-bottom:1rem;"><i class="bi bi-calendar3"></i> <%= rs.getString("travel_date") %></p>
          <a href="<%=request.getContextPath()%>/user/views/booking_trip.jsp?tourTitle=<%= java.net.URLEncoder.encode(rs.getString("tour_title"), "UTF-8") %>&country=<%= java.net.URLEncoder.encode(rs.getString("country"), "UTF-8") %>&city=<%= java.net.URLEncoder.encode(rs.getString("city"), "UTF-8") %>&travel_date=<%= rs.getString("travel_date") %>"
             class="btn-ee btn-ee--primary" style="width:100%;justify-content:center;">Book Now <i class="bi bi-arrow-right"></i></a>
        </div>
      </div>
    </div>
  <%
      }
    } catch (Exception ex) { out.println("<div class='ee-alert ee-alert--danger'>" + ex.getMessage() + "</div>"); }
  %>
  </div>
</div>

<footer class="ee-footer"><div class="container"><p>&copy; <%= java.time.Year.now() %> ExploreEase. All Rights Reserved.</p></div></footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>