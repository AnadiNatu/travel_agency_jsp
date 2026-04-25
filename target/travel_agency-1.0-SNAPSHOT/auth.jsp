<%@ include file="./WEB-INF/includes/util/jwt_filter.jsp" %>

<%
String loggedUser = (String) session.getAttribute("authUser");

if (loggedUser == null) {
    response.sendRedirect(request.getContextPath() + "/login.jsp?error=loginrequired");
    return;
}
%>

