<%@ include file="../../auth.jsp" %>
<%@ include file="../user_service.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
  request.setCharacterEncoding("UTF-8");
  Integer id = (Integer) session.getAttribute("id");
  if (id == null) { response.sendRedirect(request.getContextPath() + "/login.jsp"); return; }
  String name = "", email = "", phone = "";
  try {
    ResultSet rs = getUserDetails(id);
    if (rs.next()) { name = rs.getString("name"); email = rs.getString("email"); phone = rs.getString("phone_number"); }
  } catch (Exception ex) { out.print("<div class='ee-alert ee-alert--danger'>" + ex.getMessage() + "</div>"); }
  if ("POST".equalsIgnoreCase(request.getMethod())) {
    try {
      boolean success = updateUserProfile(id, request.getParameter("name"), request.getParameter("email"), request.getParameter("phone"));
      if (success) { response.sendRedirect(request.getContextPath() + "/user/views/user_dashboard.jsp?msg=updated"); return; }
    } catch (Exception ex) { out.print("<div class='ee-alert ee-alert--danger'>" + ex.getMessage() + "</div>"); }
  }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Edit Profile | ExploreEase</title>
  <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,600&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/global.css">
  <style>
    body {
      background: linear-gradient(rgba(10,35,66,0.85), rgba(10,35,66,0.75)),
                  url('https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=1600') center/cover fixed;
      min-height: 100vh;
    }
  </style>
</head>
<body>
<%@ include file="../user_navbar.jsp" %>
<div class="container py-5" style="max-width:560px;">
  <div class="glass-card">
    <span class="ee-section__label">Account</span>
    <h3 style="color:white;font-family:'Cormorant Garamond',serif;margin-bottom:1.5rem;">Edit Profile</h3>
    <form method="post">
      <div class="ee-form-group"><label style="color:rgba(255,255,255,0.6);">Full Name</label><input type="text" class="ee-input ee-input--glass" name="name" value="<%= name %>" required></div>
      <div class="ee-form-group"><label style="color:rgba(255,255,255,0.6);">Email</label><input type="email" class="ee-input ee-input--glass" name="email" value="<%= email %>" required></div>
      <div class="ee-form-group"><label style="color:rgba(255,255,255,0.6);">Phone</label><input type="text" class="ee-input ee-input--glass" name="phone" value="<%= phone %>"></div>
      <div style="display:flex;gap:1rem;margin-top:0.5rem;">
        <button type="submit" class="btn-ee btn-ee--primary"><i class="bi bi-save"></i> Save Changes</button>
        <a href="<%=request.getContextPath()%>/user/views/user_dashboard.jsp" class="btn-ee btn-ee--outline">Back</a>
      </div>
    </form>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>