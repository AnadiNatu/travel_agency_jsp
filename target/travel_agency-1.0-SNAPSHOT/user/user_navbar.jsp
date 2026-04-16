<%--<%@ page contentType="text/html;charset=UTF-8" %>--%>
<%
    String loggedInUser = (String) session.getAttribute("authUser");
%>
<!-- Bootstrap + Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<style>
    .glass-nav {
        background: rgba(255, 255, 255, 0.15);
        backdrop-filter: blur(14px);
        -webkit-backdrop-filter: blur(14px);
        border-bottom: 1px solid rgba(255, 255, 255, 0.25);
        box-shadow: 0 4px 20px rgba(0,0,0,0.08);
    }

    .nav-link {
        color: #222 !important;
        font-weight: 500;
        transition: 0.3s ease;
    }

    .nav-link:hover {
        color: #e1a400 !important;
    }

    .brand-logo {
        font-size: 24px;
        font-weight: 700;
        color: #e1a400 !important;
    }
</style>


<nav class="navbar navbar-expand-lg glass-nav py-3">
    <div class="container">

        <!-- Logo -->
        <a class="navbar-brand brand-logo" href="user_dashboard.jsp">ExploreEase</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navMenu">

            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">

                <li class="nav-item">
                    <a class="nav-link" href="user_dashboard.jsp"><i class="bi bi-house"></i> Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="tour.jsp"><i class="bi bi-map"></i> Tours</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="blog.jsp"><i class="bi bi-journal-text"></i> Blog</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contact.jsp"><i class="bi bi-envelope"></i> Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="booking_trip.jsp"><i class="bi bi-plane"></i> Trips </a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
                        <i class="bi bi-person-circle"></i> <%= loggedInUser != null ? loggedInUser : "User"%>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li>
                            <a class="dropdown-item" href="edit_user_details.jsp">
                                <i class="bi bi-pencil-square"></i> Edit Profile
                            </a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="user_profile_photo.jsp">
                                <i class="bi bi-camera"></i> Profile Photo
                            </a>
                        </li>
                        <li><hr class="dropdown-divider"></li>

                    </ul>
                </li>
                                <li class="nav-item">
                     
                    <a class="nav-link" href="../logout.jsp"> <i class="bi bi-box-arrow-right"> </i>Logout </a>
                    
                </li>

            </ul>
        </div>
    </div>
</nav>
