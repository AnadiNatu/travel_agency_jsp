<%@ include file="../../auth.jsp" %>
<%@ include file="../admin_service.jsp" %>
<%@ page import="java.io.*, java.util.*, org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*, org.apache.commons.fileupload.servlet.*" %>

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
    for (FileItem item : items) {
      if (item.isFormField()) {
        switch (item.getFieldName()) {
          case "tour_title":   title   = item.getString(); break;
          case "country":      country = item.getString(); break;
          case "city":         city    = item.getString(); break;
          case "travel_date":  date    = item.getString(); break;
        }
      }
    }
    
    // For now, save without image (image upload requires Cloudinary setup)
    String imageUrl = "https://images.unsplash.com/photo-1488646953014-85cb44e25828?w=600";
    createTrip(adminId, title, country, city, date, imageUrl);
    response.sendRedirect(request.getContextPath() + "/admin/views/trip_table.jsp?msg=created");
  } catch (Exception e) {
    out.print("<div class='ee-alert ee-alert--danger'>Error: " + e.getMessage() + "</div>");
  }
%>