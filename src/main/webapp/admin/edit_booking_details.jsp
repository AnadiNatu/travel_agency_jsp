<%@ include file="../auth.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    request.setCharacterEncoding("UTF-8");

    int id = Integer.parseInt(request.getParameter("id"));
    String tourTitle = "", country = "", city = "", zip = "", status = "", travelDate = "";

    // Load trip
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/jakarta_tutorial","root",""
        );

        PreparedStatement ps = con.prepareStatement(
            "SELECT tour_title, country, city, zip_code, status, travel_date " +
            "FROM trips WHERE id=?"
        );
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            tourTitle  = rs.getString("tour_title");
            country    = rs.getString("country");
            city       = rs.getString("city");
            zip        = rs.getString("zip_code");
            status     = rs.getString("status");
            travelDate = rs.getString("travel_date"); // already yyyy-MM-dd
        }

        rs.close();
        ps.close();
        con.close();

    } catch(Exception e) {
        out.print("<div class='text-danger'>Error loading booking: "+e.getMessage()+"</div>");
    }

    // Handle POST
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/jakarta_tutorial","root",""
            );

            PreparedStatement ps = con.prepareStatement(
                "UPDATE trips SET tour_title=?, country=?, city=?, zip_code=?, travel_date=?, status=? WHERE id=?"
            );
            ps.setString(1, request.getParameter("tour_title"));
            ps.setString(2, request.getParameter("country"));
            ps.setString(3, request.getParameter("city"));
            ps.setString(4, request.getParameter("zip_code"));
            ps.setString(5, request.getParameter("travel_date"));
            ps.setString(6, request.getParameter("status"));
            ps.setInt(7, id);

            ps.executeUpdate();
            ps.close();
            con.close();

            response.sendRedirect("trip_table.jsp?msg=updated");
            return;

        } catch(Exception ex) {
            out.print("<div class='text-danger'>Error updating booking: "+ex.getMessage()+"</div>");
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Trip Booking | Admin</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
</head>

<body class="bg-light">

<%@ include file="admin_navbar.jsp" %>

<div class="admin-content">
    <div class="container-fluid">
        <h3 class="text-warning fw-bold mb-3">
            <i class="bi bi-map"></i> Edit Trip Booking
        </h3>

        <div class="card shadow-sm">
            <div class="card-body">

                <form method="post">
                    <input type="hidden" name="id" value="<%= id %>"/>

                    <div class="mb-3">
                        <label class="form-label">Tour Title</label>
                        <input type="text" class="form-control" name="tour_title"
                               value="<%= tourTitle %>" required>
                    </div>

                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <label class="form-label">Country</label>
                            <input type="text" class="form-control" name="country"
                                   value="<%= country %>">
                        </div>

                        <div class="col-md-4 mb-3">
                            <label class="form-label">City</label>
                            <input type="text" class="form-control" name="city"
                                   value="<%= city %>">
                        </div>

                        <div class="col-md-4 mb-3">
                            <label class="form-label">Zip Code</label>
                            <input type="text" class="form-control" name="zip_code"
                                   value="<%= zip %>">
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Travel Date</label>
                        <input type="date" class="form-control" name="travel_date"
                               value="<%= travelDate %>">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Status</label>
                        <select class="form-select" name="status">
                            <option value="PENDING"   <%= "PENDING".equalsIgnoreCase(status)   ? "selected" : "" %>>PENDING</option>
                            <option value="CONFIRMED" <%= "CONFIRMED".equalsIgnoreCase(status) ? "selected" : "" %>>CONFIRMED</option>
                            <option value="CANCELLED" <%= "CANCELLED".equalsIgnoreCase(status) ? "selected" : "" %>>CANCELLED</option>
                        </select>
                    </div>

                    <button class="btn btn-warning">
                        <i class="bi bi-save"></i> Save Changes
                    </button>
                    <a href="trip_table.jsp" class="btn btn-secondary ms-2">Back</a>

                </form>

            </div>
        </div>
    </div>
</div>

</body>
</html>
