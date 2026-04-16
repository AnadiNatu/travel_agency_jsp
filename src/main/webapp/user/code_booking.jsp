<%@ page import="java.sql.*" %>
<%@ include file="../auth.jsp" %>

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

    if (tourTitle == null || country == null || city == null || travelDate == null) {
        response.sendRedirect("booking_trip.jsp?error=missing_fields");
        return;
    }

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/jakarta_tutorial", "root", ""
        );

        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO trips (user_id, tour_title, country, city, zip_code, travel_date, status) " +
            "VALUES (?, ?, ?, ?, ?, ?, 'PENDING')"
        );

        ps.setInt(1, userId);
        ps.setString(2, tourTitle);
        ps.setString(3, country);
        ps.setString(4, city);
        ps.setString(5, zip);
        ps.setString(6, travelDate);

        ps.executeUpdate();
        ps.close();
        con.close();

        response.sendRedirect("user_dashboard.jsp?booking=success");

    } catch (Exception ex) {
        out.print("<p class='text-danger'>Booking failed: " + ex.getMessage() + "</p>");
    }
%>
