<%@ include file="../../auth.jsp" %>
<%@ include file="../user_service.jsp" %>
<%@ include file="../../config/email_config.jsp" %>
<%
  Integer userId = (Integer) session.getAttribute("id");
  if (userId == null) { response.sendRedirect(request.getContextPath() + "/login.jsp?error=invalid_session"); return; }
  request.setCharacterEncoding("UTF-8");
  String tourTitle  = request.getParameter("tourTitle");
  String country    = request.getParameter("country");
  String city       = request.getParameter("city");
  String zip        = request.getParameter("zip_code");
  String travelDate = request.getParameter("travel_date");
  if (tourTitle == null || tourTitle.isEmpty()) {
    response.sendRedirect(request.getContextPath() + "/user/views/booking_trip.jsp?error=missing");
    return;
  }
  try {
    boolean success = createBooking(userId, tourTitle, country, city, zip, travelDate);
    if (success) {
      Connection con = getConnection();
      PreparedStatement ps = con.prepareStatement("SELECT name, email FROM users WHERE id=?");
      ps.setInt(1, userId);
      ResultSet rs = ps.executeQuery();
      String userEmail = "", userName = "";
      if (rs.next()) { userEmail = rs.getString("email"); userName = rs.getString("name"); }
      String message = "Hi " + userName + ",\n\nYour booking is CONFIRMED!\n\nTrip: " + tourTitle + "\nLocation: " + city + ", " + country + "\nDate: " + travelDate + "\n\nThank you for choosing ExploreEase!";
      sendEmail(userEmail, "Booking Confirmed - ExploreEase", message);
      rs.close(); ps.close(); con.close();
      response.sendRedirect(request.getContextPath() + "/user/views/user_dashboard.jsp?booking=success");
    } else {
      response.sendRedirect(request.getContextPath() + "/user/views/booking_trip.jsp?error=failed");
    }
  } catch (Exception e) {
    out.print("<div class='ee-alert ee-alert--danger'>Error: " + e.getMessage() + "</div>");
  }
%>