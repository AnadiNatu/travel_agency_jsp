<%@page import="java.sql.*"%>
<%@include file="../WEB-INF/includes/db.jsp" %>

<%!
  public int getTotalUsers() throws Exception {
    Connection con = getConnection();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM users");
    int count = 0;
    if (rs.next()) count = rs.getInt(1);
    rs.close(); st.close(); con.close();
    return count;
  }

  public int getTotalTrips() throws Exception {
    Connection con = getConnection();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM trips");
    int count = 0;
    if (rs.next()) count = rs.getInt(1);
    rs.close(); st.close(); con.close();
    return count;
  }

  public int getPendingBookings() throws Exception {
    Connection con = getConnection();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM trips WHERE status='PENDING' AND user_id IS NOT NULL");
    int count = 0;
    if (rs.next()) count = rs.getInt(1);
    rs.close(); st.close(); con.close();
    return count;
  }

  public ResultSet getAllBookings() throws Exception {
    Connection con = getConnection();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM trips WHERE user_id IS NOT NULL ORDER BY id DESC");
    return ps.executeQuery();
  }

  public boolean updateBookingStatus(int bookingId, String status) throws Exception {
    Connection con = getConnection();
    PreparedStatement ps = con.prepareStatement("UPDATE trips SET status=? WHERE id=?");
    ps.setString(1, status);
    ps.setInt(2, bookingId);
    int rows = ps.executeUpdate();
    ps.close(); con.close();
    return rows > 0;
  }

  public boolean deleteBooking(int bookingId) throws Exception {
    Connection con = getConnection();
    PreparedStatement ps = con.prepareStatement("DELETE FROM trips WHERE id=?");
    ps.setInt(1, bookingId);
    int row = ps.executeUpdate();
    ps.close(); con.close();
    return row > 0;
  }

  public ResultSet getAllUsers() throws Exception {
    Connection con = getConnection();
    PreparedStatement ps = con.prepareStatement(
      "SELECT id, name, email, username, phone_number, role, created_at FROM users ORDER BY id DESC"
    );
    return ps.executeQuery();
  }

  public boolean deleteUser(int id) throws Exception {
    Connection con = getConnection();
    PreparedStatement ps = con.prepareStatement("DELETE FROM users WHERE id=?");
    ps.setInt(1, id);
    int rows = ps.executeUpdate();
    ps.close(); con.close();
    return rows > 0;
  }

  public ResultSet getUserById(int id) throws Exception {
    Connection con = getConnection();
    PreparedStatement ps = con.prepareStatement(
      "SELECT name, email, phone_number, role FROM users WHERE id=?"
    );
    ps.setInt(1, id);
    return ps.executeQuery();
  }

  public boolean updateUser(int id, String name, String email, String phone, String role) throws Exception {
    Connection con = getConnection();
    PreparedStatement ps = con.prepareStatement(
      "UPDATE users SET name=?, email=?, phone_number=?, role=? WHERE id=?"
    );
    ps.setString(1, name); ps.setString(2, email);
    ps.setString(3, phone); ps.setString(4, role); ps.setInt(5, id);
    int rows = ps.executeUpdate();
    ps.close(); con.close();
    return rows > 0;
  }

  public ResultSet getBookingById(int id) throws Exception {
    Connection con = getConnection();
    PreparedStatement ps = con.prepareStatement(
      "SELECT tour_title, country, city, zip_code, status, travel_date, destination_image FROM trips WHERE id=?"
    );
    ps.setInt(1, id);
    return ps.executeQuery();
  }

  public boolean updateBookingFull(int id, String tourTitle, String country, String city,
      String zip, String travelDate, String status) throws Exception {
    Connection con = getConnection();
    PreparedStatement ps = con.prepareStatement(
      "UPDATE trips SET tour_title=?, country=?, city=?, zip_code=?, travel_date=?, status=? WHERE id=?"
    );
    ps.setString(1, tourTitle); ps.setString(2, country); ps.setString(3, city);
    ps.setString(4, zip); ps.setString(5, travelDate); ps.setString(6, status); ps.setInt(7, id);
    int rows = ps.executeUpdate();
    ps.close(); con.close();
    return rows > 0;
  }

  public boolean updateTripImage(int id, String imageUrl) throws Exception {
    Connection con = getConnection();
    PreparedStatement ps = con.prepareStatement("UPDATE trips SET destination_image=? WHERE id=?");
    ps.setString(1, imageUrl); ps.setInt(2, id);
    int rows = ps.executeUpdate();
    ps.close(); con.close();
    return rows > 0;
  }

  public boolean createTrip(int userId, String title, String country, String city,
      String date, String imageUrl) throws Exception {
    Connection con = getConnection();
    PreparedStatement ps = con.prepareStatement(
      "INSERT INTO trips (user_id, tour_title, country, city, travel_date, destination_image, status) VALUES (?, ?, ?, ?, ?, ?, 'PENDING')"
    );
    ps.setNull(1, java.sql.Types.INTEGER);
    ps.setString(2, title); ps.setString(3, country); ps.setString(4, city);
    ps.setString(5, date); ps.setString(6, imageUrl);
    int rows = ps.executeUpdate();
    ps.close(); con.close();
    return rows > 0;
  }

  public ResultSet getAllTrips() throws Exception {
    Connection con = getConnection();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM trips WHERE user_id IS NULL ORDER BY id DESC");
    return ps.executeQuery();
  }
%>