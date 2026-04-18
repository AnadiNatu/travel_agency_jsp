<%@ page import="java.sql.*" %>
<%@ include file="../auth.jsp" %>
<%@ include file="user_service.jsp" %>

<%
    request.setCharacterEncoding("UTF-8");
    
Integer id = (Integer) session.getAttribute("id");

if(id == null){
response.sendRedirect("../login.jsp");
return;
    }
    
String name = "" , email = "" , phone = "";

try{
ResultSet rs = getUserDetails(id);
    
    if(rs.next()){
    name = rs.getString("name");
    email = rs.getString("email");
    phone = rs.getString("phone_number");
    }
    } catch(Exception ex){
    out.print("<div class='text-danger'>Error loading user: " + ex.getMessage() + "</div>");
}

if("POST".equalsIgnoreCase(request.getMethod())){
        
try{
boolean success = updateUserProfile(
id ,
request.getParameter("name"),
request.getParameter("email"),
request.getParameter("phone")
);

if(success){
    response.sendRedirect("user_dashboard.jsp?msg=updated");
    }
    }catch(Exception ex){
            out.print("<div class='text-danger'>Update Error: "+ex.getMessage()+"</div>");
    }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit Profile | ExploreEase</title>

    <!-- STYLE LIBRARIES -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <style>
        body {
            background: url('https://images.unsplash.com/photo-1507525428034-b723cf961d3e')
                        center/cover fixed no-repeat;
            font-family: 'Poppins', sans-serif;
        }

        .glass-container {
            background: rgba(255,255,255,0.15);
            padding: 35px;
            border-radius: 20px;
            backdrop-filter: blur(18px);
            border: 1px solid rgba(255,255,255,0.25);
            box-shadow: 0 10px 28px rgba(0,0,0,0.25);
        }

        label {
            font-weight: 600;
            color: white;
        }

        .form-control {
            border-radius: 12px;
            border: none;
            padding: 10px 12px;
        }

        .btn-warning {
            background: #ffc107;
            border: none;
            font-weight: 600;
            border-radius: 12px;
        }

        .btn-warning:hover {
            background: #ffce3a;
        }

        h3 {
            color: #fff;
            font-weight: 700;
        }
    </style>
</head>

<body>

<%@ include file="user_navbar.jsp" %>


<body class="bg-light">

<div class="container mt-5">
<h3>Edit Profile</h3>

<form method="post">

<div class="mb-3">
<label>Name</label>
<input type="text" class="form-control" name="name" value="<%= name %>" required>
</div>

<div class="mb-3">
<label>Email</label>
<input type="email" class="form-control" name="email" value="<%= email %>" required>
</div>

<div class="mb-3">
<label>Phone</label>
<input type="text" class="form-control" name="phone" value="<%= phone %>">
</div>

<button class="btn btn-warning">Update</button>
<a href="user_dashboard.jsp" class="btn btn-secondary">Back</a>

</form>

</div>
<%@ include file="user_footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
