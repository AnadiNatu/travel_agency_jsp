<%@ include file="../auth.jsp" %>
<%@ include file="user_service.jsp" %>
<%@ include file="/config/email_config.jsp" %>

<%
Integer userId = (Integer) session.getAttribute("id");

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

if (tourTitle == null || tourTitle.isEmpty()) {
    response.sendRedirect("booking_trip.jsp?error=missing");
    return;
}

try {

    boolean success = createBooking(userId, tourTitle, country, city, zip, travelDate);

    if (success) {

        Connection con = getConnection();

        PreparedStatement ps = con.prepareStatement(
            "SELECT name, email FROM users WHERE id=?"
        );

        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();

        String userEmail = "";
        String userName = "";

        if(rs.next()){
            userEmail = rs.getString("email");
            userName = rs.getString("name");
        }

        String message =
            "Hi " + userName + ",\n\n" +
            "Your booking is CONFIRMED!\n\n" +
            "Trip: " + tourTitle + "\n" +
            "Location: " + city + ", " + country + "\n" +
            "Date: " + travelDate + "\n\n" +
            "Thank you for choosing ExploreEase ??";

        sendEmail(userEmail, "Booking Confirmed - ExploreEase", message);

        rs.close();
        ps.close();
        con.close();

        response.sendRedirect("user_dashboard.jsp?booking=success");

    } else {
        response.sendRedirect("booking_trip.jsp?error=failed");
    }

} catch(Exception e){
    out.print("<div class='text-danger'>Error: " + e.getMessage() + "</div>");
}
%>