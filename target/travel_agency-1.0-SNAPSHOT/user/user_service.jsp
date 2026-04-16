<%@page import="java.sql.*" %>
<%@include file="../util/db.jsp" %>

<%!
    public ResultSet getUserDetails(int userId) throws Exception {
Connection con = getConnection();
PreparedStatement ps = con.prepareStatement(
"SELECT name, email, username, phone_number, dob, age FROM users WHERE id=?"
);

ps.setInt(1 , userId);
return ps.executeQuery();
}


public ResultSet getUserBookings(int userId) throws Exception{
Connection con = getConnection();
PreparedStatement ps = con.prepareStatement(
"SELECT * FROM trips WHERE user_id=? ORDER BY id DESC"
);

ps.setInt(1, userId);
return ps.executeQuery();
}

public boolean createBooking(int userId , String tourTitle , String country , String city , String zip , String travelDate) throws Exception {
Connection con = getConnection();

PreparedStatement ps = con.prepareStatement("INSERT INTO trips (user_id , tour_title , country , city , zip_code , travel_date , status)" + "VALUES (?,?,?,?,?,?,'PENDING')");

       ps.setInt(1, userId);
        ps.setString(2, tourTitle);
        ps.setString(3, country);
        ps.setString(4, city);
        ps.setString(5, zip);
        ps.setString(6, travelDate);

        int rows = ps.executeUpdate();
ps.close();
con.close();
return rows>0;
}


%>