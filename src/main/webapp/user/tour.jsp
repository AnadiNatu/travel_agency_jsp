<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ExploreEase | Tours</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <style>
        body {
            background: #f8f9fa;
            font-family: 'Poppins', sans-serif;
        }

        .hero-section {
            padding: 120px 20px;
            text-align: center;
            color: white;
            background: linear-gradient(rgba(0,0,0,0.55), rgba(0,0,0,0.55)),
                url('https://images.unsplash.com/photo-1507525428034-b723cf961d3e')
                center/cover no-repeat;
        }

        .tour-card {
            border-radius: 18px;
            overflow: hidden;
            transition: 0.3s ease;
            background: white;
        }

        .tour-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        }

        .tour-img {
            height: 230px;
            width: 100%;
            object-fit: cover;
        }

        .price-tag {
            font-weight: 700;
        }
    </style>
</head>

<body>

<%@ include file="user_navbar.jsp" %>

<section class="hero-section">
    <h1 class="fw-bold display-5">Plan Your Next Escape</h1>
    <p class="lead">Exclusive tours curated for unforgettable memories</p>
</section>

<section class="container py-5">
    <div class="row g-4">

        <!-- TOUR 1 -->
<div class="col-md-4">
    <div class="card rounded-4 shadow-sm">
        <img src="https://images.unsplash.com/photo-1493558103817-58b2924bce98?auto=format&fit=crop&w=900&q=80"
             class="card-img-top" style="height:230px; object-fit:cover;">

        <div class="card-body">
            <h5 class="card-title fw-semibold">Bali Getaway</h5>
            <p class="text-muted small">
                <i class="fa-solid fa-location-dot text-warning"></i> Bali, Indonesia
            </p>
            <p class="text-muted">Discover serene beaches & Balinese culture.</p>

            <p><strong>Price:</strong> $899</p>

            <a href="booking_trip.jsp?tourTitle=Bali Getaway
                    &country=Indonesia
                    &city=Bali
                    &zip_code=445566
                    &travel_date=2025-06-15
                    &location=Bali,Indonesia
                    &price=899"
               class="btn btn-warning w-100">Book Now</a>
        </div>
    </div>
</div>

<!-- TOUR 2 -->
<div class="col-md-4">
    <div class="card rounded-4 shadow-sm">
        <img src="https://images.unsplash.com/photo-1500048993953-d23a436266cf?auto=format&fit=crop&w=900&q=80"
             class="card-img-top" style="height:230px; object-fit:cover;">

        <div class="card-body">
            <h5 class="card-title fw-semibold">Swiss Alps Adventure</h5>
            <p class="text-muted small">
                <i class="fa-solid fa-location-dot text-warning"></i> Zermatt, Switzerland
            </p>
            <p class="text-muted">Thrilling snow-capped mountain adventure.</p>

            <p><strong>Price:</strong> $1499</p>

            <a href="booking_trip.jsp?tourTitle=Swiss Alps Adventure
                    &country=Switzerland
                    &city=Alps
                    &zip_code=222444
                    &travel_date=2025-07-10
                    &location=Zermatt,Switzerland
                    &price=1499"
               class="btn btn-warning w-100">Book Now</a>
        </div>
    </div>
</div>

<!-- TOUR 3 -->
<div class="col-md-4">
    <div class="card rounded-4 shadow-sm">
        <img src="https://images.unsplash.com/photo-1502602898657-3e91760cbb34?auto=format&fit=crop&w=900&q=80"
             class="card-img-top" style="height:230px; object-fit:cover;">

        <div class="card-body">
            <h5 class="card-title fw-semibold">Paris City Lights</h5>
            <p class="text-muted small">
                <i class="fa-solid fa-location-dot text-warning"></i> Paris, France
            </p>
            <p class="text-muted">Romantic evenings & iconic landmarks.</p>

            <p><strong>Price:</strong> $999</p>

            <a href="booking_trip.jsp?tourTitle=Paris City Lights
                    &country=France
                    &city=Paris
                    &zip_code=110022
                    &travel_date=2025-08-15
                    &location=Paris,France
                    &price=999"
               class="btn btn-warning w-100">Book Now</a>
        </div>
    </div>
</div>

<!-- TOUR 4 -->
<div class="col-md-4">
    <div class="card rounded-4 shadow-sm">
        <img src="https://images.unsplash.com/photo-1483683804023-6ccdb62f86ef?auto=format&fit=crop&w=900&q=80"
             class="card-img-top" style="height:230px; object-fit:cover;">

        <div class="card-body">
            <h5 class="card-title fw-semibold">Tokyo Explorer</h5>
            <p class="text-muted small">
                <i class="fa-solid fa-location-dot text-warning"></i> Tokyo, Japan
            </p>
            <p class="text-muted">Technology, tradition & neon nightlife.</p>

            <p><strong>Price:</strong> $1299</p>

            <a href="booking_trip.jsp?tourTitle=Tokyo Explorer
                    &country=Japan
                    &city=Tokyo
                    &zip_code=330011
                    &travel_date=2025-09-03
                    &location=Tokyo,Japan
                    &price=1299"
               class="btn btn-warning w-100">Book Now</a>
        </div>
    </div>
</div>

<!-- TOUR 5 -->
<div class="col-md-4">
    <div class="card rounded-4 shadow-sm">
        <img src="https://images.unsplash.com/photo-1489515217757-5fd1be406fef?auto=format&fit=crop&w=900&q=80"
             class="card-img-top" style="height:230px; object-fit:cover;">

        <div class="card-body">
            <h5 class="card-title fw-semibold">Dubai Premium Desert Safari</h5>
            <p class="text-muted small">
                <i class="fa-solid fa-location-dot text-warning"></i> Dubai, UAE
            </p>
            <p class="text-muted">Luxury desert safari + Arabian night show.</p>

            <p><strong>Price:</strong> $799</p>

            <a href="booking_trip.jsp?tourTitle=Dubai Premium Desert Safari
                    &country=UAE
                    &city=Dubai
                    &zip_code=887766
                    &travel_date=2025-04-20
                    &location=Dubai,UAE
                    &price=799"
               class="btn btn-warning w-100">Book Now</a>
        </div>
    </div>
</div>

<!-- TOUR 6 -->
<div class="col-md-4">
    <div class="card rounded-4 shadow-sm">
        <img src="https://images.unsplash.com/photo-1524492412937-b28074a5d7da?auto=format&fit=crop&w=900&q=80"
             class="card-img-top" style="height:230px; object-fit:cover;">

        <div class="card-body">
            <h5 class="card-title fw-semibold">Maldives Luxury Retreat</h5>
            <p class="text-muted small">
                <i class="fa-solid fa-location-dot text-warning"></i> Maldives
            </p>
            <p class="text-muted">Private villas, turquoise water & romance.</p>

            <p><strong>Price:</strong> $1999</p>

            <a href="booking_trip.jsp?tourTitle=Maldives Luxury Retreat
                    &country=Maldives
                    &city=Male
                    &zip_code=556677
                    &travel_date=2025-11-11
                    &location=Male,Maldives
                    &price=1999"
               class="btn btn-warning w-100">Book Now</a>
        </div>
    </div>
</div>

        
    </div>
</section>

</body>
</html>
