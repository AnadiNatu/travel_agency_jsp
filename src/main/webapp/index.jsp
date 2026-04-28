<%
String context = request.getContextPath();

String user = (String) session.getAttribute("authUser");
String role = (String) session.getAttribute("role");

if (user != null) {

    if ("Admin".equalsIgnoreCase(role)) {
        response.sendRedirect(context + "/admin/views/admin_dashboard.jsp");
    } else {
        response.sendRedirect(context + "/user/views/user_dashboard.jsp");
    }

} else {
    response.sendRedirect("home.jsp");
}
%>