<%@ page import="java.sql.*" %>
<%@ include file="../../auth.jsp" %>
<%@ include file="../user_service.jsp" %>
<%
  String authUser = (String) session.getAttribute("authUser");
  String role     = (String) session.getAttribute("role");
  Integer id      = (Integer) session.getAttribute("id");
  if (authUser == null || id == null) {
    response.sendRedirect(request.getContextPath() + "/login.jsp?error=invalid_session");
    return;
  }
  String profilePhoto = null, name = "", email = "", username = "", phone = "", dob = "";
  int age = 0;
  try {
    ResultSet rs = getUserDetails(id);
    if (rs.next()) {
      name  = rs.getString("name"); email = rs.getString("email");
      username = rs.getString("username"); phone = rs.getString("phone_number");
      dob = rs.getString("dob"); age = rs.getInt("age");
      String img = rs.getString("profile_photo");
      if (img != null && !img.trim().isEmpty()) profilePhoto = img;
    }
  } catch (Exception e) { out.print("<div class='ee-alert ee-alert--danger'>" + e.getMessage() + "</div>"); }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Dashboard | ExploreEase</title>
  <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,600;1,300&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/global.css">
  <style>
    body {
      background: linear-gradient(rgba(10,35,66,0.8), rgba(10,35,66,0.7)),
                  url('https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?w=1600') center/cover fixed;
      min-height: 100vh;
    }
  </style>
</head>
<body>

<%@ include file="../user_navbar.jsp" %>

<div class="container py-5">
  <% if ("updated".equals(request.getParameter("msg"))) { %>
    <div class="ee-alert ee-alert--success" style="color:white;background:rgba(26,122,74,0.3);border-color:var(--gold);">Profile updated successfully!</div>
  <% } %>
  <% if ("success".equals(request.getParameter("booking"))) { %>
    <div class="ee-alert ee-alert--success" style="color:white;background:rgba(26,122,74,0.3);border-color:var(--gold);">Booking confirmed successfully!</div>
  <% } %>

  <div class="row g-4">
    <!-- LEFT PANEL -->
    <div class="col-lg-4">
      <div class="glass-card text-center">
        <img src="<%= (profilePhoto != null) ? profilePhoto : request.getContextPath() + "/images/default_profile.png" %>"
             class="profile-img mb-3" alt="Profile">
        <h4 style="color:white;font-family:'Cormorant Garamond',serif;"><%= name %></h4>
        <p style="color:rgba(255,255,255,0.6);font-size:0.85rem;text-transform:uppercase;letter-spacing:0.1em;"><%= role %></p>

        <form action="<%=request.getContextPath()%>/user/views/user_profile_photo.jsp" method="post" enctype="multipart/form-data" style="margin-top:1rem;">
          <input type="file" name="profilePic" class="ee-input ee-input--glass" style="margin-bottom:0.8rem;" required>
          <button type="submit" class="btn-ee btn-ee--primary" style="width:100%;justify-content:center;">Upload Photo</button>
        </form>

        <div style="margin-top:1rem;display:flex;flex-direction:column;gap:0.7rem;">
          <a href="<%=request.getContextPath()%>/user/views/edit_user_details.jsp" class="btn-ee btn-ee--outline" style="justify-content:center;">Edit Profile</a>
          <a href="<%=request.getContextPath()%>/user/views/booking_trip.jsp" class="btn-ee btn-ee--primary" style="justify-content:center;">Book a Trip</a>
        </div>
      </div>
    </div>

    <!-- RIGHT PANEL -->
    <div class="col-lg-8">
      <div class="glass-card mb-4">
        <h5 style="color:var(--gold-light);font-family:'Cormorant Garamond',serif;margin-bottom:1.2rem;">Your Details</h5>
        <div class="row g-3">
          <div class="col-sm-6"><p style="margin:0;color:rgba(255,255,255,0.5);font-size:0.75rem;text-transform:uppercase;letter-spacing:0.1em;">Full Name</p><p style="color:white;margin:0;"><%= name %></p></div>
          <div class="col-sm-6"><p style="margin:0;color:rgba(255,255,255,0.5);font-size:0.75rem;text-transform:uppercase;letter-spacing:0.1em;">Email</p><p style="color:white;margin:0;"><%= email %></p></div>
          <div class="col-sm-6"><p style="margin:0;color:rgba(255,255,255,0.5);font-size:0.75rem;text-transform:uppercase;letter-spacing:0.1em;">Username</p><p style="color:white;margin:0;">@<%= username %></p></div>
          <div class="col-sm-6"><p style="margin:0;color:rgba(255,255,255,0.5);font-size:0.75rem;text-transform:uppercase;letter-spacing:0.1em;">Phone</p><p style="color:white;margin:0;"><%= phone %></p></div>
          <div class="col-sm-6"><p style="margin:0;color:rgba(255,255,255,0.5);font-size:0.75rem;text-transform:uppercase;letter-spacing:0.1em;">Date of Birth</p><p style="color:white;margin:0;"><%= dob %></p></div>
          <div class="col-sm-6"><p style="margin:0;color:rgba(255,255,255,0.5);font-size:0.75rem;text-transform:uppercase;letter-spacing:0.1em;">Age</p><p style="color:white;margin:0;"><%= age %></p></div>
        </div>
      </div>

      <div class="glass-card">
        <h5 style="color:var(--gold-light);font-family:'Cormorant Garamond',serif;margin-bottom:1.2rem;">Your Bookings</h5>
        <%
          try {
            ResultSet rs2 = getUserBookings(id);
            if (!rs2.isBeforeFirst()) {
        %>
          <p style="color:rgba(255,255,255,0.5);">No bookings yet. <a href="<%=request.getContextPath()%>/user/views/booking_trip.jsp" style="color:var(--gold-light);">Book your first trip ?</a></p>
        <%
            } else {
              int i = 1;
              while (rs2.next()) {
                String bStatus = rs2.getString("status");
        %>
          <div style="background:rgba(255,255,255,0.08);border-radius:var(--radius-sm);padding:1rem;margin-bottom:0.8rem;border-left:3px solid var(--gold);">
            <div style="display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:0.5rem;">
              <div>
                <strong style="color:white;">Booking #<%= rs2.getInt("id") %></strong>
                <p style="color:rgba(255,255,255,0.6);margin:0;font-size:0.85rem;"><%= rs2.getString("city") %>, <%= rs2.getString("country") %> · <%= rs2.getString("travel_date") %></p>
              </div>
              <% if ("CONFIRMED".equalsIgnoreCase(bStatus)) { %>
                <span class="ee-badge ee-badge--confirmed">Confirmed</span>
              <% } else if ("PENDING".equalsIgnoreCase(bStatus)) { %>
                <span class="ee-badge ee-badge--pending">Pending</span>
              <% } else { %>
                <span class="ee-badge ee-badge--cancelled">Cancelled</span>
              <% } %>
            </div>
          </div>
        <%
                i++;
              }
            }
          } catch (Exception e) { out.print(e.getMessage()); }
        %>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>