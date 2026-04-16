<%@ include file="../auth.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8"%>

<!--<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Trip Management | Admin</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body { background: #f8f9fa; font-family: 'Poppins', sans-serif; }
        .table-container { margin-left: 260px; padding: 20px; }
        .sidebar {
            height: 100vh; width: 260px;
            position: fixed; top: 0; left: 0;
            background: #343a40; padding-top: 20px;
        }
        .sidebar a {
            display: block; padding: 12px 20px;
            color: #ddd; text-decoration: none;
            font-weight: 500;
        }
        .sidebar a:hover, .active { background: #ffc107; color: black !important; }
    </style>
</head>

<body>

<div class="sidebar">
    <a href="admin_dashboard.jsp"><i class="bi bi-speedometer2"></i> Dashboard</a>
    <a href="user_table.jsp"><i class="bi bi-people"></i> User Management</a>
    <a class="active" href="trip_table.jsp"><i class="bi bi-map"></i> Trip Bookings</a>
    <hr class="text-light">
    <a href="../logout.jsp" class="text-danger"><i class="bi bi-power"></i> Logout</a>
</div>

<div class="table-container">
    <h2 class="fw-bold mb-4">Trip Bookings</h2>-->

    <%
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jakarta_tutorial","root","");
//
//            PreparedStatement ps = con.prepareStatement(
//                "SELECT id, user_id, tour_title, country, city, zip_code, travel_date, status, created_at " +
//                "FROM trips ORDER BY id DESC"
//            );
//
//            ResultSet rs = ps.executeQuery();
    %>

<!--    <table class="table table-hover table-bordered bg-white shadow-sm">
        <thead class="table-warning">
            <tr>
                <th>ID</th><th>User ID</th><th>Tour Title</th>
                <th>Country</th><th>City</th><th>Zip</th>
                <th>Travel Date</th><th>Status</th><th>Actions</th>
            </tr>
        </thead>

        <tbody>-->
        <% // while(rs.next()) { %>
            <tr>
                <!--<td><%= // rs.getInt("id") %></td>-->
                <!--<td><%= // rs.getInt("user_id") %></td>-->
                <!--<td><%= // rs.getString("tour_title") %></td>-->
                <!--<td><%= // rs.getString("country") %></td>-->
                <!--<td><%= // rs.getString("city") %></td>-->
                <!--<td><%= // rs.getString("zip_code") %></td>-->
                <!--<td><%= // rs.getString("travel_date") %></td>-->

                <td>
                    <% // String status = rs.getString("status"); %>

                    <% // if(status.equals("PENDING")) { %>
                        <!--<span class="badge bg-secondary">PENDING</span>-->
                    <% // } else if(status.equals("CONFIRMED")) { %>
                        <!--<span class="badge bg-success">CONFIRMED</span>-->
                    <% // } else { %>
                        <!--<span class="badge bg-danger">CANCELLED</span>-->
                    <% // } %>
<!--                </td>

                <td>
                    <a href="edit_booking_details.jsp?id=<%= //rs.getInt("id") %>"
                       class="btn btn-sm btn-primary">
                        <i class="bi bi-pencil"></i> Edit
                    </a>

                    <a onclick="return confirm('Delete this booking?');"
                       href="delete_booking_details.jsp?id=<%=// rs.getInt("id") %>"
                       class="btn btn-sm btn-danger">
                        <i class="bi bi-trash"></i> Delete
                    </a>
                </td>
            </tr>-->
        <% // } %>
<!--        </tbody>
    </table>-->

    <% // } catch(Exception ex) { out.print("<div class='text-danger'>"+ex.getMessage()+"</div>"); } %>

<!--</div>

</body>
</html>-->

<%@ include file="../auth.jsp" %>
<%@ include file="admin_service.jsp" %>
<%@ page contentType="text/html;charset=UTF-8"%>

<%
String role = (String) session.getAttribute("role");

// 🔐 Admin protection
if (!"Admin".equalsIgnoreCase(role)) {
    response.sendRedirect("../login.jsp?error=unauthorized");
    return;
}
%>
<%@ include file="/auth.jsp" %>
<%@ include file="admin_service.jsp" %>
<%@ page contentType="text/html;charset=UTF-8"%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Trip Management | Admin</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body { background: #f8f9fa; font-family: 'Poppins', sans-serif; }

        .table-container { margin-left: 260px; padding: 20px; }

        .sidebar {
            height: 100vh; width: 260px;
            position: fixed; top: 0; left: 0;
            background: #343a40; padding-top: 20px;
        }

        .sidebar a {
            display: block; padding: 12px 20px;
            color: #ddd; text-decoration: none;
            font-weight: 500;
        }

        .sidebar a:hover, .active {
            background: #ffc107; color: black !important;
        }
    </style>
</head>

<body>

<!-- Sidebar -->
<div class="sidebar">
    <a href="admin_dashboard.jsp"><i class="bi bi-speedometer2"></i> Dashboard</a>
    <a href="user_table.jsp"><i class="bi bi-people"></i> Users</a>
    <a class="active" href="trip_table.jsp"><i class="bi bi-map"></i> Trips</a>
    <hr class="text-light">
    <a href="../logout.jsp" class="text-danger"><i class="bi bi-power"></i> Logout</a>
</div>

<!-- Content -->
<div class="table-container">
    <h2 class="fw-bold mb-4">Trip Bookings</h2>

    <%
        try {
            ResultSet rs = getAllBookings();
    %>

    <table class="table table-hover table-bordered bg-white shadow-sm">
        <thead class="table-warning">
            <tr>
                <th>ID</th><th>User</th><th>Tour</th>
                <th>Country</th><th>City</th>
                <th>Date</th><th>Status</th><th>Actions</th>
            </tr>
        </thead>

        <tbody>
        <% while(rs.next()) { %>

        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getInt("user_id") %></td>
            <td><%= rs.getString("tour_title") %></td>
            <td><%= rs.getString("country") %></td>
            <td><%= rs.getString("city") %></td>
            <td><%= rs.getString("travel_date") %></td>

            <td>
                <% String status = rs.getString("status"); %>

                <% if("PENDING".equalsIgnoreCase(status)) { %>
                    <span class="badge bg-secondary">PENDING</span>
                <% } else if("CONFIRMED".equalsIgnoreCase(status)) { %>
                    <span class="badge bg-success">CONFIRMED</span>
                <% } else { %>
                    <span class="badge bg-danger">CANCELLED</span>
                <% } %>
            </td>

            <td>

                <% if("PENDING".equalsIgnoreCase(status)) { %>
                    <a href="approve_booking.jsp?id=<%= rs.getInt("id") %>"
                       class="btn btn-sm btn-success">
                        Approve
                    </a>

                    <a href="reject_booking.jsp?id=<%= rs.getInt("id") %>"
                       class="btn btn-sm btn-warning">
                        Reject
                    </a>
                <% } %>

                <a onclick="return confirm('Delete this booking?');"
                   href="delete_booking.jsp?id=<%= rs.getInt("id") %>"
                   class="btn btn-sm btn-danger">
                    Delete
                </a>

            </td>
        </tr>

        <% } %>
        </tbody>
    </table>

    <% } catch(Exception ex) {
        out.print("<div class='text-danger'>" + ex.getMessage() + "</div>");
    } %>

</div>

</body>
</html>