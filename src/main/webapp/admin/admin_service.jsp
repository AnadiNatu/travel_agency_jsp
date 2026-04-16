<%@page import="java.sql.*"%>
<%@ include file="../util/db.jsp" %>

<%!
    public int getTotalUsers() throws Exception {
        Connection con = getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM users");

        int count = 0;
        if (rs.next()) count = rs.getInt(1);

        rs.close();
        st.close();
        con.close();

        return count;
    }

    public int getTotalTrips() throws Exception {
        Connection con = getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM trips");

        int count = 0;
        if (rs.next()) count = rs.getInt(1);

        rs.close();
        st.close();
        con.close();

        return count;
    }

    public int getPendingBookings() throws Exception {
        Connection con = getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(
            "SELECT COUNT(*) FROM trips WHERE status='PENDING'"
        );

        int count = 0;
        if (rs.next()) count = rs.getInt(1);

        rs.close();
        st.close();
        con.close();

        return count;
    }

// Get All Booking
public ResultSet getAllBookings() throws Exception{
Connection con = getConnection();
PreparedStatement ps = con.prepareStatement(
 "SELECT id, user_id, tour_title, country, city, zip_code, travel_date, status " +
        "FROM trips ORDER BY id DESC"
);

return ps.executeQuery();
}

// Update Booking Status
public boolean updateBookingStatus(int bookingId , String status) throws Exception{
Connection con = getConnection();
PreparedStatement ps = con.prepareStatement(
"UPDATE trips SET status=? WHERE id=?"
);

ps.setString(1, status);
ps.setInt(2, bookingId);

int rows = ps.executeUpdate();

ps.close();
con.close();

return rows>0;
}

// Delete Booking
public boolean deleteBooking(int bookingId)throws Exception{
Connection con = getConnection();
PreparedStatement ps = con.prepareStatement("DELETE FROM trips WHERE id=?");

ps.setInt(1, bookingId);
int row = ps.executeUpdate();
ps.close();
con.close();

return row>0;
}

%>