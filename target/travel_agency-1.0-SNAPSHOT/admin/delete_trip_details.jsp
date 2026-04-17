<%@ include file="/auth.jsp" %>
<%@ include file="admin_service.jsp" %>
<%--<%@ page contentType="text/html;charset=UTF-8" %>--%>

<%
    int id = Integer.parseInt(request.getParameter("id"));

deleteBooking(id);

response.sendRedirect("trip_table.jsp?msg=deleted");
%>
