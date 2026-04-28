<%@ include file="../../auth.jsp" %>
<%--<%@ page contentType="text/html;charset=UTF-8" %>--%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Blog | ExploreEase</title>
  <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,600;1,300&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/global.css">
</head>
<body style="background:var(--ivory);">

<%@ include file="../user_navbar.jsp" %>

<div class="page-header">
  <div class="container" style="position:relative;z-index:2;">
    <span class="ee-section__label">Stories & Guides</span>
    <h1 style="color:white;margin:0;">Travel Blog</h1>
    <p style="color:rgba(255,255,255,0.7);margin-top:0.5rem;">Inspiring journeys from across the world</p>
  </div>
</div>

<section class="ee-section">
  <div class="container">
    <div class="row g-4">

      <div class="col-lg-4">
        <div class="ee-card">
          <div style="overflow:hidden;"><img src="https://images.unsplash.com/photo-1519608487953-e999c86e7455?w=600" class="blog-img" alt="Bali"></div>
          <div class="ee-card__body">
            <h5 class="ee-card__title">Hidden Beaches of Bali</h5>
            <p style="color:var(--text-mid);font-size:0.88rem;font-weight:300;">Explore Bali's secret beaches far away from the tourist rush.</p>
            <a href="#" style="color:var(--gold);font-weight:600;font-size:0.88rem;">Read More <i class="bi bi-arrow-right"></i></a>
          </div>
        </div>
      </div>

      <div class="col-lg-4">
        <div class="ee-card">
          <div style="overflow:hidden;"><img src="https://images.unsplash.com/photo-1501785888041-af3ef285b470?w=600" class="blog-img" alt="Alps"></div>
          <div class="ee-card__body">
            <h5 class="ee-card__title">Adventure in the Alps</h5>
            <p style="color:var(--text-mid);font-size:0.88rem;font-weight:300;">Breathtaking hikes and hidden scenic spots across Europe's roof.</p>
            <a href="#" style="color:var(--gold);font-weight:600;font-size:0.88rem;">Read More <i class="bi bi-arrow-right"></i></a>
          </div>
        </div>
      </div>

      <div class="col-lg-4">
        <div class="ee-card">
          <div style="overflow:hidden;"><img src="https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=600" class="blog-img" alt="Dubai"></div>
          <div class="ee-card__body">
            <h5 class="ee-card__title">Desert Safari Diaries</h5>
            <p style="color:var(--text-mid);font-size:0.88rem;font-weight:300;">Drift into the golden dunes of Dubai and Abu Dhabi.</p>
            <a href="#" style="color:var(--gold);font-weight:600;font-size:0.88rem;">Read More <i class="bi bi-arrow-right"></i></a>
          </div>
        </div>
      </div>

      <div class="col-lg-4">
        <div class="ee-card">
          <div style="overflow:hidden;"><img src="https://images.unsplash.com/photo-1454496522488-7a8e488e8606?w=600" class="blog-img" alt="Tokyo"></div>
          <div class="ee-card__body">
            <h5 class="ee-card__title">Tokyo Nights & Neon Lights</h5>
            <p style="color:var(--text-mid);font-size:0.88rem;font-weight:300;">Explore the vibrant nightlife and culture of Tokyo city.</p>
            <a href="#" style="color:var(--gold);font-weight:600;font-size:0.88rem;">Read More <i class="bi bi-arrow-right"></i></a>
          </div>
        </div>
      </div>

      <div class="col-lg-4">
        <div class="ee-card">
          <div style="overflow:hidden;"><img src="https://images.unsplash.com/photo-1508057198894-247b23fe5ade?w=600" class="blog-img" alt="Venice"></div>
          <div class="ee-card__body">
            <h5 class="ee-card__title">Lost in Venice</h5>
            <p style="color:var(--text-mid);font-size:0.88rem;font-weight:300;">Gondolas, canals and Italian romance at its finest peak.</p>
            <a href="#" style="color:var(--gold);font-weight:600;font-size:0.88rem;">Read More <i class="bi bi-arrow-right"></i></a>
          </div>
        </div>
      </div>

      <div class="col-lg-4">
        <div class="ee-card">
          <div style="overflow:hidden;"><img src="https://images.unsplash.com/photo-1526772662000-3f88f10405ff?w=600" class="blog-img" alt="Kenya"></div>
          <div class="ee-card__body">
            <h5 class="ee-card__title">Safari in Kenya</h5>
            <p style="color:var(--text-mid);font-size:0.88rem;font-weight:300;">Witness the great migration and unmatched African wildlife.</p>
            <a href="#" style="color:var(--gold);font-weight:600;font-size:0.88rem;">Read More <i class="bi bi-arrow-right"></i></a>
          </div>
        </div>
      </div>

    </div>
  </div>
</section>

<footer class="ee-footer"><div class="container"><p>&copy; <%= java.time.Year.now() %> ExploreEase. All Rights Reserved.</p></div></footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>