
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>

<%@ page language="java" %>
<%@ page import="com.cloudinary.*, com.cloudinary.utils.ObjectUtils" %>

<%
    // 🔥 Replace these values with your real Cloudinary credentials
    String CLOUD_NAME = "your_cloud_name";
    String API_KEY = "your_api_key";
    String API_SECRET = "your_api_secret";

    Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
        "cloud_name", CLOUD_NAME,
        "api_key", API_KEY,
        "api_secret", API_SECRET,
        "secure", true
    ));
%>

