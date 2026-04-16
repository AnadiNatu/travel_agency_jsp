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
<body>  
<nav class="navbar navbar-expand-lg shadow-sm sticky-top py-3 px-4">
    
    <a href="home.jsp" class="navbar-brand fw-bold fs-4 text-warning">ExploreEase</a>

    <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navMenu">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navMenu">

        <ul class="navbar-nav mx-auto">
            <li class="nav-item"><a href="home.jsp" class="nav-link active">Home</a></li>
            <li class="nav-item"><a href="public_tour.jsp" class="nav-link">Tours</a></li>
            <li class="nav-item"><a href="public_blog.jsp" class="nav-link">Blog</a></li>
            <li class="nav-item"><a href="public_contact.jsp" class="nav-link">Contact</a></li>
        </ul>

        <div class="d-flex">
            <a href="login.jsp" class="btn btn-outline-dark me-2 px-3">Login</a>
            <a href="register.jsp" class="btn btn-warning px-3 text-dark fw-semibold">Register</a>
        </div>

    </div>
</nav>
    
</body>
