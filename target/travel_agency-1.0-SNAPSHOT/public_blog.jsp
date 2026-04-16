<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ExploreEase | Blog</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <!-- AOS Animations -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f9fafb;
        }

        .blog-card {
            border-radius: 15px;
            overflow: hidden;
            transition: 0.3s ease;
        }

        .blog-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 6px 20px rgba(0,0,0,0.15);
        }

        .blog-img {
            height: 240px;
            object-fit: cover;
        }
    </style>
</head>

<body>

    <%@ include file="public_navbar.jsp" %>

    <!-- BLOG SECTION -->
    <section class="container py-5">
        <h2 class="text-center text-warning mb-5">
            <i class="fa-solid fa-feather-pointed me-2"></i>Travel Stories & Guides
        </h2>

        <div class="row g-4">

            <!-- Blog Card 1 -->
            <div class="col-md-4" data-aos="fade-up">
                <div class="card blog-card shadow-sm">
                    <img 
                        src="https://images.unsplash.com/photo-1519608487953-e999c86e7455?auto=format&fit=crop&w=800&q=80" 
                        class="blog-img w-100"
                        alt="Bali Beach"
                    >
                    <div class="card-body">
                        <h5>Hidden Beaches of Bali</h5>
                        <p class="text-muted small">
                            Discover tranquil Bali beyond the crowds ? secluded beaches,
                            crystal-clear waters, and golden sunsets.
                        </p>
                        <a href="login.jsp" class="text-warning small fw-semibold">
                            Login to Read More !! <i class="fa-solid fa-arrow-right"></i>
                        </a>
                    </div>
                </div>
            </div>

            <!-- Blog Card 2 -->
            <div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
                <div class="card blog-card shadow-sm">
                    <img 
                        src="https://images.unsplash.com/photo-1501785888041-af3ef285b470?auto=format&fit=crop&w=800&q=80" 
                        class="blog-img w-100"
                        alt="Alps Adventure"
                    >
                    <div class="card-body">
                        <h5>Adventure in the Alps</h5>
                        <p class="text-muted small">
                            Thrilling alpine hikes, snow-capped peaks, and cozy
                            mountain chalets for your dream getaway.
                        </p>
                        <a href="login.jsp" class="text-warning small fw-semibold">
                            Login to Read More !! <i class="fa-solid fa-arrow-right"></i>
                        </a>
                    </div>
                </div>
            </div>

            <!-- Blog Card 3 -->
            <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
                <div class="card blog-card shadow-sm">
                    <img 
                        src="https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=800&q=80" 
                        class="blog-img w-100"
                        alt="Desert Safari"
                    >
                    <div class="card-body">
                        <h5>Desert Safari Diaries</h5>
                        <p class="text-muted small">
                            Riding dunes, starlit dinners, and tales of adventure
                            from the Arabian sands.
                        </p>
                        <a href="login.jsp" class="text-warning small fw-semibold">
                            Login to Read More !! <i class="fa-solid fa-arrow-right"></i>
                        </a>
                    </div>
                </div>
            </div>

        </div>
    </section>

    <!-- AOS Init -->
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>

</body>
</html>
