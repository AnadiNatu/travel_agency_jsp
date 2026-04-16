<%
    String token = (String) session.getAttribute("authToken");
    
    if(token != null){
    response.sendRedirect("auth.jsp");
    }else{
    response.sendRedirect("home.jsp");
    }
 %>
