<%@ include file="../auth.jsp" %>
<%@ include file="admin_service.jsp" %>
<%@ include file="/config/cloudinary_config.jsp" %>

<%@ page import="java.io.*, java.util.*,
org.apache.commons.fileupload.*,
org.apache.commons.fileupload.disk.*,
org.apache.commons.fileupload.servlet.*,
com.cloudinary.*, com.cloudinary.utils.ObjectUtils" %>

<%
request.setCharacterEncoding("UTF-8");

String role = (String) session.getAttribute("role");
String adminName = (String) session.getAttribute("authUser");

if (!"Admin".equalsIgnoreCase(role)) {
    response.sendRedirect("../login.jsp?error=unauthorized");
    return;
}

int id = Integer.parseInt(request.getParameter("id"));

String tourTitle = "", country = "", city = "", zip = "", status = "", travelDate = "", imageUrl = "";

try {
    ResultSet rs = getBookingById(id);

    if (rs.next()) {
        tourTitle  = rs.getString("tour_title");
        country    = rs.getString("country");
        city       = rs.getString("city");
        zip        = rs.getString("zip_code");
        status     = rs.getString("status");
        travelDate = rs.getString("travel_date");
        imageUrl   = rs.getString("destination_image");
    }

} catch(Exception e) {
    out.print("<div class='text-danger'>Error loading booking</div>");
}

boolean isMultipart = ServletFileUpload.isMultipartContent(request);

if ("POST".equalsIgnoreCase(request.getMethod()) && isMultipart) {

    try {

        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        List<FileItem> items = upload.parseRequest(request);

        File uploadedFile = null;

        String newTourTitle = "", newCountry = "", newCity = "", newZip = "", newStatus = "", newDate = "";

        for (FileItem item : items) {

            if (item.isFormField()) {
                switch(item.getFieldName()) {
                    case "tour_title": newTourTitle = item.getString(); break;
                    case "country": newCountry = item.getString(); break;
                    case "city": newCity = item.getString(); break;
                    case "zip_code": newZip = item.getString(); break;
                    case "status": newStatus = item.getString(); break;
                    case "travel_date": newDate = item.getString(); break;
                }
            } else {
                if (item.getSize() > 0) {
                    File tempFile = File.createTempFile("upload_", ".jpg");
                    item.write(tempFile);
                    uploadedFile = tempFile;
                }
            }
        }

        updateBookingFull(id, newTourTitle, newCountry, newCity, newZip, newDate, newStatus);

        if (uploadedFile != null) {

            Cloudinary cloudinary = getCloudinary();

            Map uploadResult = cloudinary.uploader().upload(uploadedFile, ObjectUtils.asMap(
                "folder", "travel_agency/destination/" + adminName + "/" + newCity,
                "public_id", "destination_image",
                "overwrite", true
            ));

            String uploadedUrl = (String) uploadResult.get("secure_url");

            updateTripImage(id, uploadedUrl);

            uploadedFile.delete();
        }

        response.sendRedirect("trip_table.jsp?msg=updated");
        return;

    } catch(Exception ex) {
        out.print("<div class='text-danger'>Update failed: " + ex.getMessage() + "</div>");
    }
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Edit Trip</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<%@ include file="admin_navbar.jsp" %>

<div class="container mt-4">

<h3>Edit Trip Booking</h3>

<div class="card p-4">

<form method="post" enctype="multipart/form-data">

<input type="text" name="tour_title" class="form-control mb-2" value="<%= tourTitle %>">
<input type="text" name="country" class="form-control mb-2" value="<%= country %>">
<input type="text" name="city" class="form-control mb-2" value="<%= city %>">
<input type="text" name="zip_code" class="form-control mb-2" value="<%= zip %>">
<input type="date" name="travel_date" class="form-control mb-2" value="<%= travelDate %>">

<select name="status" class="form-control mb-2">
<option value="PENDING" <%= "PENDING".equals(status)?"selected":"" %>>PENDING</option>
<option value="CONFIRMED" <%= "CONFIRMED".equals(status)?"selected":"" %>>CONFIRMED</option>
<option value="CANCELLED" <%= "CANCELLED".equals(status)?"selected":"" %>>CANCELLED</option>
</select>

<% if (imageUrl != null && !imageUrl.isEmpty()) { %>
<img src="<%= imageUrl %>" width="200" class="mb-3"/>
<% } %>

<input type="file" name="image" class="form-control mb-3">

<button class="btn btn-warning">Update</button>
<a href="trip_table.jsp" class="btn btn-secondary">Back</a>

</form>

</div>

</div>

</body>
</html>