<%@ include file="../../auth.jsp" %>
<%@ include file="../admin_service.jsp" %>
<%@ include file="../../config/cloudinary_config.jsp" %>
<%@ page import="java.io.*, java.util.*, org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*, org.apache.commons.fileupload.servlet.*, com.cloudinary.*, com.cloudinary.utils.ObjectUtils" %>
<%
  request.setCharacterEncoding("UTF-8");
  String role = (String) session.getAttribute("role");
  String adminName = (String) session.getAttribute("authUser");
  if (!"Admin".equalsIgnoreCase(role)) {
    response.sendRedirect(request.getContextPath() + "/login.jsp?error=unauthorized");
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
      zip        = rs.getString("zip_code") != null ? rs.getString("zip_code") : "";
      status     = rs.getString("status");
      travelDate = rs.getString("travel_date");
      imageUrl   = rs.getString("destination_image") != null ? rs.getString("destination_image") : "";
    }
  } catch (Exception e) {
    out.print("<div class='ee-alert ee-alert--danger'>Error loading booking</div>");
  }

  boolean isMultipart = ServletFileUpload.isMultipartContent(request);
  if ("POST".equalsIgnoreCase(request.getMethod()) && isMultipart) {
    try {
      DiskFileItemFactory factory = new DiskFileItemFactory();
      ServletFileUpload upload = new ServletFileUpload(factory);
      List<FileItem> items = upload.parseRequest(request);
      File uploadedFile = null;
      String newTourTitle="", newCountry="", newCity="", newZip="", newStatus="", newDate="";
      for (FileItem item : items) {
        if (item.isFormField()) {
          switch (item.getFieldName()) {
            case "tour_title": newTourTitle = item.getString(); break;
            case "country":    newCountry   = item.getString(); break;
            case "city":       newCity      = item.getString(); break;
            case "zip_code":   newZip       = item.getString(); break;
            case "status":     newStatus    = item.getString(); break;
            case "travel_date":newDate      = item.getString(); break;
          }
        } else if (item.getSize() > 0) {
          File tempFile = File.createTempFile("upload_", ".jpg");
          item.write(tempFile);
          uploadedFile = tempFile;
        }
      }
      updateBookingFull(id, newTourTitle, newCountry, newCity, newZip, newDate, newStatus);
      if (uploadedFile != null) {
        Cloudinary cloudinary = getCloudinary();
        Map uploadResult = cloudinary.uploader().upload(uploadedFile, ObjectUtils.asMap(
          "folder", "travel_agency/destination/" + adminName + "/" + newCity,
          "public_id", "destination_image", "overwrite", true
        ));
        updateTripImage(id, (String) uploadResult.get("secure_url"));
        uploadedFile.delete();
      }
      response.sendRedirect(request.getContextPath() + "/admin/views/trip_table.jsp?msg=updated");
      return;
    } catch (Exception ex) {
      out.print("<div class='ee-alert ee-alert--danger'>Update failed: " + ex.getMessage() + "</div>");
    }
  }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Edit Trip | Admin</title>
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
    <h2 style="color:var(--ocean);margin:0;">Edit Trip Booking</h2>
  </div>

  <div style="max-width:680px;background:var(--white);border-radius:var(--radius-md);padding:2.5rem;box-shadow:var(--shadow-md);">
    <form method="post" enctype="multipart/form-data">
      <div class="row">
        <div class="col-md-6"><div class="ee-form-group"><label>Tour Title</label><input type="text" name="tour_title" class="ee-input" value="<%= tourTitle %>"></div></div>
        <div class="col-md-6"><div class="ee-form-group"><label>Country</label><input type="text" name="country" class="ee-input" value="<%= country %>"></div></div>
        <div class="col-md-6"><div class="ee-form-group"><label>City</label><input type="text" name="city" class="ee-input" value="<%= city %>"></div></div>
        <div class="col-md-6"><div class="ee-form-group"><label>Zip Code</label><input type="text" name="zip_code" class="ee-input" value="<%= zip %>"></div></div>
        <div class="col-md-6"><div class="ee-form-group"><label>Travel Date</label><input type="date" name="travel_date" class="ee-input" value="<%= travelDate %>"></div></div>
        <div class="col-md-6">
          <div class="ee-form-group">
            <label>Status</label>
            <select name="status" class="ee-input">
              <option value="PENDING"   <%= "PENDING".equals(status)   ? "selected":"" %>>Pending</option>
              <option value="CONFIRMED" <%= "CONFIRMED".equals(status) ? "selected":"" %>>Confirmed</option>
              <option value="CANCELLED" <%= "CANCELLED".equals(status) ? "selected":"" %>>Cancelled</option>
            </select>
          </div>
        </div>
        <div class="col-12">
          <% if (imageUrl != null && !imageUrl.isEmpty()) { %>
            <img src="<%= imageUrl %>" style="width:100%;height:160px;object-fit:cover;border-radius:var(--radius-sm);margin-bottom:1rem;">
          <% } %>
          <div class="ee-form-group"><label>Replace Image</label><input type="file" name="image" class="ee-input"></div>
        </div>
      </div>
      <div style="display:flex;gap:1rem;margin-top:0.5rem;">
        <button type="submit" class="btn-ee btn-ee--primary"><i class="bi bi-save"></i> Update</button>
        <a href="<%=request.getContextPath()%>/admin/views/trip_table.jsp" class="btn-ee btn-ee--ocean"><i class="bi bi-arrow-left"></i> Back</a>
      </div>
    </form>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>