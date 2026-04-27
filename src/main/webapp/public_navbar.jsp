<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Bootstrap + Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<style>
.ee-navbar {
    background: rgba(255,255,255,0.85);
    backdrop-filter: blur(12px);
    border-bottom: 1px solid rgba(0,0,0,0.05);
}

.ee-brand {
    font-weight: 700;
    font-size: 22px;
    color: #e1a400 !important;
}

.ee-nav-link {
    color: #333 !important;
    font-weight: 500;
    transition: 0.3s;
}

.ee-nav-link:hover {
    color: #e1a400 !important;
}

.btn-ee {
    border-radius: 10px;
    font-weight: 500;
    padding: 6px 14px;
}

.btn-ee--outline {
    border: 1px solid #333;
    color: #333;
}

.btn-ee--outline:hover {
    background: #333;
    color: #fff;
}

.btn-ee--primary {
    background: #ffc107;
    border: none;
    color: #000;
}

.btn-ee--primary:hover {
    background: #ffcc33;
}
</style>

<nav class="navbar navbar-expand-lg ee-navbar shadow-sm py-2">

<div class="container">

    <!-- LOGO -->
    <a class="navbar-brand ee-brand" href="<%=request.getContextPath()%>/home.jsp">
        <i class="bi bi-compass"></i> ExploreEase
    </a>

    <!-- MOBILE TOGGLE -->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
        <span class="navbar-toggler-icon"></span>
    </button>

    <!-- NAV LINKS -->
    <div class="collapse navbar-collapse" id="navMenu">

        <ul class="navbar-nav mx-auto">

            <li class="nav-item">
                <a class="nav-link ee-nav-link" href="<%=request.getContextPath()%>/home.jsp">
                    Home
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link ee-nav-link" href="<%=request.getContextPath()%>/public_tour.jsp">
                    Tours
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link ee-nav-link" href="<%=request.getContextPath()%>/public_blog.jsp">
                    Blog
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link ee-nav-link" href="<%=request.getContextPath()%>/contact.jsp">
                    Contact
                </a>
            </li>

        </ul>

        <!-- ACTION BUTTONS -->
        <div class="d-flex gap-2">

            <a href="<%=request.getContextPath()%>/login.jsp"
               class="btn btn-ee btn-ee--outline">
                Login
            </a>

            <a href="<%=request.getContextPath()%>/register.jsp"
               class="btn btn-ee btn-ee--primary">
                Register
            </a>

        </div>

    </div>

</div>

</nav>

<!-- Bootstrap JS (required for toggle) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>