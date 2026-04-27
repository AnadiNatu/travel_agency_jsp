<%@ include file="../../auth.jsp" %>
<%@ include file="../admin_service.jsp" %>
<%@ page import="java.io.*, java.util.*, org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*, org.apache.commons.fileupload.servlet.*" %>
<%--<%@ page contentType="text/html;charset=UTF-8" %>--%>
<%
  request.setCharacterEncoding("UTF-8");
  String role = (String) session.getAttribute("role");
  if (!"Admin".equalsIgnoreCase(role)) {
    response.sendRedirect(request.getContextPath() + "/login.jsp?error=unauthorized");
    return;
  }
  int id = Integer.parseInt(request.getParameter("id"));
  String tourTitle = "", country = "", city = "", zip = "", status = "", travelDate = "", imageUrl = "";
  try {
    ResultSet rs = getBookingById(id);
    if (rs.next()) {
      tourTitle  = rs.getString("tour_title");
      country    = rs.getString("country");
      city       = rs.getString("city");
      zip        = rs.getString("zip_code") != null ? rs.getString("zip_code") : "";
      status     = rs.getString("status");
      travelDate = rs.getString("travel_date");
      imageUrl   = rs.getString("destination_image") != null ? rs.getString("destination_image") : "";
    }
  } catch (Exception e) {
    out.print("<div class='ee-alert ee-alert--danger'>Error loading booking</div>");
  }

  if ("POST".equalsIgnoreCase(request.getMethod())) {
    try {
      String newTourTitle = request.getParameter("tour_title");
      String newCountry   = request.getParameter("country");
      String newCity      = request.getParameter("city");
      String newZip       = request.getParameter("zip_code");
      String newStatus    = request.getParameter("status");
      String newDate      = request.getParameter("travel_date");
      
      updateBookingFull(id, newTourTitle, newCountry, newCity, newZip, newDate, newStatus);
      response.sendRedirect(request.getContextPath() + "/admin/views/trip_table.jsp?msg=updated");
      return;
    } catch (Exception ex) {
      out.print("<div class='ee-alert ee-alert--danger'>Update failed: " + ex.getMessage() + "</div>");
    }
  }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Trip | Admin</title>
  <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@600&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/global.css">
</head>
<body>

<%@ include file="../admin_navbar.jsp" %>

<div class="admin-content">
  <div style="margin-bottom:2rem;">
    <span class="ee-section__label">Editing</span>
    <h2 style="color:var(--ocean);margin:0;">Edit Trip Booking</h2>
  </div>

  <div style="max-width:680px;background:var(--white);border-radius:var(--radius-md);padding:2.5rem;box-shadow:var(--shadow-md);">
    <form method="post">
      <div class="row">
        <div class="col-md-6">
          <div class="ee-form-group">
            <label>Tour Title</label>
            <input type="text" name="tour_title" class="ee-input" value="<%= tourTitle %>">
          </div>
        </div>
        <div class="col-md-6">
          <div class="ee-form-group">
            <label>Country</label>
            <input type="text" name="country" class="ee-input" value="<%= country %>">
          </div>
        </div>
        <div class="col-md-6">
          <div class="ee-form-group">
            <label>City</label>
            <input type="text" name="city" class="ee-input" value="<%= city %>">
          </div>
        </div>
        <div class="col-md-6">
          <div class="ee-form-group">
            <label>Zip Code</label>
            <input type="text" name="zip_code" class="ee-input" value="<%= zip %>">
          </div>
        </div>
        <div class="col-md-6">
          <div class="ee-form-group">
            <label>Travel Date</label>
            <input type="date" name="travel_date" class="ee-input" value="<%= travelDate %>">
          </div>
        </div>
        <div class="col-md-6">
          <div class="ee-form-group">
            <label>Status</label>
            <select name="status" class="ee-input">
              <option value="PENDING"   <%= "PENDING".equals(status)   ? "selected":"" %>>Pending</option>
              <option value="CONFIRMED" <%= "CONFIRMED".equals(status) ? "selected":"" %>>Confirmed</option>
              <option value="CANCELLED" <%= "CANCELLED".equals(status) ? "selected":"" %>>Cancelled</option>
            </select>
          </div>
        </div>
      </div>
      <% if (imageUrl != null && !imageUrl.isEmpty()) { %>
        <img src="<%= imageUrl %>" style="width:100%;height:160px;object-fit:cover;border-radius:var(--radius-sm);margin-bottom:1rem;">
      <% } %>
      <div style="display:flex;gap:1rem;margin-top:0.5rem;">
        <button type="submit" class="btn-ee btn-ee--primary">
          <i class="bi bi-save"></i> Update
        </button>
        <a href="<%=request.getContextPath()%>/admin/views/trip_table.jsp" class="btn-ee btn-ee--ocean">
          <i class="bi bi-arrow-left"></i> Back
        </a>
      </div>
    </form>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>