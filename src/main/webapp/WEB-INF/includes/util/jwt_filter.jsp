<%@ include file="jwt_util.jsp" %>

<%
String AUTHtoken = (String) session.getAttribute("authToken");

if (AUTHtoken == null || !validateToken(AUTHtoken)) {
    response.sendRedirect(request.getContextPath() + "/login.jsp?error=invalid_session");
    return;
}

// Extract from JWT
String jwtUser = getUsernameFromToken(AUTHtoken);
String jwtRole = getRoleFromToken(AUTHtoken);
Integer jwtId = getIdFromToken(AUTHtoken);

// Store in session (GLOBAL values)
session.setAttribute("authUser", jwtUser);
session.setAttribute("role", jwtRole);
session.setAttribute("id", jwtId);
%>
