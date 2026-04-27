<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login | Explore Ease</title>
  <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,600;1,300&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/global.css">
</head>
<body>

<div class="login-scene">
  <div class="login-scene__bg" style="background-image:url('https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=1600');"></div>

  <div class="login-scene__panel">
    <div class="login-card">
      <div class="login-card__logo"><i class="bi bi-compass"></i> ExploreEase</div>
      <h2 class="login-card__title">Welcome Back</h2>
      <p class="login-card__sub">Sign in to continue your journey</p>

      <%
        String error = request.getParameter("error");
        if ("missing".equals(error)) {
      %><div class="ee-alert ee-alert--danger">Please enter username &amp; password.</div>
      <% } else if ("invalid".equals(error)) { %>
        <div class="ee-alert ee-alert--danger">Invalid credentials. Please try again.</div>
      <% } else if ("loginrequired".equals(error)) { %>
        <div class="ee-alert ee-alert--info">Please login to continue.</div>
      <% } else if ("invalid_session".equals(error)) { %>
        <div class="ee-alert ee-alert--danger">Session expired. Please login again.</div>
      <% } %>

      <form action="<%=request.getContextPath()%>/code_login.jsp" method="post">
        <div class="ee-form-group">
          <label style="color:rgba(255,255,255,0.6)"><i class="bi bi-person"></i> Username</label>
          <input name="username" type="text" class="ee-input ee-input--glass" placeholder="your username" required>
        </div>
        <div class="ee-form-group">
          <label style="color:rgba(255,255,255,0.6)"><i class="bi bi-lock"></i> Password</label>
          <input name="password" type="password" class="ee-input ee-input--glass" placeholder="••••••••" required>
        </div>
        <button type="submit" class="btn-ee btn-ee--primary" style="width:100%;justify-content:center;margin-top:0.5rem;">
          Sign In <i class="bi bi-arrow-right"></i>
        </button>
      </form>

      <p style="text-align:center;margin-top:1.5rem;color:rgba(255,255,255,0.5);font-size:0.88rem;">
        No account? <a href="<%=request.getContextPath()%>/register.jsp" style="color:var(--gold-light);">Register here</a>
      </p>
      <p style="text-align:center;margin-top:0.5rem;">
        <a href="<%=request.getContextPath()%>/home.jsp" style="color:rgba(255,255,255,0.4);font-size:0.82rem;">← Back to Home</a>
      </p>
    </div>
  </div>
</div>

</body>
</html>