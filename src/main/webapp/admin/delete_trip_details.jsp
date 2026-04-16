<%@ include file="../auth.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/jakarta_tutorial", "root", ""
        );

        PreparedStatement ps = con.prepareStatement(
            "DELETE FROM trips WHERE id=?"
        );
        ps.setInt(1, id);
        ps.executeUpdate();

        ps.close();
        con.close();

        response.sendRedirect("trip_table.jsp?msg=deleted");
        return;

    } catch(Exception e) {
        out.print("<div class='text-danger'>Error deleting booking: " + e.getMessage() + "</div>");
    }
%>
