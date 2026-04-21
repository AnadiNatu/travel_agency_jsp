<%@ include file="/config/email_config.jsp" %>

<%
request.setCharacterEncoding("UTF-8");

String name = request.getParameter("name");
String email = request.getParameter("email");
String type = request.getParameter("type");
String message = request.getParameter("message");

String adminEmail = "blackplaindot@gmail.com";

try {

    String subject = type + " Received from ExploreEase";

    String fullMessage =
        "User Name: " + name + "\n" +
        "User Email: " + email + "\n\n" +
        "Type: " + type + "\n\n" +
        "Message:\n" + message;

    // Send email to admin
    sendEmail(adminEmail, subject, fullMessage);

    // OPTIONAL: confirmation to user
    sendEmail(email, "We received your " + type,
        "Hi " + name + ",\n\nWe have received your " + type + ". Our team will respond soon.\n\n- ExploreEase");

    response.sendRedirect("contact.jsp?msg=sent");

} catch(Exception e){
    out.print("Error: " + e.getMessage());
}
%>