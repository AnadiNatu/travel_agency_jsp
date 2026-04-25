<%
  String loggedInUser = (String) session.getAttribute("authUser");
%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/global.css">

<nav class="ee-nav">
  <a href="${pageContext.request.contextPath}/user/views/user_dashboard.jsp" class="ee-nav__brand"><i class="bi bi-compass"></i> ExploreEase</a>
  <ul class="ee-nav__links">
    <li><a href="${pageContext.request.contextPath}/user/views/user_dashboard.jsp"><i class="bi bi-house"></i> Dashboard</a></li>
    <li><a href="${pageContext.request.contextPath}/user/views/tour.jsp"><i class="bi bi-map"></i> Tours</a></li>
    <li><a href="${pageContext.request.contextPath}/user/views/blog.jsp"><i class="bi bi-journal-text"></i> Blog</a></li>
    <li><a href="${pageContext.request.contextPath}/user/views/contact.jsp"><i class="bi bi-envelope"></i> Contact</a></li>
    <li><a href="${pageContext.request.contextPath}/user/views/booking_trip.jsp"><i class="bi bi-plane"></i> Book Trip</a></li>
    <li>
      <a href="${pageContext.request.contextPath}/user/views/edit_user_details.jsp" style="color:var(--gold-light);">
        <i class="bi bi-person-circle"></i> <%= loggedInUser != null ? loggedInUser : "User" %>
      </a>
    </li>
    <li><a href="${pageContext.request.contextPath}/logout.jsp" class="ee-nav__cta"><i class="bi bi-box-arrow-right"></i> Logout</a></li>
  </ul>
</nav>