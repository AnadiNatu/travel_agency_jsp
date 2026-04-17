<%@ include file="../auth.jsp" %>
<%@ include file="user_service.jsp" %>
<%@ include file="/config/email_config.jsp" %>

<%
    Integer userId = (Integer) session.getAttribute("id");
    Connection con = getConnection();
    if (userId == null) {
        response.sendRedirect("../login.jsp?error=invalid_session");
        return;
    }

    request.setCharacterEncoding("UTF-8");

    String tourTitle = request.getParameter("tourTitle");
    String country = request.getParameter("country");
    String city = request.getParameter("city");
    String zip = request.getParameter("zip_code");
    String travelDate = request.getParameter("travel_date");

    // Validation
    if (tourTitle == null || country == null || city == null || travelDate == null ||
        tourTitle.isEmpty() || country.isEmpty() || city.isEmpty() || travelDate.isEmpty()) {

        response.sendRedirect("booking_trip.jsp?error=missing_fields");
        return;
    }

    try {

        boolean success = createBooking(
            userId,
            tourTitle,
            country,
            city,
            zip,
            travelDate
        );

        if (success) {
            response.sendRedirect("user_dashboard.jsp?booking=success");
        } else {
            response.sendRedirect("booking_trip.jsp?error=failed");
        }
        
//        Get User Email
PreparedStatement userPs = con.prepareStatement("SELECT email FROM users WHERE id=?");
userPs.setInt(1, userId);
ResultSet userRs = userPs.executeQuery();

String userEmail = "";
if(userRs.next()){
userEmail = userRs.getString("email");
}

String emailMessage = "Hello,\n\n" +
"Your trip booking is successful!\n\n" +
"Destination: " + tourTitle + "\n" +
"Location: " + city + ", " + country + "\n" +
"Travel Date: " + travelDate + "\n\n" +
"Thank you for choosing ExploreEase ??";

sendEmail(userEmail , "Booking Confirmation - ExploreEase" , emailMessage);

    } catch (Exception ex) {
        out.print("<p class='text-danger'>Booking failed: " + ex.getMessage() + "</p>");
    }
%>