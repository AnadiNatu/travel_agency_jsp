<%@ include file="../../config/email_config.jsp" %>
<%
  request.setCharacterEncoding("UTF-8");
  String name    = request.getParameter("name");
  String email   = request.getParameter("email");
  String type    = request.getParameter("type");
  String message = request.getParameter("message");
  String adminEmail = "blackplaindot@gmail.com";
  try {
    String subject = type + " Received from ExploreEase";
    String fullMessage = "User Name: " + name + "\nUser Email: " + email + "\n\nType: " + type + "\n\nMessage:\n" + message;
    sendEmail(adminEmail, subject, fullMessage);
    sendEmail(email, "We received your " + type, "Hi " + name + ",\n\nWe received your " + type + ". We'll respond soon.\n\n- ExploreEase");
    response.sendRedirect(request.getContextPath() + "/user/views/contact.jsp?msg=sent");
  } catch (Exception e) {
    out.print("Error: " + e.getMessage());
  }
%>