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
    background: url('https://images.unsplash.com/photo-1507525428034-b723cf961d3e')
                center/cover fixed no-repeat;
    backdrop-filter: blur(3px);
    color: #fff;
}

.glass-card {
    background: rgba(255, 255, 255, 0.18);
    backdrop-filter: blur(16px);
    border-radius: 20px;
    padding: 35px;
    border: 1px solid rgba(255,255,255,0.25);
    box-shadow: 0 10px 30px rgba(0,0,0,0.20);
}

.form-control {
    border-radius: 12px;
    border: none;
}

.form-control:focus {
    box-shadow: none;
}

.form-control[readonly] {
    background: rgba(255,255,255,0.6);
    font-weight: 500;
}

.btn-warning {
    border-radius: 12px;
    padding: 10px 0;
    font-weight: 600;
    transition: 0.3s;
}

.btn-warning:hover {
    transform: translateY(-2px);
    background: #ffcc33;
}

.contact-info i {
    font-size: 22px;
    margin-right: 8px;
    color: #ffc107;
}
</style>
</head>

<body>

<%@ include file="user_navbar.jsp" %>

<div class="container py-5">

<h1 class="text-center fw-bold mb-4 text-warning">Contact Us</h1>
<p class="text-center text-light mb-5">
    We'd love to hear from you! Reach out for support or feedback.
</p>

<div class="row g-4">

<!-- FORM -->
<div class="col-lg-6">
<div class="glass-card">

<h4 class="text-warning fw-bold mb-3">Send Us a Message</h4>

<form onsubmit="sendMail(event)">

<div class="mb-3">
<label>Full Name</label>
<input type="text" id="name" class="form-control p-3"
       value="<%= name %>" readonly>
</div>

<div class="mb-3">
<label>Email Address</label>
<input type="email" id="email" class="form-control p-3"
       value="<%= email %>" readonly>
</div>

<div class="mb-3">
<label>Type</label>
<select id="type" class="form-control p-3" required>
    <option value="">Select Type</option>
    <option value="Feedback">Feedback</option>
    <option value="Issue">Issue</option>
</select>
</div>

<div class="mb-3">
<label>Message</label>
<textarea id="message" class="form-control p-3" rows="5" required></textarea>
</div>

<button type="submit" class="btn btn-warning w-100">
    <i class="bi bi-send-fill"></i> Send Message
</button>

</form>

</div>
</div>

<!-- CONTACT INFO -->
<div class="col-lg-6">
<div class="glass-card h-100">

<h4 class="text-warning fw-bold mb-3">Reach Us</h4>

<p><i class="bi bi-geo-alt-fill"></i> Mumbai, India</p>
<p><i class="bi bi-envelope-fill"></i> support@exploreease.com</p>
<p><i class="bi bi-telephone-fill"></i> +91 98765 43210</p>

<h5 class="text-warning mt-4">Follow Us</h5>
<div class="d-flex gap-3">
    <i class="bi bi-facebook fs-4"></i>
    <i class="bi bi-instagram fs-4"></i>
    <i class="bi bi-twitter fs-4"></i>
</div>

</div>
</div>

</div>
</div>

<footer class="bg-dark text-white text-center py-3 mt-5">
    <p class="mb-0">
        &copy; <%= java.time.Year.now() %> ExploreEase | All Rights Reserved
    </p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/emailjs-com@3/dist/email.min.js"></script>

<script>
(function(){
emailjs.init("YOUR_PUBLIC_KEY");
})();

function sendMail(e){
e.preventDefault();

emailjs.send("service_id","template_id",{
    name: document.getElementById("name").value,
    email: document.getElementById("email").value,
    type: document.getElementById("type").value,
    message: document.getElementById("message").value
})
.then(function(){
    alert("✅ Message Sent Successfully!");
})
.catch(function(error){
    alert("❌ Error sending message");
    console.log(error);
});
}
</script>

</body>
</html>