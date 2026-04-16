<%@ page import="java.text.SimpleDateFormat, java.util.Date" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>ExploreEase | Book Your Trip</title>

    <!-- Google Fonts + Bootstrap -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
          rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
          rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('https://images.unsplash.com/photo-1507525428034-b723cf961d3e')
                        center/cover fixed no-repeat;
            color: #fff;
            backdrop-filter: blur(3px);
        }

        .page-title {
            margin-top: 60px;
        }

        .glass-card {
            background: rgba(255,255,255,0.18);
            backdrop-filter: blur(18px);
            -webkit-backdrop-filter: blur(18px);
            padding: 35px;
            border-radius: 20px;
            border: 1px solid rgba(255,255,255,0.25);
            box-shadow: 0px 10px 30px rgba(0,0,0,0.25);
        }

        .tour-summary {
            background: rgba(255,255,255,0.12);
            border-radius: 18px;
            padding: 20px;
            border: 1px solid rgba(255,255,255,0.20);
        }

        .form-control, .form-control:focus {
            border-radius: 12px;
            padding: 12px 15px;
            border: none;
            box-shadow: none;
        }

        label {
            font-weight: 600;
        }

        .btn-warning {
            border-radius: 12px;
            padding: 12px;
            font-size: 17px;
            font-weight: 600;
            transition: 0.3s ease;
        }

        .btn-warning:hover {
            transform: translateY(-2px);
            background: #ffcc33;
        }

        .tour-icon {
            color: #ffc107;
            margin-right: 5px;
        }
    </style>

</head>

<body>

<%@ include file="user_navbar.jsp" %>

<%
String tourTitle = request.getParameter("tourTitle") != null ? request.getParameter("tourTitle") : "N/A";
String price = request.getParameter("price") != null ? request.getParameter("price") : "0";
String location = request.getParameter("location") != null ? request.getParameter("location") : "Unknown";

String country = request.getParameter("country");
String city = request.getParameter("city");
String zip_code = request.getParameter("zip_code");
String travelDate = request.getParameter("travel_date");
%>

<div class="container py-5">

    <h1 class="text-center fw-bold text-warning mb-2 page-title">
        Book Your Dream Trip
    </h1>
    <p class="text-center mb-5 text-light">
        Fill in your details and confirm your booking instantly.
    </p>

    <div class="row g-4 justify-content-center">

        <!-- LEFT SIDE ? TOUR SUMMARY -->
        <div class="col-lg-4">
            <div class="tour-summary glass-card">

                <h4 class="text-warning fw-bold mb-2">
                    <i class="fa-solid fa-suitcase-rolling tour-icon"></i>
                    <%= tourTitle %>
                </h4>

                <p class="mb-1">
                    <i class="fa-solid fa-location-dot tour-icon"></i>
                    <%= location %>
                </p>

                <p class="mb-1">
                    <strong class="text-warning">Country:</strong> <%= country %>
                </p>

                <p class="mb-1">
                    <strong class="text-warning">City:</strong> <%= city %>
                </p>

                <p class="mb-1">
                    <strong class="text-warning">Travel Date:</strong> <%= travelDate %>
                </p>

                <h5 class="mt-3 fw-bold">
                    <span class="text-warning">Price:</span> $<%= price %>
                </h5>

            </div>
        </div>

        <!-- RIGHT SIDE ? BOOKING FORM -->
        <div class="col-lg-6">
            <div class="glass-card">

                <h4 class="text-warning fw-bold mb-4">Traveler Information</h4>

                <form action="code_booking.jsp" method="POST">

                    <!-- HIDDEN FIELDS -->
                    <input type="hidden" name="tourTitle" value="<%= tourTitle %>">
                    <input type="hidden" name="country" value="<%= country %>">
                    <input type="hidden" name="city" value="<%= city %>">
                    <input type="hidden" name="zip_code" value="<%= zip_code %>">
                    <input type="hidden" name="travel_date" value="<%= travelDate %>">
                    <input type="hidden" name="price" value="<%= price %>">

                    <div class="row g-3">

                        <div class="col-md-6">
                            <label class="form-label text-light">First Name</label>
                            <input type="text" name="first_name" class="form-control" required>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label text-light">Last Name</label>
                            <input type="text" name="last_name" class="form-control" required>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label text-light">Email</label>
                            <input type="email" name="email" class="form-control" required>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label text-light">Phone Number</label>
                            <input type="text" name="phone" class="form-control" required>
                        </div>

                    </div>

                    <button class="btn btn-warning w-100 mt-4">
                        <i class="fa-solid fa-check-circle me-2"></i>
                        Confirm Booking
                    </button>

                </form>

            </div>
        </div>

    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
