<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Explore Ease | Tours</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
        }
        .hero-section {
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.7)),
                        url('https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=1400&q=80') 
                        center/cover;
            color: white;
            padding: 100px 20px;
        }
        .card {
            border: none;
            transition: all 0.3s ease;
        }
        .card:hover {
            transform: translateY(-6px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        }
    </style>
</head>

<body>

<%@ include file="public_navbar.jsp" %>

<section class="hero-section text-center">
    <h1 class="display-5 fw-bold">Explore Our Exclusive Tours</h1>
    <p class="lead">Choose your perfect trip and start your adventure today.</p>
</section>

<section class="container py-5">
    <div class="row g-4">

        <!-- Bali -->
        <div class="col-md-4">
            <div class="card rounded-4 shadow-sm">
                <img src="https://images.unsplash.com/photo-1493558103817-58b2924bce98?auto=format&fit=crop&w=900&q=80"
                     class="card-img-top" style="height:230px; object-fit:cover;">

                <div class="card-body">
                    <h5 class="card-title fw-semibold">Bali Getaway</h5>
                    <p class="text-muted small"><i class="fa-solid fa-location-dot text-warning"></i> Bali, Indonesia</p>

                    <p class="text-muted">Discover serene beaches & Balinese culture.</p>

                    <p><strong>Price:</strong> $899</p>

                    <a href="login.jsp"
                       class="btn btn-warning w-100">Login To Book Now !!</a>
                </div>
            </div>
        </div>

        <!-- Swiss -->
        <div class="col-md-4">
            <div class="card rounded-4 shadow-sm">
                <img src="https://images.unsplash.com/photo-1500048993953-d23a436266cf?auto=format&fit=crop&w=900&q=80"
                     class="card-img-top" style="height:230px; object-fit:cover;">

                <div class="card-body">
                    <h5 class="card-title fw-semibold">Swiss Alps Adventure</h5>
                    <p class="text-muted small"><i class="fa-solid fa-location-dot text-warning"></i> Zermatt, Switzerland</p>

                    <p><strong>Price:</strong> $1499</p>

                    <a href="login.jsp"
                       class="btn btn-warning w-100">Login To Book Now !!</a>
                </div>
            </div>
        </div>

        <!-- Paris -->
        <div class="col-md-4">
            <div class="card rounded-4 shadow-sm">
                <img src="https://images.unsplash.com/photo-1502602898657-3e91760cbb34?auto=format&fit=crop&w=900&q=80"
                     class="card-img-top" style="height:230px; object-fit:cover;">

                <div class="card-body">
                    <h5 class="card-title fw-semibold">Paris City Lights</h5>
                    <p class="text-muted small"><i class="fa-solid fa-location-dot text-warning"></i> Paris, France</p>

                    <p><strong>Price:</strong> $999</p>

                    <a href="login.jsp"
                       class="btn btn-warning w-100">Login To Book Now !!</a>
                </div>
            </div>
        </div>

    </div>
</section>

</body>
</html>
