<%@ include file="../../auth.jsp" %>
<%@ include file="../user_service.jsp" %>
<%--<%@ page contentType="text/html;charset=UTF-8" %>--%>
<%
//  String loggedInUser = (String) session.getAttribute("authUser");
//  Integer userId = (Integer) session.getAttribute("id");
//  
//  if (loggedInUser == null) {
//    response.sendRedirect(request.getContextPath() + "/login.jsp?error=loginrequired");
//    return;
//  }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dashboard | ExploreEase</title>
  <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,600;1,300&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/global.css">
</head>
<body style="background:var(--ivory);">

<%@ include file="../user_navbar.jsp" %>

<div class="page-header">
  <div class="container" style="position:relative;z-index:2;">
    <span class="ee-section__label">Welcome Back</span>
    <h1 style="color:white;margin:0;">Dashboard</h1>
    <p style="color:rgba(255,255,255,0.7);margin-top:0.5rem;">Manage your bookings and profile</p>
  </div>
</div>

<section class="ee-section">
  <div class="container">
    <div class="row g-4">
      <!-- Profile Card -->
      <div class="col-lg-4">
        <div class="ee-card">
          <div class="ee-card__body" style="text-align:center;padding:2.5rem 1.5rem;">
            <div style="width:120px;height:120px;border-radius:50%;background:var(--gold);display:flex;align-items:center;justify-content:center;margin:0 auto 1.5rem;font-size:3rem;color:var(--ocean);">
              <i class="bi bi-person-fill"></i>
            </div>
            <h5 class="ee-card__title"><%= loggedInUser %></h5>
            <p style="color:var(--text-light);font-size:0.9rem;margin-bottom:1.5rem;">Verified Member</p>
            <div style="display:flex;flex-direction:column;gap:0.8rem;">
              <a href="<%=request.getContextPath()%>/user/views/edit_user_details.jsp" class="btn-ee btn-ee--ocean btn-ee--sm" style="width:100%;justify-content:center;">
                <i class="bi bi-pencil"></i> Edit Profile
              </a>
              <a href="<%=request.getContextPath()%>/user/views/booking_trip.jsp" class="btn-ee btn-ee--primary btn-ee--sm" style="width:100%;justify-content:center;">
                <i class="bi bi-airplane"></i> Book Trip
              </a>
            </div>
          </div>
        </div>
      </div>

      <!-- Bookings Card -->
      <div class="col-lg-8">
        <div class="ee-card">
          <div class="ee-card__body">
            <h5 class="ee-card__title">Your Bookings</h5>
            
            <%
              try {
                ResultSet bookings = getUserBookings(userId);
                if (!bookings.next()) {
            %>
              <p style="color:var(--text-light);text-align:center;padding:2rem;font-weight:300;">
                <i class="bi bi-inbox" style="font-size:2rem;display:block;margin-bottom:1rem;opacity:0.5;"></i>
                No bookings yet. <a href="<%=request.getContextPath()%>/user/views/booking_trip.jsp" style="color:var(--gold);">Start booking now!</a>
              </p>
            <%
                } else {
            %>
              <div style="overflow-x:auto;">
                <table class="ee-table">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Tour</th>
                      <th>Location</th>
                      <th>Date</th>
                      <th>Status</th>
                    </tr>
                  </thead>
                  <tbody>
                  <%
                    do {
                  %>
                    <tr>
                      <td>#<%= bookings.getInt("id") %></td>
                      <td><%= bookings.getString("tour_title") %></td>
                      <td><%= bookings.getString("city") %>, <%= bookings.getString("country") %></td>
                      <td><%= bookings.getString("travel_date") %></td>
                      <td>
                        <%
                          String status = bookings.getString("status");
                          if ("PENDING".equalsIgnoreCase(status)) {
                        %>
                          <span class="ee-badge ee-badge--pending">Pending</span>
                        <%
                          } else if ("CONFIRMED".equalsIgnoreCase(status)) {
                        %>
                          <span class="ee-badge ee-badge--confirmed">Confirmed</span>
                        <%
                          } else {
                        %>
                          <span class="ee-badge ee-badge--cancelled">Cancelled</span>
                        <%
                          }
                        %>
                      </td>
                    </tr>
                  <%
                    } while (bookings.next());
                  %>
                  </tbody>
                </table>
              </div>
            <%
                }
              } catch (Exception e) {
                out.print("<div class='ee-alert ee-alert--danger'>Error: " + e.getMessage() + "</div>");
              }
            %>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<footer class="ee-footer">
  <div class="container">
    <p>&copy; <%= java.time.Year.now() %> ExploreEase. All Rights Reserved.</p>
  </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>