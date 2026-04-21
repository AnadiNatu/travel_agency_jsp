<%@ page import="java.sql.*" %>
<%@ include file="user_service.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Book Trip | ExploreEase</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    font-family: 'Poppins', sans-serif;
    background: url('https://images.unsplash.com/photo-1507525428034-b723cf961d3e') center/cover fixed;
    color: white;
}

.glass-card {
    background: rgba(255,255,255,0.18);
    backdrop-filter: blur(16px);
    border-radius: 20px;
    padding: 25px;
}
</style>
</head>

<body>

<%@ include file="user_navbar.jsp" %>

<%
String tourTitle = request.getParameter("tourTitle");
String country = request.getParameter("country");
String city = request.getParameter("city");
String travelDate = request.getParameter("travel_date");

boolean isDirect = (tourTitle != null && !tourTitle.isEmpty());
%>

<div class="container py-5">

<div class="row g-4">

<!-- LEFT SIDE -->
<div class="col-lg-4">
<div class="glass-card">

<% if(isDirect){ %>

<h4><%= tourTitle %></h4>
<p><%= city %>, <%= country %></p>
<p>Date: <%= travelDate %></p>

<% } else { %>

<h5>Select Trip</h5>

<select id="tripSelect" class="form-control">
<option value="">-- Choose Trip --</option>

<%
try{
ResultSet rs = getAllDestination();

while(rs.next()){
%>

<option 
value="<%= rs.getString("tour_title") %>"
data-country="<%= rs.getString("country") %>"
data-city="<%= rs.getString("city") %>"
data-date="<%= rs.getString("travel_date") %>">

<%= rs.getString("tour_title") %> - <%= rs.getString("city") %>

</option>

<%
}
}catch(Exception e){
out.print(e.getMessage());
}
%>

</select>

<% } %>

</div>
</div>

<!-- RIGHT SIDE -->
<div class="col-lg-6">
<div class="glass-card">

<h4>Booking Details</h4>

<form action="code_booking.jsp" method="POST">

<input type="hidden" id="tourTitle" name="tourTitle" value="<%= tourTitle!=null?tourTitle:"" %>">
<input type="hidden" id="country" name="country" value="<%= country!=null?country:"" %>">
<input type="hidden" id="city" name="city" value="<%= city!=null?city:"" %>">
<input type="hidden" id="travel_date" name="travel_date" value="<%= travelDate!=null?travelDate:"" %>">

<div class="mb-3">
<label>First Name</label>
<input type="text" name="first_name" class="form-control" required>
</div>

<div class="mb-3">
<label>Last Name</label>
<input type="text" name="last_name" class="form-control" required>
</div>

<div class="mb-3">
<label>Email</label>
<input type="email" name="email" class="form-control" required>
</div>

<div class="mb-3">
<label>Phone</label>
<input type="text" name="phone" class="form-control" required>
</div>

<button class="btn btn-warning w-100 mt-3">Confirm Booking</button>

</form>

</div>
</div>

</div>
</div>

<script>
document.getElementById("tripSelect")?.addEventListener("change", function(){

let selected = this.options[this.selectedIndex];

document.getElementById("tourTitle").value = selected.value;
document.getElementById("country").value = selected.getAttribute("data-country");
document.getElementById("city").value = selected.getAttribute("data-city");
document.getElementById("travel_date").value = selected.getAttribute("data-date");

});
</script>

</body>
</html>