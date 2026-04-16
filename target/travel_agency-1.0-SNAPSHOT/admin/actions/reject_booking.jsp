<%@ include file="/auth.jsp" %>
<%@ include file="../admin_service.jsp" %>

<%
int id = Integer.parseInt(request.getParameter("id"));

updateBookingStatus(id, "CANCELLED");

response.sendRedirect("trip_table.jsp");
%>
