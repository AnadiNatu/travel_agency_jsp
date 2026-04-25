<%@ include file="/auth.jsp" %>
<%@ include file="../admin_service.jsp" %>

<%
int id = Integer.parseInt(request.getParameter("id"));

updateBookingStatus(id, "CANCELLED");

  response.sendRedirect(request.getContextPath() + "/admin/views/trip_table.jsp?msg=updated");
%>
