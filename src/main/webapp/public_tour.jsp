<%@ include file="user/user_service.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>Public Tours</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
.tour-img {
    height: 230px;
    object-fit: cover;
}
</style>

</head>

<body>

<%@ include file="public_navbar.jsp" %>

<div class="container py-5">
<div class="row g-4">

<%
try {

    ResultSet rs = getAllDestination();

    while(rs.next()) {

        String img = rs.getString("destination_image");

        if(img == null || img.isEmpty()) {
            img = "https://via.placeholder.com/400x300";
        }
%>

<div class="col-md-4">
<div class="card shadow-sm">

<img src="<%= img %>" class="card-img-top tour-img">

<div class="card-body">

<h5><%= rs.getString("tour_title") %></h5>

<p><%= rs.getString("city") %>, <%= rs.getString("country") %></p>

<a href="login.jsp" class="btn btn-warning w-100">
Login to Book
</a>

</div>
</div>
</div>

<%
    }

} catch(Exception e) {
    out.print(e.getMessage());
}
%>

</div>
</div>

</body>
</html>