<%@ page import="java.io.*, java.util.*, com.cloudinary.Cloudinary, com.cloudinary.utils.ObjectUtils,
                 org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*, 
                 org.apache.commons.fileupload.servlet.*" %>
<%--<%@ page contentType="text/html;charset=UTF-8" %>--%>

<%
    // --- AUTH CHECK ---
    Integer id = (Integer) session.getAttribute("id");
    if (id == null) {
        response.sendRedirect("../login.jsp?error=loginrequired");
        return;
    }

    // If GET ? show upload UI
    if (!"POST".equalsIgnoreCase(request.getMethod())) {
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Update Profile Photo | Explore Ease</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: url('../images/bg.jpg') center/cover fixed no-repeat;
            font-family: 'Poppins', sans-serif;
        }
        .glass-card {
            background: rgba(255,255,255,0.20);
            padding: 35px;
            border-radius: 18px;
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255,255,255,0.25);
            box-shadow: 0 10px 30px rgba(0,0,0,0.12);
            max-width: 450px;
            margin: auto;
            margin-top: 60px;
        }
        .btn-warning {
            background: #e1a400;
            border: none;
        }
        .btn-warning:hover {
            background: #c58f00;
        }
    </style>
</head>

<body>

<%@ include file="user_navbar.jsp" %>

<div class="glass-card">

    <h3 class="fw-bold mb-4 text-dark text-center">Upload Profile Photo</h3>

    <form action="user_profile_photo.jsp" method="post" enctype="multipart/form-data">

        <input type="file"
               name="profilePic"
               class="form-control mb-3"
               accept="image/*"
               required>

        <button class="btn btn-warning w-100 py-2">Upload Photo</button>

    </form>

</div>

<%--<%@ include file="user_footer.jsp" %>--%>

</body>
</html>

<%
        return; // Stop execution here for GET request
    }

    // ----------------------------------------------------------------------------------
    // --- POST REQUEST ? HANDLE FILE UPLOAD + CLOUDINARY UPLOAD ---
    // ----------------------------------------------------------------------------------

    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    if (!isMultipart) {
        out.println("<p class='alert alert-danger'>Invalid form submission.</p>");
        return;
    }

    // Step 1: File Upload Preparation
    DiskFileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);

    try {
        List<FileItem> items = upload.parseRequest(request);
        File uploadedFile = null;

        for (FileItem item : items) {
            if (!item.isFormField()) {

                String fileName = new File(item.getName()).getName();
                String uploadPath = application.getRealPath("") + File.separator + "uploads";

                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdir();

                uploadedFile = new File(uploadPath + File.separator + fileName);
                item.write(uploadedFile);
            }
        }

        if (uploadedFile == null) {
            out.println("<p class='alert alert-warning'>No file selected.</p>");
            return;
        }

        // Step 2: Upload to Cloudinary (? USE THE SAME CREDENTIALS AS YOUR SAMPLE)
        Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
            "cloud_name", "dftemthfs",
            "api_key", "225645813854764",
            "api_secret", "kP_FPOscQ8PAolz2rNLsQAPkfL0",
            "secure", true
        ));

        Map uploadResult = cloudinary.uploader().upload(uploadedFile, ObjectUtils.emptyMap());
        String imageUrl = (String) uploadResult.get("secure_url");

        // Step 3: Save in session (NO DATABASE SAVE)
        session.setAttribute("profileImageUrl", imageUrl);

        // Remove temporary file
        uploadedFile.delete();

        // Redirect back
        response.sendRedirect("user_dashboard.jsp?upload=success");

    } catch (Exception e) {
        out.println("<p class='alert alert-danger'>Upload failed: " + e.getMessage() + "</p>");
    }
%>
