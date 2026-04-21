<%@include file="/auth.jsp"%>
<%@include file="user_service.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>Tours</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
.tour-img {
    height: 230px;
    object-fit: cover;
}
</style>
</head>

<body>
    <%@include file="user_navbar.jsp"%>
    
    <div class="container py-5">
        <form method="get" class="row mb-4">
    <div class="col-md-4">
        <input type="text" name="search" class="form-control" placeholder="Search destination...">
    </div>

    <div class="col-md-4">
        <select name="country" class="form-control">
            <option value="">All Countries</option>
            <option>India</option>
            <option>France</option>
            <option>Japan</option>
            <option>UAE</option>
            <option>Indonesia</option>
        </select>
    </div>

    <div class="col-md-4">
        <button class="btn btn-warning w-100">Search</button>
    </div>
</form>
        <div class="row g-4">
            <%
            try{
            ResultSet rs = getAllDestination();
            
            while(rs.next()){
            String img = rs.getString("destination_image");
            
            if(img == null || img.isEmpty()){
            img = "https://via.placeholder.com/400x300";
                }
            %>
            
            <div class="col-md-4">
                <div class="card shadow-sm">
                    <img src="<%= img %>" class="card-img-top tour-img">
                
                
                    <div class="card-body">
                        <h5><%= rs.getString("tour_title")%></h5>
                        
                        <p><%= rs.getString("city")%> , <%= rs.getString("tour_title")%></p>
                        
                        <a href="booking_trip.jsp?tourTitle=<%= rs.getString("tour_title") %>
&country=<%= rs.getString("country") %>
&city=<%= rs.getString("city") %>"
class="btn btn-warning w-100">
Book Now
</a>
                    </div>
                </div>
            </div>
<%
    }
}catch(Exception ex){
out.println(ex.getMessage());
}
%>
        </div>
        
    </div>
    
</body>