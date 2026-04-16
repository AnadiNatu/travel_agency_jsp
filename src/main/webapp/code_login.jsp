<%--<%@page import="java.sql.Connection"%>--%>
<%@page import="org.mindrot.jbcrypt.BCrypt"%>
<%@include file="util/db.jsp" %>
<%@ include file="jwt_util.jsp" %>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    if (username == null || password == null) {
        response.sendRedirect("login.jsp?error=missing");
        return;
    }

    try(Connection con = getConnection()) {
    PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE username=?");
    ps.setString(1 , username);
    
    ResultSet rs = ps.executeQuery();
    
    if(rs.next()){
    String dbPassword = rs.getString("password");
    
//    Needs to be updated
    if(!BCrypt.checkpw(password, dbPassword)){
    response.sendRedirect("login.jsp?error=invalid");
    return;
    }
    
    int id = rs.getInt("id");
    String role = rs.getString("role");
    String token = generateToken(username , role , id);
    
    session.setAttribute("authToken", token);
    
    if("Admin".equalsIgnoreCase(role)){
    response.sendRedirect("admin/admin_dashboard.jsp");
    }else{
    response.sendRedirect("user/user_dashboard.jsp");
    }
    }else{
    response.sendRedirect("login.jsp?error=invalid");
    }
    }catch(Exception ex){
    out.println("<p> Error :" +ex.getMessage()+ "</p>");
    }
//    Connection con = null;
//    PreparedStatement ps = null;
//    ResultSet rs = null;
//
//    try {
//        Class.forName("com.mysql.cj.jdbc.Driver");
//        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jakarta_tutorial", "root", "");
//
//        ps = con.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
//        ps.setString(1, username);
//        ps.setString(2, password);
//
//        rs = ps.executeQuery();
//
//        if (rs.next()) {
//            int id = rs.getInt("id");
//            String role = rs.getString("role");
//
//            // Generate token
//            String token = generateToken(username, role, id);
//
//            // Store in session
//            session.setAttribute("authToken", token);
//
//            // Redirect by role
//            String ctx = request.getContextPath();
//            if ("Admin".equalsIgnoreCase(role)) {
//                response.sendRedirect(ctx + "/admin/admin_dashboard.jsp");
//            } else {
//                response.sendRedirect(ctx + "/user/user_dashboard.jsp");
//            }
//
//        } else {
//            response.sendRedirect("login.jsp?error=invalid");
//        }
//
//    } catch (Exception ex) {
//        out.print("<p>Error: " + ex.getMessage() + "</p>");
//
//    } finally {
//        try { if (rs != null) rs.close(); } catch (Exception e) {}
//        try { if (ps != null) ps.close(); } catch (Exception e) {}
//        try { if (con != null) con.close(); } catch (Exception e) {}
//    }
%>
