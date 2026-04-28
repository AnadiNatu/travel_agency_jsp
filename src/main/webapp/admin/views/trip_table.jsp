<%@ include file="../../auth.jsp" %>
<%@ include file="../admin_service.jsp" %>
<%--<%@ page contentType="text/html;charset=UTF-8"%>--%>
<%
  String role = (String) session.getAttribute("role");
  if (!"Admin".equalsIgnoreCase(role)) {
    response.sendRedirect(request.getContextPath() + "/login.jsp?error=unauthorized");
    return;
  }
  String msg = request.getParameter("msg");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Trip Management | Admin</title>
  <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@600&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/global.css">
  <style>
    .trip-thumb { width:100%;height:200px;object-fit:cover;border-radius:var(--radius-md) var(--radius-md) 0 0; }
  </style>
</head>
<body>

<%@ include file="../admin_navbar.jsp" %>

<div class="admin-content">

  <% if ("created".equals(msg)) { %><div class="ee-alert ee-alert--success"><i class="bi bi-check-circle"></i> Trip created successfully!</div><% } %>
  <% if ("updated".equals(msg)) { %><div class="ee-alert ee-alert--success"><i class="bi bi-check-circle"></i> Trip updated successfully!</div><% } %>
  <% if ("deleted".equals(msg)) { %><div class="ee-alert ee-alert--danger"><i class="bi bi-trash"></i> Trip deleted.</div><% } %>

  <!-- ADMIN CREATED TRIPS -->
  <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:1.5rem;">
    <div>
      <span class="ee-section__label">Admin Created</span>
      <h3 style="margin:0;color:var(--ocean);">Trip Listings</h3>
    </div>
    <a href="<%=request.getContextPath()%>/admin/views/create_trip.jsp" class="btn-ee btn-ee--primary btn-ee--sm">
      <i class="bi bi-plus-circle"></i> New Trip
    </a>
  </div>

  <div class="row g-4 mb-5">
  <%
    try {
      ResultSet trips = getAllTrips();
      while (trips.next()) {
        String img = trips.getString("destination_image");
        if (img == null || img.isEmpty()) img = "https://images.unsplash.com/photo-1488646953014-85cb44e25828?w=600";
  %>
    <div class="col-md-4">
      <div class="ee-card">
        <div style="overflow:hidden;">
          <img src="<%= img %>" class="trip-thumb" alt="">
        </div>
        <div class="ee-card__body">
          <h5 class="ee-card__title"><%= trips.getString("tour_title") %></h5>
          <p class="ee-card__meta">
            <i class="bi bi-geo-alt-fill text-gold"></i> <%= trips.getString("city") %>, <%= trips.getString("country") %>
          </p>
          <p style="font-size:0.85rem;color:var(--text-mid);">
            <i class="bi bi-calendar3"></i> <%= trips.getString("travel_date") %>
          </p>
          <a href="<%=request.getContextPath()%>/admin/views/edit_booking_details.jsp?id=<%= trips.getInt("id") %>" class="btn-ee btn-ee--ocean btn-ee--sm" style="margin-top:0.5rem;">
            <i class="bi bi-pencil"></i> Edit
          </a>
          <a href="<%=request.getContextPath()%>/admin/controller/delete_booking.jsp?id=<%= trips.getInt("id") %>" onclick="return confirm('Delete this trip?');" class="btn-ee btn-ee--danger btn-ee--sm" style="margin-top:0.5rem;margin-left:0.4rem;">
            <i class="bi bi-trash"></i>
          </a>
        </div>
      </div>
    </div>
  <%
      }
    } catch (Exception e) {
      out.print("<div class='ee-alert ee-alert--danger'>" + e.getMessage() + "</div>");
    }
  %>
  </div>

  <!-- USER BOOKINGS -->
  <div style="margin-bottom:1.5rem;">
    <span class="ee-section__label">Incoming</span>
    <h3 style="margin:0;color:var(--ocean);">User Bookings</h3>
  </div>

  <%
    try {
      ResultSet rs = getAllBookings();
  %>
  <div style="overflow-x:auto;">
  <table class="ee-table">
    <thead>
      <tr>
        <th>ID</th><th>User</th><th>Tour</th><th>Country</th><th>City</th><th>Date</th><th>Status</th><th>Actions</th>
      </tr>
    </thead>
    <tbody>
    <% while (rs.next()) {
         String status = rs.getString("status");
    %>
      <tr>
        <td><strong>#<%= rs.getInt("id") %></strong></td>
        <td><%= rs.getInt("user_id") %></td>
        <td><%= rs.getString("tour_title") %></td>
        <td><%= rs.getString("country") %></td>
        <td><%= rs.getString("city") %></td>
        <td><%= rs.getString("travel_date") %></td>
        <td>
          <% if ("PENDING".equalsIgnoreCase(status)) { %>
            <span class="ee-badge ee-badge--pending">Pending</span>
          <% } else if ("CONFIRMED".equalsIgnoreCase(status)) { %>
            <span class="ee-badge ee-badge--confirmed">Confirmed</span>
          <% } else { %>
            <span class="ee-badge ee-badge--cancelled">Cancelled</span>
          <% } %>
        </td>
        <td style="white-space:nowrap;">
          <% if ("PENDING".equalsIgnoreCase(status)) { %>
            <a href="<%=request.getContextPath()%>/admin/controller/approve_booking.jsp?id=<%= rs.getInt("id") %>" class="btn-ee btn-ee--primary btn-ee--sm" style="display:inline-flex;">
              <i class="bi bi-check"></i>
            </a>
            <a href="<%=request.getContextPath()%>/admin/controller/reject_booking.jsp?id=<%= rs.getInt("id") %>" class="btn-ee btn-ee--ocean btn-ee--sm" style="display:inline-flex;margin-left:4px;">
              <i class="bi bi-x"></i>
            </a>
          <% } %>
          <a href="<%=request.getContextPath()%>/admin/views/edit_booking_details.jsp?id=<%= rs.getInt("id") %>" class="btn-ee btn-ee--outline btn-ee--sm" style="display:inline-flex;color:var(--ocean);border-color:var(--ocean);margin-left:4px;">
            <i class="bi bi-pencil"></i>
          </a>
          <a href="<%=request.getContextPath()%>/admin/controller/delete_booking.jsp?id=<%= rs.getInt("id") %>" onclick="return confirm('Delete this booking?');" class="btn-ee btn-ee--danger btn-ee--sm" style="display:inline-flex;margin-left:4px;">
            <i class="bi bi-trash"></i>
          </a>
        </td>
      </tr>
    <% } %>
    </tbody>
  </table>
  </div>
  <%
    } catch (Exception ex) {
      out.print("<div class='ee-alert ee-alert--danger'>" + ex.getMessage() + "</div>");
    }
  %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>