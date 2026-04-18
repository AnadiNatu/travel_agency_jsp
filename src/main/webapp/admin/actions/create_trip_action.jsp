<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ include file="//auth.jsp" %>
<%@ include file="../admin_service.jsp" %>
<%@ include file="/config/cloudinary_config.jsp" %>

<%@ page import="java.io.*, java.util.*,
org.apache.commons.fileupload.*,
org.apache.commons.fileupload.disk.*,
org.apache.commons.fileupload.servlet.*,
com.cloudinary.*, com.cloudinary.utils.ObjectUtils" %>

<%
Integer adminId = (Integer) session.getAttribute("id");
String adminName = (String) session.getAttribute("authUser");

boolean isMultipart = ServletFileUpload.isMultipartContent(request);

if (!isMultipart) {
    out.print("Invalid request");
    return;
}

try {

DiskFileItemFactory factory = new DiskFileItemFactory();
ServletFileUpload upload = new ServletFileUpload(factory);

List<FileItem> items = upload.parseRequest(request);

String title="", country="", city="", date="";
File uploadedFile = null;

for (FileItem item : items) {

    if (item.isFormField()) {
        switch(item.getFieldName()){
            case "tour_title": title = item.getString(); break;
            case "country": country = item.getString(); break;
            case "city": city = item.getString(); break;
            case "travel_date": date = item.getString(); break;
        }
    } else {
        if(item.getSize() > 0){
            File temp = File.createTempFile("upload_", ".jpg");
            item.write(temp);
            uploadedFile = temp;
        }
    }
}

String imageUrl = "";
if(uploadedFile != null){

Cloudinary cloudinary = getCloudinary();

Map uploadResult = cloudinary.uploader().upload(uploadedFile, ObjectUtils.asMap(
    "folder", "travel_agency/destination/" + adminName + "/" + city,
    "public_id", "destination_image",
    "overwrite", true
));

imageUrl = (String) uploadResult.get("secure_url");

uploadedFile.delete();
}


createTrip(adminId, title, country, city, date, imageUrl);

response.sendRedirect("../trip_table.jsp?msg=created");

} catch(Exception e){
    out.print("<div class='text-danger'>Error: "+e.getMessage()+"</div>");
}
%>