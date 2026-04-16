<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Explore Ease | Discover Your Next Adventure</title>

    <!-- Google Fonts + Bootstrap + Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f4f5f7;
        }

        /* NAVBAR */
        .navbar {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(5px);
        }

        /* HERO */
        .hero-section {
            height: 92vh;
            background: linear-gradient(rgba(0, 0, 0, 0.55), rgba(0, 0, 0, 0.45)),
            url('https://images.unsplash.com/photo-1507525428034-b723cf961d3e') center/cover no-repeat;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
        }

        .hero-title {
            font-size: 4rem;
            font-weight: 700;
            animation: fadeInUp 1s ease forwards;
        }

        .hero-sub {
            font-size: 1.3rem;
            animation: fadeInUp 1.4s ease forwards;
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(40px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* DESTINATION CARDS */
        .destination-card {
            transition: 0.3s ease;
            border-radius: 12px;
            overflow: hidden;
            background: white;
        }

        .destination-card img {
            height: 230px;
            width: 100%;
            object-fit: cover;
        }

        .destination-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 10px 26px rgba(0,0,0,0.2);
        }

        /* FEATURES */
        .feature-box {
            background: white;
            border-radius: 12px;
            padding: 22px;
            box-shadow: 0 5px 18px rgba(0,0,0,0.08);
            transition: 0.3s ease;
        }

        .feature-box:hover {
            transform: translateY(-6px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        }

        /* FOOTER */
        .footer {
            background: #111;
            color: #bfbfbf;
            padding: 25px 0;
        }
    </style>
</head>

<body>

<!-- 🔹 NAVBAR -->
<!--<nav class="navbar navbar-expand-lg shadow-sm sticky-top py-3 px-4">
    <a href="home.jsp" class="navbar-brand fw-bold fs-4 text-warning">ExploreEase</a>

    <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navMenu">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navMenu">

        <ul class="navbar-nav mx-auto">
            <li class="nav-item"><a href="home.jsp" class="nav-link active">Home</a></li>
            <li class="nav-item"><a href="tour.jsp" class="nav-link">Tours</a></li>
            <li class="nav-item"><a href="blog.jsp" class="nav-link">Blog</a></li>
            <li class="nav-item"><a href="contact.jsp" class="nav-link">Contact</a></li>
        </ul>

        <div class="d-flex">
            <a href="login.jsp" class="btn btn-outline-dark me-2 px-3">Login</a>
            <a href="register.jsp" class="btn btn-warning px-3 text-dark fw-semibold">Register</a>
        </div>

    </div>
</nav>-->
<%@ include file="public_navbar.jsp" %>

<!-- 🔹 HERO SECTION -->
<section class="hero-section">
    <div>
        <h1 class="hero-title">Adventure Begins Here</h1>
        <p class="hero-sub">Discover beautiful places, explore new cultures, and plan your dream tour</p>
        <a href="public_tour.jsp" class="btn btn-warning px-4 py-2 mt-3 fw-semibold">
            Explore Tours <i class="bi bi-arrow-right-circle ms-1"></i>
        </a>
    </div>
</section>

<!-- 🔹 WHY TRAVEL WITH US -->
<section class="container py-5">
    <h2 class="fw-bold text-center mb-4">Why <span class="text-warning">Choose Us?</span></h2>

    <div class="row g-4 text-center">

        <div class="col-md-4">
            <div class="feature-box">
                <i class="bi bi-star-fill text-warning fs-2"></i>
                <h5 class="mt-3">Top Rated Tours</h5>
                <p class="text-muted">We provide world-class travel packages with top customer satisfaction.</p>
            </div>
        </div>

        <div class="col-md-4">
            <div class="feature-box">
                <i class="bi bi-shield-check text-warning fs-2"></i>
                <h5 class="mt-3">Secure Payments</h5>
                <p class="text-muted">Safe & secure booking with encrypted payment options.</p>
            </div>
        </div>

        <div class="col-md-4">
            <div class="feature-box">
                <i class="bi bi-geo-alt-fill text-warning fs-2"></i>
                <h5 class="mt-3">Worldwide Coverage</h5>
                <p class="text-muted">Choose from destinations across the globe with expert guidance.</p>
            </div>
        </div>

    </div>
</section>

<!-- 🔹 POPULAR DESTINATIONS -->
<section class="container py-5">
    <h2 class="fw-bold text-center mb-4">
        Popular <span class="text-warning">Destinations</span>
    </h2>

    <div class="row g-4">

        <!-- Tokyo -->
        <div class="col-md-4">
            <div class="destination-card">
                <img src="https://images.unsplash.com/photo-1503899036084-c55cdd92da26" alt="Tokyo">
                <div class="p-3 text-center">
                    <h5>Tokyo</h5>
                    <p class="text-muted">$800</p>
                </div>
            </div>
        </div>

        <!-- London -->
        <div class="col-md-4">
            <div class="destination-card">
                <img src="https://images.unsplash.com/photo-1469474968028-56623f02e42e" alt="London">
                <div class="p-3 text-center">
                    <h5>London</h5>
                    <p class="text-muted">$1750</p>
                </div>
            </div>
        </div>

        <!-- Singapore -->
        <div class="col-md-4">
            <div class="destination-card">
                <img src="https://images.unsplash.com/photo-1506744038136-46273834b3fb" alt="Singapore">
                <div class="p-3 text-center">
                    <h5>Singapore</h5>
                    <p class="text-muted">$850</p>
                </div>
            </div>
        </div>

    </div>
</section>

<!-- 🔹 FOOTER -->
<footer class="footer text-center">
    <p class="mb-0">
        &copy; <%= java.time.Year.now() %> ExploreEase Travel Agency | All Rights Reserved
    </p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
