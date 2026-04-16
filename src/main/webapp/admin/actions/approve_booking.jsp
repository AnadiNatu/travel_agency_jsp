<%@include file="/auth.jsp" %>
<%@include file="../admin_service.jsp" %>

<%
int id = Integer.parseInt(request.getParameter("id"));

updateBookingStatus(id , "CONFIRMED");
%>