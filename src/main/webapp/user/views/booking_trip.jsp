<%@ include file="../../auth.jsp" %>
<%@ include file="../user_service.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Book Trip | ExploreEase</title>
  <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,600&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/global.css">
  <style>
    body {
      background: linear-gradient(rgba(10,35,66,0.82), rgba(10,35,66,0.72)),
                  url('https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=1600') center/cover fixed;
      min-height: 100vh;
    }
  </style>
</head>
<body>

<%@ include file="../user_navbar.jsp" %>

<%
  String tourTitle = request.getParameter("tourTitle");
  String country   = request.getParameter("country");
  String city      = request.getParameter("city");
  String travelDate= request.getParameter("travel_date");
  boolean isDirect = (tourTitle != null && !tourTitle.isEmpty());
%>

<div class="container py-5">
  <div class="row g-4 justify-content-center">

    <!-- LEFT: Trip Info / Selector -->
    <div class="col-lg-4">
      <div class="glass-card">
        <% if (isDirect) { %>
          <span class="ee-section__label">Your Selection</span>
          <h4 style="color:white;font-family:'Cormorant Garamond',serif;margin-bottom:0.8rem;"><%= tourTitle %></h4>
          <p style="color:rgba(255,255,255,0.7);"><i class="bi bi-geo-alt"></i> <%= city %>, <%= country %></p>
          <p style="color:rgba(255,255,255,0.7);"><i class="bi bi-calendar3"></i> <%= travelDate %></p>
        <% } else { %>
          <span class="ee-section__label">Choose a Destination</span>
          <h4 style="color:white;font-family:'Cormorant Garamond',serif;margin-bottom:1rem;">Select Trip</h4>
          <select id="tripSelect" class="ee-input ee-input--glass">
            <option value="">-- Choose Trip --</option>
            <%
              try {
                ResultSet rs = getAllDestination();
                while (rs.next()) {
            %>
              <option value="<%= rs.getString("tour_title") %>"
                      data-country="<%= rs.getString("country") %>"
                      data-city="<%= rs.getString("city") %>"
                      data-date="<%= rs.getString("travel_date") %>">
                <%= rs.getString("tour_title") %> — <%= rs.getString("city") %>
              </option>
            <%
                }
              } catch (Exception e) { out.print(e.getMessage()); }
            %>
          </select>
        <% } %>
      </div>
    </div>

    <!-- RIGHT: Booking Form -->
    <div class="col-lg-6">
      <div class="glass-card">
        <span class="ee-section__label">Your Details</span>
        <h4 style="color:white;font-family:'Cormorant Garamond',serif;margin-bottom:1.5rem;">Booking Form</h4>

        <form action="<%=request.getContextPath()%>/user/controllers/code_booking.jsp" method="POST">
          <input type="hidden" id="tourTitle" name="tourTitle" value="<%= tourTitle!=null?tourTitle:"" %>">
          <input type="hidden" id="country"   name="country"   value="<%= country!=null?country:"" %>">
          <input type="hidden" id="city"      name="city"      value="<%= city!=null?city:"" %>">
          <input type="hidden" id="travel_date" name="travel_date" value="<%= travelDate!=null?travelDate:"" %>">

          <div class="row g-3">
            <div class="col-md-6">
              <div class="ee-form-group">
                <label style="color:rgba(255,255,255,0.6);">First Name</label>
                <input type="text" name="first_name" class="ee-input ee-input--glass" required>
              </div>
            </div>
            <div class="col-md-6">
              <div class="ee-form-group">
                <label style="color:rgba(255,255,255,0.6);">Last Name</label>
                <input type="text" name="last_name" class="ee-input ee-input--glass" required>
              </div>
            </div>
            <div class="col-md-6">
              <div class="ee-form-group">
                <label style="color:rgba(255,255,255,0.6);">Email</label>
                <input type="email" name="email" class="ee-input ee-input--glass" required>
              </div>
            </div>
            <div class="col-md-6">
              <div class="ee-form-group">
                <label style="color:rgba(255,255,255,0.6);">Phone</label>
                <input type="text" name="phone" class="ee-input ee-input--glass" required>
              </div>
            </div>
          </div>

          <button type="submit" class="btn-ee btn-ee--primary" style="width:100%;justify-content:center;margin-top:0.5rem;">
            <i class="bi bi-check-circle"></i> Confirm Booking
          </button>
        </form>
      </div>
    </div>

  </div>
</div>

<script>
  document.getElementById("tripSelect")?.addEventListener("change", function() {
    let sel = this.options[this.selectedIndex];
    document.getElementById("tourTitle").value   = sel.value;
    document.getElementById("country").value     = sel.getAttribute("data-country");
    document.getElementById("city").value        = sel.getAttribute("data-city");
    document.getElementById("travel_date").value = sel.getAttribute("data-date");
  });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>