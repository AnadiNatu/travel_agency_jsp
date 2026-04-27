<%@ include file="./WEB-INF/includes/db.jsp" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Public Tours | ExploreEase</title>
  <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,600;1,300&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/global.css">
</head>
<body style="background:var(--ivory);">

<%@ include file="public_navbar.jsp" %>

<div class="page-header">
  <div class="container" style="position:relative;z-index:2;">
    <span class="ee-section__label">Explore Destinations</span>
    <h1 style="color:white;margin:0;">Available Tours</h1>
  </div>
</div>

<div class="container py-5">
  <div class="row g-4">
  <%
    try {
      Connection con = getConnection();
      Statement st = con.createStatement();
      ResultSet rs = st.executeQuery("SELECT * FROM trips WHERE user_id IS NULL ORDER BY id DESC");

      while (rs.next()) {
        String img = rs.getString("destination_image");
        if (img == null || img.isEmpty()) {
          img = "https://images.unsplash.com/photo-1488646953014-85cb44e25828?w=600";
        }
  %>
    <div class="col-md-4">
      <div class="ee-card">
        <div style="overflow:hidden;">
          <img src="<%= img %>" class="ee-card__img" alt="<%= rs.getString("tour_title") %>">
        </div>
        <div class="ee-card__body">
          <h5 class="ee-card__title"><%= rs.getString("tour_title") %></h5>
          <p class="ee-card__meta">
            <i class="bi bi-geo-alt"></i> <%= rs.getString("city") %>, <%= rs.getString("country") %>
          </p>
          <p style="font-size:0.82rem;color:var(--text-light);"><i class="bi bi-calendar3"></i> <%= rs.getString("travel_date") %></p>
          <a href="<%=request.getContextPath()%>/login.jsp?redirect=booking" class="btn-ee btn-ee--primary" style="width:100%;justify-content:center;">Login to Book</a>
        </div>
      </div>
    </div>
  <%
      }
      rs.close();
      st.close();
      con.close();
    } catch (Exception e) {
      out.println("<div class='ee-alert ee-alert--danger'>" + e.getMessage() + "</div>");
    }
  %>
  </div>
</div>

<footer class="ee-footer">
  <div class="container">
    <p>&copy; <%= java.time.Year.now() %> ExploreEase. All Rights Reserved.</p>
  </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>