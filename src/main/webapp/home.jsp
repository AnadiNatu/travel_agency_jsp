<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Explore Ease | Discover Your Next Adventure</title>
  <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,600;0,700;1,300&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/global.css">
</head>
<body>

<%@ include file="public_navbar.jsp" %>

<!-- HERO -->
<section class="ee-hero">
  <div class="ee-hero__bg" style="background-image:url('https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=1600');"></div>
  <div class="ee-hero__overlay"></div>
  <div class="ee-hero__content">
    <p class="ee-hero__eyebrow">Premium Travel Experiences</p>
    <h1 class="ee-hero__title">Adventure <em>Begins</em> Here</h1>
    <p class="ee-hero__sub">Discover beautiful places, explore new cultures, and plan your dream tour with expert guidance.</p>
    <div style="display:flex;gap:1rem;justify-content:center;flex-wrap:wrap;">
      <a href="<%=request.getContextPath()%>/public_tour.jsp" class="btn-ee btn-ee--primary">Explore Tours <i class="bi bi-arrow-right"></i></a>
      <a href="<%=request.getContextPath()%>/register.jsp" class="btn-ee btn-ee--outline">Get Started</a>
    </div>
  </div>
</section>

<!-- WHY US -->
<section class="ee-section" style="background:var(--white);">
  <div class="container">
    <div class="text-center mb-5">
      <span class="ee-section__label">Why Choose Us</span>
      <h2 class="ee-section__title">Travel With <span class="text-gold">Confidence</span></h2>
      <div class="ee-divider" style="margin:1rem auto 0;"></div>
    </div>
    <div class="row g-4">
      <div class="col-md-4">
        <div style="text-align:center;padding:2rem;">
          <div style="width:64px;height:64px;background:rgba(201,168,76,0.12);border-radius:50%;display:flex;align-items:center;justify-content:center;margin:0 auto 1.2rem;font-size:1.6rem;color:var(--gold);"><i class="bi bi-star-fill"></i></div>
          <h4>Top Rated Tours</h4>
          <p style="color:var(--text-mid);font-weight:300;">World-class travel packages with exceptional customer satisfaction and 5-star reviews.</p>
        </div>
      </div>
      <div class="col-md-4">
        <div style="text-align:center;padding:2rem;">
          <div style="width:64px;height:64px;background:rgba(201,168,76,0.12);border-radius:50%;display:flex;align-items:center;justify-content:center;margin:0 auto 1.2rem;font-size:1.6rem;color:var(--gold);"><i class="bi bi-shield-check"></i></div>
          <h4>Secure Booking</h4>
          <p style="color:var(--text-mid);font-weight:300;">Safe and encrypted booking process with full transparency at every step.</p>
        </div>
      </div>
      <div class="col-md-4">
        <div style="text-align:center;padding:2rem;">
          <div style="width:64px;height:64px;background:rgba(201,168,76,0.12);border-radius:50%;display:flex;align-items:center;justify-content:center;margin:0 auto 1.2rem;font-size:1.6rem;color:var(--gold);"><i class="bi bi-geo-alt-fill"></i></div>
          <h4>Worldwide Coverage</h4>
          <p style="color:var(--text-mid);font-weight:300;">Destinations across the globe curated by our expert travel consultants.</p>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- POPULAR DESTINATIONS -->
<section class="ee-section">
  <div class="container">
    <div class="text-center mb-5">
      <span class="ee-section__label">Where To Go</span>
      <h2 class="ee-section__title">Popular <span class="text-gold">Destinations</span></h2>
      <div class="ee-divider" style="margin:1rem auto 0;"></div>
    </div>
    <div class="row g-4">
      <div class="col-md-4">
        <div class="ee-card">
          <div style="overflow:hidden;">
            <img src="https://images.unsplash.com/photo-1503899036084-c55cdd92da26?w=600" class="ee-card__img" alt="Tokyo">
          </div>
          <div class="ee-card__body">
            <h5 class="ee-card__title">Tokyo</h5>
            <p class="ee-card__meta"><i class="bi bi-geo-alt"></i> Japan</p>
            <div style="display:flex;justify-content:space-between;align-items:center;">
              <span class="ee-card__price">$800</span>
              <a href="<%=request.getContextPath()%>/login.jsp" class="btn-ee btn-ee--primary btn-ee--sm">Book Now</a>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="ee-card">
          <div style="overflow:hidden;">
            <img src="https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=600" class="ee-card__img" alt="London">
          </div>
          <div class="ee-card__body">
            <h5 class="ee-card__title">London</h5>
            <p class="ee-card__meta"><i class="bi bi-geo-alt"></i> United Kingdom</p>
            <div style="display:flex;justify-content:space-between;align-items:center;">
              <span class="ee-card__price">$1,750</span>
              <a href="<%=request.getContextPath()%>/login.jsp" class="btn-ee btn-ee--primary btn-ee--sm">Book Now</a>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="ee-card">
          <div style="overflow:hidden;">
            <img src="https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=600" class="ee-card__img" alt="Bali">
          </div>
          <div class="ee-card__body">
            <h5 class="ee-card__title">Bali</h5>
            <p class="ee-card__meta"><i class="bi bi-geo-alt"></i> Indonesia</p>
            <div style="display:flex;justify-content:space-between;align-items:center;">
              <span class="ee-card__price">$850</span>
              <a href="<%=request.getContextPath()%>/login.jsp" class="btn-ee btn-ee--primary btn-ee--sm">Book Now</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- FOOTER -->
<footer class="ee-footer">
  <div class="container">
    <p>&copy; <%= java.time.Year.now() %> ExploreEase Travel Agency. All Rights Reserved.</p>
    <p style="margin-top:0.4rem;"><a href="login.jsp">Login</a> &nbsp;·&nbsp; <a href="register.jsp">Register</a></p>
  </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>