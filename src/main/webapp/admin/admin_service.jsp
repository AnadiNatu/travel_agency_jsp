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
%>