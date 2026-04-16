<%@page import="java.sql.*" %>
<%@page import="org.mindrot.jbcrypt.BCrypt" %>

<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String username = request.getParameter("username");
String password = request.getParameter("password");
String age = request.getParameter("age");
String dob = request.getParameter("dob");
String role = request.getParameter("role");
String phone = request.getParameter("phone_number");

// Secure password hashing
//String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/jakarta_tutorial", "root", ""
    );

    // Check if username or email exists
    PreparedStatement check = con.prepareStatement(
        "SELECT * FROM users WHERE username=? OR email=?"
    );
    check.setString(1, username);
    check.setString(2, email);
    ResultSet rs = check.executeQuery();

    if (rs.next()) {
        response.sendRedirect("register.jsp?error=exists");
    } else {

        PreparedStatement ps = con.prepareStatement(
          "INSERT INTO users(name, email, username, password, age, dob, role, phone_number) " +
          "VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
        );

        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, username);
        ps.setString(4, password);
        ps.setString(5, age);
        ps.setString(6, dob);
        ps.setString(7, role);
        ps.setString(8, phone);

        ps.executeUpdate();
        ps.close();

        response.sendRedirect("login.jsp?success=registered");
    }

    rs.close();
    check.close();
    con.close();

} catch(Exception ex) {
    out.print("<p class='text-danger'>Error: " + ex.getMessage() + "</p>");
}
%>
