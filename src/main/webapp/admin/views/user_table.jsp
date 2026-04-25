<%@ include file="../../auth.jsp" %>
<%@ include file="../admin_service.jsp" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
  String role = (String) session.getAttribute("role");
  if (role == null || !"Admin".equalsIgnoreCase(role)) {
    response.sendRedirect(request.getContextPath() + "/login.jsp?error=unauthorized");
    return;
  }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>User Management | Admin</title>
  <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@600&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/global.css">
</head>
<body>

<%@ include file="../admin_navbar.jsp" %>

<div class="admin-content">
  <div style="margin-bottom:2rem;">
    <span class="ee-section__label">Registered Members</span>
    <h2 style="color:var(--ocean);margin:0;">User Management</h2>
  </div>

  <% if ("deleted".equals(request.getParameter("msg"))) { %>
    <div class="ee-alert ee-alert--danger"><i class="bi bi-trash"></i> User deleted successfully.</div>
  <% } %>
  <% if ("updated".equals(request.getParameter("msg"))) { %>
    <div class="ee-alert ee-alert--success"><i class="bi bi-check-circle"></i> User updated successfully.</div>
  <% } %>

  <div style="overflow-x:auto;">
  <table class="ee-table">
    <thead>
      <tr><th>ID</th><th>Name</th><th>Email</th><th>Username</th><th>Phone</th><th>Role</th><th>Actions</th></tr>
    </thead>
    <tbody>
    <%
      try {
        ResultSet rs = getAllUsers();
        while (rs.next()) {
    %>
      <tr>
        <td><strong>#<%= rs.getInt("id") %></strong></td>
        <td><i class="bi bi-person-circle" style="color:var(--gold);margin-right:6px;"></i><%= rs.getString("name") %></td>
        <td><%= rs.getString("email") %></td>
        <td><span style="color:var(--text-light);">@</span><%= rs.getString("username") %></td>
        <td><%= rs.getString("phone_number") %></td>
        <td>
          <% if ("Admin".equalsIgnoreCase(rs.getString("role"))) { %>
            <span class="ee-badge ee-badge--admin">Admin</span>
          <% } else { %>
            <span class="ee-badge ee-badge--user">User</span>
          <% } %>
        </td>
        <td style="white-space:nowrap;">
          <a href="<%=request.getContextPath()%>/admin/views/edit_user_details.jsp?id=<%= rs.getInt("id") %>" class="btn-ee btn-ee--ocean btn-ee--sm" style="display:inline-flex;"><i class="bi bi-pencil"></i></a>
          <a href="<%=request.getContextPath()%>/admin/controllers/delete_user.jsp?id=<%= rs.getInt("id") %>" onclick="return confirm('Delete this user?');" class="btn-ee btn-ee--danger btn-ee--sm" style="display:inline-flex;margin-left:6px;"><i class="bi bi-trash"></i></a>
        </td>
      </tr>
    <%
        }
      } catch (Exception e) {
        out.print("<tr><td colspan='7'><div class='ee-alert ee-alert--danger'>" + e.getMessage() + "</div></td></tr>");
      }
    %>
    </tbody>
  </table>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>