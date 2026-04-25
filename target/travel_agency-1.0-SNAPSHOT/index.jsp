<%
  String token = (String) session.getAttribute("authToken");
  if (token != null) {
    response.sendRedirect(request.getContextPath() + "/auth.jsp");
  } else {
    response.sendRedirect(request.getContextPath() + "/home.jsp");
  }
%>
