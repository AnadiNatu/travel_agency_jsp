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

// Update user profile
public boolean updateUserProfile(int id , String name , String email , String phone) throws Exception{
Connection con = getConnection();

PreparedStatement ps = con.prepareStatement(
"UPDATE users SET name=? , email=? , phone_number=? WHERE id=?"
);

ps.setString(1 , name);
ps.setString(2 , email);
ps.setString(3 , phone);
ps.setInt(4, id);

int rows = ps.executeUpdate();

ps.close();
con.close();

return rows> 0;
}

public boolean updateProfilePhoto(int id , String imageUrl) throws Exception{
Connection con = getConnection();

PreparedStatement ps = con.prepareStatement(
"UPDATE users SET profile_photo=? WHERE id=?"
);

ps.setString(1, imageUrl);
ps.setInt(2, id);

int rows = ps.executeUpdate();

ps.close();
con.close();

return rows>0;
}

// Delete profile photo
public boolean deleteProfilePhoto(int id)throws Exception{
Connection con = getConnection();

PreparedStatement ps = con.prepareStatement(
"UPDATE users SET profile_photo=NULL WHERE id=?"
);

ps.setInt(1 , id);
int rows = ps.executeUpdate();

ps.close();
con.close();

return rows>0;
}

// Get all destination
public ResultSet getAllDestination() throws Exception{
Connection con = getConnection();

PreparedStatement ps = con.prepareStatement(
"SELECT DISTINCT tour_title ,country , city , destination_image , FROM trips WHERE destination_image IS NOT NULL"
);

return ps.executeQuery();
}

// Search + Filter destinaton
public ResultSet searchDestination(String keyword , String country) throws Exception{

Connection con = getConnection();
String sql = "SELECT DISTINCT tour_title , country , city , destination_image FROM trips WHERE 1=1";

if(keyword != null && !keyword.isEmpty()){
sql += "AND (tour_title LIKE ? OR city LIKE ?)";
}

if(country != null && !country.isEmpty()){
sql += "AND country =?";
}

PreparedStatement ps = con.prepareStatement(sql);

int index = 1;

if(keyword != null && !keyword.isEmpty()){
ps.setString(index++ , "%" +keyword+ "%");
ps.setString(index++ , "%"+keyword+"%");
}

if(country != null && !country.isEmpty()){
ps.setString(index++ , country);
}

return ps.executeQuery();
}

%>