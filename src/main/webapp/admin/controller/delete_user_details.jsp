<%@ include file="../../auth.jsp" %>
<%@ include file="../admin_service.jsp" %>
<%
  int id = Integer.parseInt(request.getParameter("id"));
  deleteUser(id);
  response.sendRedirect(request.getContextPath() + "/admin/views/user_table.jsp?msg=deleted");
%>