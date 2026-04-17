<%@ page import="java.sql.*" %>
<%@ include file="/auth.jsp" %>
<%@ include file="user_service.jsp" %>

<%
String authUser = (String) session.getAttribute("authUser");
String role = (String) session.getAttribute("role");
Integer id = (Integer) session.getAttribute("id");

if (authUser == null || id == null) {
    response.sendRedirect(request.getContextPath() + "/login.jsp?error=invalid_session");
    return;
}

String profilePhoto = "../images/default_profile.png";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>User Dashboard | ExploreEase</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<style>
body {
    font-family: 'Poppins', sans-serif;
    background: url('https://images.unsplash.com/photo-1469854523086-cc02fe5d8800') center/cover fixed no-repeat;
    color: white;
}

.glass-card {
    background: rgba(255,255,255,0.15);
    border-radius: 20px;
    padding: 25px;
    backdrop-filter: blur(20px);
}

.profile-img {
    width: 140px;
    height: 140px;
    border-radius: 50%;
    border: 3px solid #ffc107;
    object-fit: cover;
}
</style>
</head>

<body>

<%@ include file="user_navbar.jsp" %>

<div class="container py-5">

<!-- SUCCESS MESSAGES -->
<%
if ("updated".equals(request.getParameter("msg"))) {
%>
<div class="alert alert-success">Profile Updated Successfully</div>
<% } %>

<%
if ("success".equals(request.getParameter("booking"))) {
%>
<div class="alert alert-success">Booking Successful</div>
<% } %>

<div class="row g-4">

<!-- LEFT PANEL -->
<div class="col-lg-4">
<div class="glass-card text-center">

<%
try {
    ResultSet rsImg = getUserDetails(id);
    if(rsImg.next()){
        String img = rsImg.getString("profile_photo");
        if(img != null && !img.isEmpty()){
            profilePhoto = img;
        }
    }
} catch(Exception e){}
%>

<img src="<%= profilePhoto %>" class="profile-img mb-3">

<h4><%= authUser %></h4>
<p><%= role %></p>

<form action="user_profile_photo.jsp" method="post" enctype="multipart/form-data">
<input type="file" name="profilePic" class="form-control mb-2" required>
<button class="btn btn-warning w-100">Upload Photo</button>
</form>

<div class="mt-3">
<a href="edit_user_details.jsp" class="btn btn-outline-warning w-100 mb-2">Edit Profile</a>
<a href="booking_trip.jsp" class="btn btn-warning w-100 text-dark">Book Trip</a>
</div>

</div>
</div>

<!-- RIGHT PANEL -->
<div class="col-lg-8">

<!-- USER DETAILS -->
<div class="glass-card mb-4">
<h5>Your Details</h5>

<%
try {
ResultSet rs = getUserDetails(id);

if(rs.next()){
%>

<p><strong>Name:</strong> <%= rs.getString("name") %></p>
<p><strong>Email:</strong> <%= rs.getString("email") %></p>
<p><strong>Username:</strong> <%= rs.getString("username") %></p>
<p><strong>Phone:</strong> <%= rs.getString("phone_number") %></p>
<p><strong>DOB:</strong> <%= rs.getString("dob") %></p>
<p><strong>Age:</strong> <%= rs.getInt("age") %></p>

<%
}
} catch(Exception e){
out.print(e.getMessage());
}
%>

</div>

<!-- BOOKINGS -->
<div class="glass-card">
<h5>Your Bookings</h5>

<%
try {
ResultSet rs2 = getUserBookings(id);

if (!rs2.isBeforeFirst()) {
%>
<p>No bookings yet</p>
<%
} else {
%>

<div class="accordion" id="bookingAcc">

<%
int i = 1;
while(rs2.next()){
%>

<div class="accordion-item">
<h2 class="accordion-header">
<button class="accordion-button <%= i==1?"":"collapsed" %>" data-bs-toggle="collapse" data-bs-target="#b<%=i%>">
Booking #<%= rs2.getInt("id") %> - <%= rs2.getString("city") %>
</button>
</h2>

<div id="b<%=i%>" class="accordion-collapse collapse <%= i==1?"show":"" %>">
<div class="accordion-body text-dark">

<p><strong>Country:</strong> <%= rs2.getString("country") %></p>
<p><strong>Date:</strong> <%= rs2.getString("travel_date") %></p>

<p><strong>Status:</strong>
<%
String status = rs2.getString("status");

if("CONFIRMED".equalsIgnoreCase(status)){
%>
<span class="badge bg-success">CONFIRMED</span>
<% } else if("PENDING".equalsIgnoreCase(status)){ %>
<span class="badge bg-warning">PENDING</span>
<% } else { %>
<span class="badge bg-danger">CANCELLED</span>
<% } %>
</p>

</div>
</div>
</div>

<%
i++;
}
%>

</div>

<%
}
} catch(Exception e){
out.print(e.getMessage());
}
%>

</div>

</div>
</div>
</div>

<%@ include file="user_footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>