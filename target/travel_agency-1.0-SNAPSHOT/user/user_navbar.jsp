<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String loggedInUser = (String) session.getAttribute("authUser");
%>

<nav class="ee-nav">
  <a href="<%=request.getContextPath()%>/user/views/user_dashboard.jsp" class="ee-nav__brand">
    <i class="bi bi-compass"></i> ExploreEase
  </a>
  <ul class="ee-nav__links">
    <li><a href="<%=request.getContextPath()%>/user/views/user_dashboard.jsp">
      <i class="bi bi-house"></i> Dashboard
    </a></li>
    <li><a href="<%=request.getContextPath()%>/user/views/tour.jsp">
      <i class="bi bi-map"></i> Tours
    </a></li>
    <li><a href="<%=request.getContextPath()%>/user/views/blog.jsp">
      <i class="bi bi-journal-text"></i> Blog
    </a></li>
    <li><a href="<%=request.getContextPath()%>/user/views/contact.jsp">
      <i class="bi bi-envelope"></i> Contact
    </a></li>
    <li><a href="<%=request.getContextPath()%>/user/views/booking_trip.jsp">
      <i class="bi bi-plane"></i> Book Trip
    </a></li>
    <li style="margin-left:auto;">
      <a href="<%=request.getContextPath()%>/user/views/edit_user_details.jsp" style="color:var(--gold-light);">
        <i class="bi bi-person-circle"></i> <%= loggedInUser != null ? loggedInUser : "User" %>
      </a>
    </li>
    <li>
      <a href="<%=request.getContextPath()%>/logout.jsp" class="ee-nav__cta">
        <i class="bi bi-box-arrow-right"></i> Logout
      </a>
    </li>
  </ul>
</nav>