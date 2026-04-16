<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ExploreEase | Blog</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <!-- AOS Animations -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

    <style>
        body {
            background: #f4f7fa;
            font-family: 'Poppins', sans-serif;
        }

        .page-header {
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)),
                        url('https://images.unsplash.com/photo-1507525428034-b723cf961d3e')
                        center/cover no-repeat;
            color: white;
            padding: 100px 20px;
            text-align: center;
            border-radius: 0 0 20px 20px;
        }

        .blog-card {
            border-radius: 14px;
            overflow: hidden;
            transition: 0.3s ease;
            background: white;
        }

        .blog-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        }

        .blog-img {
            height: 240px;
            width: 100%;
            object-fit: cover;
        }

        .read-more {
            font-weight: 600;
            color: #ffb703;
        }

        .read-more:hover {
            color: #fca311;
        }
    </style>
</head>

<body>

    <%@ include file="user_navbar.jsp" %>

    <!-- HEADER -->
    <div class="page-header">
        <h1 class="fw-bold">Travel Stories, Tips & Guides</h1>
        <p class="lead">Inspiring journeys from across the world</p>
    </div>

    <!-- BLOG SECTION -->
    <section class="container py-5">

        <div class="row g-4">

            <!-- BLOG #1 -->
            <div class="col-lg-4" data-aos="fade-up">
                <div class="blog-card shadow-sm">
                    <img src="https://images.unsplash.com/photo-1519608487953-e999c86e7455"
                         class="blog-img" alt="">
                    <div class="p-3">
                        <h5>Hidden Beaches of Bali</h5>
                        <p class="text-muted small">
                            Explore Bali?s secret beaches far away from the tourist rush.
                        </p>
                        <a href="#" class="read-more">Read More <i class="fa fa-arrow-right ms-1"></i></a>
                    </div>
                </div>
            </div>

            <!-- BLOG #2 -->
            <div class="col-lg-4" data-aos="fade-up" data-aos-delay="100">
                <div class="blog-card shadow-sm">
                    <img src="https://images.unsplash.com/photo-1501785888041-af3ef285b470"
                         class="blog-img">
                    <div class="p-3">
                        <h5>Adventure in the Alps</h5>
                        <p class="text-muted small">
                            A guide to breathtaking hikes and hidden scenic spots.
                        </p>
                        <a href="#" class="read-more">Read More <i class="fa fa-arrow-right ms-1"></i></a>
                    </div>
                </div>
            </div>

            <!-- BLOG #3 -->
            <div class="col-lg-4" data-aos="fade-up" data-aos-delay="200">
                <div class="blog-card shadow-sm">
                    <img src="https://images.unsplash.com/photo-1500530855697-b586d89ba3ee"
                         class="blog-img">
                    <div class="p-3">
                        <h5>Desert Safari Diaries</h5>
                        <p class="text-muted small">
                            Drift into the golden dunes of Dubai and Abu Dhabi.
                        </p>
                        <a href="#" class="read-more">Read More <i class="fa fa-arrow-right ms-1"></i></a>
                    </div>
                </div>
            </div>

            <!-- EXTRA BLOGS -->

            <!-- BLOG #4 -->
            <div class="col-lg-4" data-aos="fade-up">
                <div class="blog-card shadow-sm">
                    <img src="https://images.unsplash.com/photo-1454496522488-7a8e488e8606"
                         class="blog-img">
                    <div class="p-3">
                        <h5>Tokyo Nights & Neon Lights</h5>
                        <p class="text-muted small">
                            Explore the vibrant nightlife of Tokyo city.
                        </p>
                        <a href="#" class="read-more">Read More</a>
                    </div>
                </div>
            </div>

            <!-- BLOG #5 -->
            <div class="col-lg-4" data-aos="fade-up" data-aos-delay="100">
                <div class="blog-card shadow-sm">
                    <img src="https://images.unsplash.com/photo-1508057198894-247b23fe5ade"
                         class="blog-img">
                    <div class="p-3">
                        <h5>Lost in Venice</h5>
                        <p class="text-muted small">
                            Gondolas, canals & Italian romance at its peak.
                        </p>
                        <a href="#" class="read-more">Read More</a>
                    </div>
                </div>
            </div>

            <!-- BLOG #6 -->
            <div class="col-lg-4" data-aos="fade-up" data-aos-delay="200">
                <div class="blog-card shadow-sm">
                    <img src="https://images.unsplash.com/photo-1526772662000-3f88f10405ff"
                         class="blog-img">
                    <div class="p-3">
                        <h5>Safari in Kenya</h5>
                        <p class="text-muted small">
                            Witness the great migration and unmatched wildlife.
                        </p>
                        <a href="#" class="read-more">Read More</a>
                    </div>
                </div>
            </div>

        </div>

    </section>

    <!-- AOS Script -->
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>AOS.init();</script>

</body>
</html>
