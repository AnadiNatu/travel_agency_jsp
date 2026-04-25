<%@ include file="../../auth.jsp" %>
<%@ include file="../user_service.jsp" %>
<%@ include file="../../config/cloudinary_config.jsp" %>
<%@ page import="java.io.*, java.util.*, org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*, org.apache.commons.fileupload.servlet.*, com.cloudinary.*, com.cloudinary.utils.ObjectUtils" %>
<%
  Integer id = (Integer) session.getAttribute("id");
  if (id == null) { response.sendRedirect(request.getContextPath() + "/login.jsp"); return; }

  if ("delete".equals(request.getParameter("action"))) {
    deleteProfilePhoto(id);
    response.sendRedirect(request.getContextPath() + "/user/views/user_dashboard.jsp?photo=deleted");
    return;
  }

  if (!"POST".equalsIgnoreCase(request.getMethod())) {
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"><title>Profile Photo | ExploreEase</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/global.css">
  <style>body{background:linear-gradient(rgba(10,35,66,0.85),rgba(10,35,66,0.75)),url('https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=1600')center/cover fixed;min-height:100vh;}</style>
</head>
<body>
<%@ include file="../user_navbar.jsp" %>
<div class="container py-5" style="max-width:480px;">
  <div class="glass-card">
    <span class="ee-section__label">Appearance</span>
    <h3 style="color:white;font-family:'Cormorant Garamond',serif;margin-bottom:1.5rem;">Update Photo</h3>
    <form method="post" enctype="multipart/form-data">
      <div class="ee-form-group"><label style="color:rgba(255,255,255,0.6);">Choose Photo</label><input type="file" name="profilePic" class="ee-input ee-input--glass" required></div>
      <button type="submit" class="btn-ee btn-ee--primary" style="width:100%;justify-content:center;"><i class="bi bi-upload"></i> Upload</button>
    </form>
    <a href="<%=request.getContextPath()%>/user/views/user_profile_photo.jsp?action=delete" class="btn-ee btn-ee--danger" style="width:100%;justify-content:center;margin-top:0.8rem;" onclick="return confirm('Delete your profile photo?')">
      <i class="bi bi-trash"></i> Delete Photo
    </a>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<%
    return;
  }

  boolean isMultipart = ServletFileUpload.isMultipartContent(request);
  if (!isMultipart) { out.print("Invalid request"); return; }
  DiskFileItemFactory factory = new DiskFileItemFactory();
  ServletFileUpload upload = new ServletFileUpload(factory);
  try {
    List<FileItem> items = upload.parseRequest(request);
    File uploadedFile = null;
    for (FileItem item : items) {
      if (!item.isFormField()) {
        File tempFile = File.createTempFile("upload_", new File(item.getName()).getName());
        item.write(tempFile);
        uploadedFile = tempFile;
      }
    }
    if (uploadedFile == null) { out.print("No file selected"); return; }
    Cloudinary cloudinary = getCloudinary();
    Map uploadResult = cloudinary.uploader().upload(uploadedFile, ObjectUtils.asMap(
      "folder", "travel_agency/profile/user/" + id,
      "public_id", "profile_photo", "overwrite", true
    ));
    updateProfilePhoto(id, (String) uploadResult.get("secure_url"));
    uploadedFile.delete();
    response.sendRedirect(request.getContextPath() + "/user/views/user_dashboard.jsp?photo=updated");
  } catch (Exception e) {
    out.print("Upload failed: " + e.getMessage());
  }
%>