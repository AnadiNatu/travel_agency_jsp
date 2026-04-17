<%@ include file="../auth.jsp" %>
<%@ include file="user_service.jsp" %>
<%@ include file="/config/cloudinary_config.jsp" %>

<%@ page import="java.io.*, java.util.*,
                 org.apache.commons.fileupload.*, 
                 org.apache.commons.fileupload.disk.*, 
                 org.apache.commons.fileupload.servlet.*,
                 com.cloudinary.*, com.cloudinary.utils.ObjectUtils" %>

<%
Integer id = (Integer) session.getAttribute("id");

if (id == null) {
    response.sendRedirect("../login.jsp");
    return;
}

if ("delete".equals(request.getParameter("action"))) {
    deleteProfilePhoto(id);
    response.sendRedirect("user_dashboard.jsp?photo=deleted");
    return;
}

if (!"POST".equalsIgnoreCase(request.getMethod())) {
%>

<!DOCTYPE html>
<html>
<head>
<title>Upload Photo</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

<div class="container mt-5">

<h3>Update Profile Photo</h3>

<form method="post" enctype="multipart/form-data">
<input type="file" name="profilePic" class="form-control mb-3" required>
<button class="btn btn-warning">Upload</button>
</form>

<a href="user_profile_photo.jsp?action=delete" 
   class="btn btn-danger mt-3"
   onclick="return confirm('Delete photo?')">
   Delete Photo
</a>

</div>

</body>
</html>

<%
return;
}

boolean isMultipart = ServletFileUpload.isMultipartContent(request);

if (!isMultipart) {
    out.print("Invalid request");
    return;
}

DiskFileItemFactory factory = new DiskFileItemFactory();
ServletFileUpload upload = new ServletFileUpload(factory);

try {
    List<FileItem> items = upload.parseRequest(request);
    File uploadedFile = null;

    for (FileItem item : items) {
        if (!item.isFormField()) {
            String fileName = new File(item.getName()).getName();

            File tempFile = File.createTempFile("upload_", fileName);
            item.write(tempFile);

            uploadedFile = tempFile;
        }
    }

    if (uploadedFile == null) {
        out.print("No file selected");
        return;
    }

    Cloudinary cloudinary = getCloudinary();

    Map uploadResult = cloudinary.uploader().upload(uploadedFile, ObjectUtils.asMap(
        "folder", "travel_agency/profile/user/" + id,
        "public_id", "profile_photo",
        "overwrite", true
    ));

    String imageUrl = (String) uploadResult.get("secure_url");

    updateProfilePhoto(id, imageUrl);

    uploadedFile.delete();

    response.sendRedirect("user_dashboard.jsp?photo=updated");

} catch(Exception e) {
    out.print("Upload failed: " + e.getMessage());
}
%>