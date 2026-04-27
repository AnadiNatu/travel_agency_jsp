<%
String user = (String) session.getAttribute("authUser");
String role = (String) session.getAttribute("role");

if (user != null) {

    if ("Admin".equalsIgnoreCase(role)) {
        response.sendRedirect(request.getContextPath() + "/admin/views/admin_dashboard.jsp");
    } else {
        response.sendRedirect(request.getContextPath() + "/user/views/user_dashboard.jsp");
    }

} else {
    response.sendRedirect(request.getContextPath() + "/home.jsp");
}
%>