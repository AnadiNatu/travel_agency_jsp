<%@ include file="../auth.jsp" %>
<%@ include file="user_service.jsp" %>

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

    } catch (Exception ex) {
        out.print("<p class='text-danger'>Booking failed: " + ex.getMessage() + "</p>");
    }
%>