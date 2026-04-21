<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="/user/user_service.jsp" %>

<%
Integer userId = (Integer) session.getAttribute("id");

String name = "";
String email = "";

try {
    if(userId != null){
        ResultSet rs = getUserDetails(userId);
        if(rs.next()){
            name = rs.getString("name");
            email = rs.getString("email");
        }
    }
} catch(Exception e){
    name = "";
    email = "";
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>ExploreEase | Contact Us</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<style>
body {
    font-family: 'Poppins', sans-serif;
    background: url('https://images.unsplash.com/photo-1507525428034-b723cf961d3e') center/cover fixed;
    backdrop-filter: blur(3px);
    color: #fff;
}
.glass-card {
    background: rgba(255,255,255,0.18);
    backdrop-filter: blur(16px);
    border-radius: 20px;
    padding: 35px;
}
.form-control {
    border-radius: 12px;
    border: none;
}
.btn-warning {
    border-radius: 12px;
    font-weight: 600;
}
</style>
</head>

<body>

<%@ include file="user_navbar.jsp" %>

<div class="container py-5">

<h1 class="text-center text-warning mb-4">Contact Us</h1>

<% if("sent".equals(request.getParameter("msg"))){ %>
<div class="alert alert-success text-center">
✅ Message sent successfully!
</div>
<% } %>

<div class="row g-4">

<div class="col-lg-6">
<div class="glass-card">

<h4 class="text-warning mb-3">Send Message</h4>

<form action="<%= request.getContextPath() %>/user/action/contact_action.jsp" method="POST">

<input type="hidden" name="name" value="<%= name %>">
<input type="hidden" name="email" value="<%= email %>">

<div class="mb-3">
<label>Full Name</label>
<input type="text" class="form-control p-3" value="<%= name %>" readonly>
</div>

<div class="mb-3">
<label>Email</label>
<input type="email" class="form-control p-3" value="<%= email %>" readonly>
</div>

<div class="mb-3">
<label>Type</label>
<select name="type" class="form-control p-3" required>
<option value="">Select</option>
<option value="Feedback">Feedback</option>
<option value="Issue">Issue</option>
</select>
</div>

<div class="mb-3">
<label>Message</label>
<textarea name="message" class="form-control p-3" rows="5" required></textarea>
</div>

<button class="btn btn-warning w-100">
<i class="bi bi-send-fill"></i> Send Message
</button>

</form>

</div>
</div>

<div class="col-lg-6">
<div class="glass-card">
<h4 class="text-warning mb-3">Reach Us</h4>

<p><i class="bi bi-geo-alt"></i> Mumbai, India</p>
<p><i class="bi bi-envelope"></i> support@exploreease.com</p>
<p><i class="bi bi-telephone"></i> +91 9876543210</p>

</div>
</div>

</div>
</div>

</body>
</html>