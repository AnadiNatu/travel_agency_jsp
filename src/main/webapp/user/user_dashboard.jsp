<%@ page import="java.sql.*" %>
<%@ include file="../auth.jsp" %>
<%@include file="user_service.jsp"%>

<%
    String authUser = (String) session.getAttribute("authUser");
    String role = (String) session.getAttribute("role");
    Integer id = (Integer) session.getAttribute("id");

    if (authUser == null || id == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp?error=invalid_session");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Dashboard | ExploreEase</title>

    <!-- Bootstrap + Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('https://images.unsplash.com/photo-1469854523086-cc02fe5d8800')
                        center/cover fixed no-repeat;
            color: white;
        }

        .glass-card {
            background: rgba(255, 255, 255, 0.15);
            border-radius: 20px;
            padding: 25px;
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255,255,255,0.25);
            box-shadow: 0 10px 28px rgba(0,0,0,0.20);
        }

        .accordion-button {
            background: rgba(255,255,255,0.2);
            color: white;
            font-weight: 500;
        }
        .accordion-button:not(.collapsed) {
            background: rgba(255,255,255,0.3);
            color: #000;
        }
        .section-title {
            font-size: 22px;
            font-weight: 600;
            color: #ffe082;
            margin-bottom: 15px;
        }
        .info-label {
            font-weight: 600;
            color: #ffe082;
        }
        .info-value {
            font-weight: 400;
            color: #fff;
        }

        .btn-warning {
            font-weight: 600;
            border-radius: 10px;
        }
        .profile-img {
            width: 140px;
            height: 140px;
            border-radius: 50%;
            border: 3px solid #ffc107;
            object-fit: cover;
        }
    </style>
</head>

<body>

<%@ include file="user_navbar.jsp" %>

<div class="container py-5">
    <div class="row g-4">
        <div class="col-lg-4 col-md-6">
            <div class="glass-card text-center">
                <img src="../images/default_profile.png" class="profile-img mb-3">
                <h4 class="fw-bold text-white mb-1"><%= authUser %></h4>
                <p class="text-warning mb-3">
                    <i class="bi bi-person-check-fill"></i> <%= role %>
                </p>

                <!-- Upload New Image -->
                <form action="user_profile_photo.jsp" method="post" enctype="multipart/form-data">
                    <input type="file" name="profilePic" class="form-control form-control-sm mb-2" required>
                    <button class="btn btn-warning w-100 btn-sm">Upload New Photo</button>
                </form>

                <div class="d-grid gap-2 mt-4">
                    <a href="edit_user_details.jsp?id=<%= id %>"
                       class="btn btn-outline-warning btn-sm">
                        <i class="bi bi-pencil-square"></i> Edit Profile
                    </a>

                    <a href="booking_trip.jsp" class="btn btn-warning btn-sm text-dark">
                        <i class="bi bi-airplane-fill"></i> Book a New Trip
                    </a>
                </div>

            </div>
        </div>

        <!-- RIGHT PANEL -->
        <div class="col-lg-8">
            <div class="glass-card mb-4">
                <h5 class="section-title">Your Profile Details</h5>

                <%
                    try {
                     ResultSet rs = getUserDetails(id); 
                        if (rs.next()) {
                %>

                <div class="row gy-3">
                    <div class="col-md-6"><span class="info-label">Name:</span> <br><span class="info-value"><%= rs.getString("name") %></span></div>
                    <div class="col-md-6"><span class="info-label">Email:</span> <br><span class="info-value"><%= rs.getString("email") %></span></div>

                    <div class="col-md-6"><span class="info-label">Username:</span> <br><span class="info-value"><%= rs.getString("username") %></span></div>
                    <div class="col-md-6"><span class="info-label">Phone:</span> <br><span class="info-value"><%= rs.getString("phone_number") %></span></div>

                    <div class="col-md-6"><span class="info-label">Date of Birth:</span> <br><span class="info-value"><%= rs.getString("dob") %></span></div>
                    <div class="col-md-6"><span class="info-label">Age:</span> <br><span class="info-value"><%= rs.getInt("age") %></span></div>
                </div>

                <%
                        } else {
                            out.print("<div class='alert alert-warning mt-2'>No user details found.</div>");
                        }
//                        rs.close(); ps.close(); con.close();
                    } catch (Exception e) {
                        out.print("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
                    }
                %>
            </div>

            <!-- USER BOOKINGS -->
            <div class="glass-card">
                <h5 class="section-title">Your Bookings</h5>

                <%
                    try {
                       ResultSet rs2 = getUserBookings(id);
                       
                        if (!rs2.isBeforeFirst()) {
                            out.print("<p class='text-light'>You have no bookings yet.</p>");
                        } else {
                %>

                <div class="accordion" id="userBookings">

                    <%
                        int index = 1;
                        while (rs2.next()) {
                    %>

                    <div class="accordion-item mb-2">

                        <h2 class="accordion-header">
                            <button class="accordion-button <%= index==1?"":"collapsed" %>"
                                    data-bs-toggle="collapse"
                                    data-bs-target="#book<%= index %>">
                                Booking #<%= rs2.getInt("id") %> ? 
                                <%= rs2.getString("city") %>, <%= rs2.getString("country") %>
                            </button>
                        </h2>

                        <div id="book<%= index %>" 
                             class="accordion-collapse collapse <%= index==1?"show":"" %>">

                            <div class="accordion-body text-dark">

                                <div class="row gy-2">
                                    <div class="col-md-6"><strong>First Name:</strong> <%= rs2.getString("first_name") %></div>
                                    <div class="col-md-6"><strong>Last Name:</strong> <%= rs2.getString("last_name") %></div>
                                    <div class="col-md-6"><strong>Email:</strong> <%= rs2.getString("email") %></div>
                                    <div class="col-md-6"><strong>Phone:</strong> <%= rs2.getString("phone") %></div>
                                    <div class="col-md-6"><strong>Street:</strong> <%= rs2.getString("street") %></div>
                                    <div class="col-md-6"><strong>Zip Code:</strong> <%= rs2.getString("zip_code") %></div>
                                    <div class="col-md-6"><strong>Travel Date:</strong> <%= rs2.getString("travel_date") %></div>

                                    <div class="col-md-6">
                                        <strong>Status:</strong>
                                        <% String status = rs2.getString("status"); %>

                                        <% if ("CONFIRMED".equalsIgnoreCase(status)) { %>
                                            <span class="badge bg-success">CONFIRMED</span>
                                        <% } else if ("PENDING".equalsIgnoreCase(status)) { %>
                                            <span class="badge bg-warning text-dark">PENDING</span>
                                        <% } else { %>
                                            <span class="badge bg-danger">CANCELLED</span>
                                        <% } %>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <% index++; } %>

                </div>

                <%
                        }
//                        rs2.close(); ps2.close(); con2.close();
                    } catch (Exception ex) {
                        out.print("<div class='alert alert-danger'>Error: "+ex.getMessage()+"</div>");
                    }
                %>

            </div>
        </div>

    </div>
</div>

<%@ include file="user_footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
