<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>ExploreEase | Contact Us</title>

    <!-- Google Fonts + Bootstrap -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
          rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"
          rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('https://images.unsplash.com/photo-1507525428034-b723cf961d3e')
                        center/cover fixed no-repeat;
            backdrop-filter: blur(3px);
            color: #fff;
        }

        .glass-card {
            background: rgba(255, 255, 255, 0.18);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border-radius: 20px;
            padding: 35px;
            border: 1px solid rgba(255,255,255,0.25);
            box-shadow: 0 10px 30px rgba(0,0,0,0.20);
        }

        .form-control, .form-control:focus {
            border-radius: 12px;
            border: none;
            box-shadow: none;
        }

        .btn-warning {
            border-radius: 12px;
            padding: 10px 0;
            font-weight: 600;
            transition: 0.3s;
        }

        .btn-warning:hover {
            transform: translateY(-2px);
            background: #ffcc33;
        }

        .contact-info i {
            font-size: 22px;
            margin-right: 8px;
            color: #ffc107;
        }

        footer {
            margin-top: 80px;
        }
    </style>
</head>

<body>

<!-- 🌐 NAVBAR (OPTIONAL – add if needed) -->
<%@ include file="user_navbar.jsp" %>

<div class="container py-5">

    <h1 class="text-center fw-bold mb-4 text-warning">Contact Us</h1>
    <p class="text-center text-light mb-5">
        We'd love to hear from you! Reach out for travel queries, support, or collaborations.
    </p>

    <div class="row g-4">

        <!-- Contact Form -->
        <div class="col-lg-6">
            <div class="glass-card">

                <h4 class="text-warning fw-bold mb-3">Send Us a Message</h4>

                <form action="#" method="POST">

                    <div class="mb-3">
                        <label class="form-label">Full Name</label>
                        <input type="text" class="form-control p-3" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Email Address</label>
                        <input type="email" class="form-control p-3" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Subject</label>
                        <input type="text" class="form-control p-3" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Message</label>
                        <textarea class="form-control p-3" rows="5" required></textarea>
                    </div>

                    <button type="submit" class="btn btn-warning w-100">
                        <i class="bi bi-send-fill"></i> Send Message
                    </button>

                </form>

            </div>
        </div>

        <!-- Contact Info -->
        <div class="col-lg-6">
            <div class="glass-card h-100">

                <h4 class="text-warning fw-bold mb-3">Reach Us</h4>

                <div class="contact-info mb-3">
                    <p><i class="bi bi-geo-alt-fill"></i> ExploreEase HQ, Mumbai, India</p>
                    <p><i class="bi bi-envelope-fill"></i> support@exploreease.com</p>
                    <p><i class="bi bi-telephone-fill"></i> +91 98765 43210</p>
                </div>

                <h5 class="text-warning fw-bold mt-4">Follow Us</h5>
                <div class="d-flex gap-3 mt-2">
                    <a href="#" class="text-light fs-4"><i class="bi bi-facebook"></i></a>
                    <a href="#" class="text-light fs-4"><i class="bi bi-instagram"></i></a>
                    <a href="#" class="text-light fs-4"><i class="bi bi-twitter"></i></a>
                </div>

                <h5 class="text-warning fw-bold mt-4 mb-2">Location Map</h5>
                <iframe
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d241317.11610024824!2d72.74110254295029!3d19.08219783931014!2m3!1f0!2f0!3f0!3m2!
                        1i1024!2i768!4f13.1!3m3!1m2!1s0x3be9c63fe30f89df%3A0xced8b61b88d44e5!2sMumbai%2C%20Maharashtra!
                        5e0!3m2!1sen!2sin!4v1708704386694!5m2!1sen!2sin"
                        width="100%"
                        height="200"
                        style="border:0; border-radius:12px;"
                        allowfullscreen=""
                        loading="lazy">
                </iframe>

            </div>
        </div>

    </div>
</div>

<!-- Footer -->
<footer class="bg-dark text-white text-center py-3 mt-5">
    <p class="mb-0">
        &copy; <%= java.time.Year.now() %> Explore Ease Travel Agency | All Rights Reserved
    </p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
