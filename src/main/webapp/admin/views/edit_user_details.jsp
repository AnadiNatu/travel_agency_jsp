<%@ include file="../../auth.jsp" %>
<%@ include file="../admin_service.jsp" %>
<%--<%@ page contentType="text/html;charset=UTF-8"%>--%>
<%
  request.setCharacterEncoding("UTF-8");
  String roleSession = (String) session.getAttribute("role");
  if (!"Admin".equalsIgnoreCase(roleSession)) {
    response.sendRedirect(request.getContextPath() + "/login.jsp?error=unauthorized");
    return;
  }
  int id = Integer.parseInt(request.getParameter("id"));
  String name = "", email = "", phone = "", role = "";
  try {
    ResultSet rs = getUserById(id);
    if (rs.next()) {
      name  = rs.getString("name");
      email = rs.getString("email");
      phone = rs.getString("phone_number");
      role  = rs.getString("role");
    }
  } catch (Exception ex) {
    out.print("<div class='ee-alert ee-alert--danger'>Error loading user: " + ex.getMessage() + "</div>");
  }
  if ("POST".equalsIgnoreCase(request.getMethod())) {
    try {
      boolean success = updateUser(id,
        request.getParameter("name"), request.getParameter("email"),
        request.getParameter("phone"), request.getParameter("role")
      );
      if (success) {
        response.sendRedirect(request.getContextPath() + "/admin/views/user_table.jsp?msg=updated");
        return;
      }
    } catch (Exception ex) {
      out.print("<div class='ee-alert ee-alert--danger'>Update Error: " + ex.getMessage() + "</div>");
    }
  }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit User | Admin</title>
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
    <h2 style="color:var(--ocean);margin:0;">Edit User Details</h2>
  </div>

  <div style="max-width:560px;background:var(--white);border-radius:var(--radius-md);padding:2.5rem;box-shadow:var(--shadow-md);">
    <form method="post">
      <input type="hidden" name="id" value="<%= id %>">
      <div class="ee-form-group">
        <label>Full Name</label>
        <input type="text" class="ee-input" name="name" value="<%= name %>" required>
      </div>
      <div class="ee-form-group">
        <label>Email</label>
        <input type="email" class="ee-input" name="email" value="<%= email %>" required>
      </div>
      <div class="ee-form-group">
        <label>Phone</label>
        <input type="text" class="ee-input" name="phone" value="<%= phone %>">
      </div>
      <div class="ee-form-group">
        <label>Role</label>
        <select name="role" class="ee-input">
          <option value="User"  <%= "User".equalsIgnoreCase(role)  ? "selected":"" %>>User</option>
          <option value="Admin" <%= "Admin".equalsIgnoreCase(role) ? "selected":"" %>>Admin</option>
        </select>
      </div>
      <div style="display:flex;gap:1rem;margin-top:0.5rem;">
        <button type="submit" class="btn-ee btn-ee--primary">
          <i class="bi bi-save"></i> Save Changes
        </button>
        <a href="<%=request.getContextPath()%>/admin/views/user_table.jsp" class="btn-ee btn-ee--ocean">
          <i class="bi bi-arrow-left"></i> Back
        </a>
      </div>
    </form>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>