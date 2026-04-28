<%@ include file="../../auth.jsp" %>
<%@ include file="../user_service.jsp" %>
<%--<%@ page contentType="text/html;charset=UTF-8" %>--%>
<%
  Integer userId = (Integer) session.getAttribute("id");
  String name = "", email = "";
  try {
    if (userId != null) {
      ResultSet rs = getUserDetails(userId);
      if (rs.next()) { name = rs.getString("name"); email = rs.getString("email"); }
    }
  } catch (Exception e) { name = ""; email = ""; }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Contact | ExploreEase</title>
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

<div class="container py-5">
  <div class="text-center mb-5">
    <span class="ee-section__label">Get in Touch</span>
    <h2 style="color:white;font-family:'Cormorant Garamond',serif;">Contact Us</h2>
  </div>

  <% if ("sent".equals(request.getParameter("msg"))) { %>
    <div class="ee-alert ee-alert--success" style="background:rgba(26,122,74,0.25);border-color:var(--gold);color:var(--gold-light);">
      <i class="bi bi-check-circle"></i> Message sent successfully!
    </div>
  <% } %>

  <div class="row g-4 justify-content-center">
    <div class="col-lg-6">
      <div class="glass-card">
        <h5 style="color:var(--gold-light);font-family:'Cormorant Garamond',serif;margin-bottom:1.5rem;">Send a Message</h5>
        <form action="<%=request.getContextPath()%>/user/controller/contact_action.jsp" method="POST">
          <input type="hidden" name="name"  value="<%= name %>">
          <input type="hidden" name="email" value="<%= email %>">
          <div class="ee-form-group">
            <label style="color:rgba(255,255,255,0.6);">Your Name</label>
            <input type="text" class="ee-input ee-input--glass" value="<%= name %>" readonly>
          </div>
          <div class="ee-form-group">
            <label style="color:rgba(255,255,255,0.6);">Email</label>
            <input type="email" class="ee-input ee-input--glass" value="<%= email %>" readonly>
          </div>
          <div class="ee-form-group">
            <label style="color:rgba(255,255,255,0.6);">Type</label>
            <select name="type" class="ee-input ee-input--glass" required>
              <option value="">Select type</option>
              <option value="Feedback">Feedback</option>
              <option value="Issue">Issue</option>
            </select>
          </div>
          <div class="ee-form-group">
            <label style="color:rgba(255,255,255,0.6);">Message</label>
            <textarea name="message" class="ee-input ee-input--glass" rows="5" required style="resize:vertical;"></textarea>
          </div>
          <button type="submit" class="btn-ee btn-ee--primary" style="width:100%;justify-content:center;">
            <i class="bi bi-send-fill"></i> Send Message
          </button>
        </form>
      </div>
    </div>

    <div class="col-lg-4">
      <div class="glass-card">
        <h5 style="color:var(--gold-light);font-family:'Cormorant Garamond',serif;margin-bottom:1.5rem;">Reach Us</h5>
        <p style="color:rgba(255,255,255,0.75);"><i class="bi bi-geo-alt" style="color:var(--gold);margin-right:8px;"></i> Mumbai, India</p>
        <p style="color:rgba(255,255,255,0.75);"><i class="bi bi-envelope" style="color:var(--gold);margin-right:8px;"></i> support@exploreease.com</p>
        <p style="color:rgba(255,255,255,0.75);"><i class="bi bi-telephone" style="color:var(--gold);margin-right:8px;"></i> +91 9876543210</p>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>