<%-- 
    Document   : logout
    Created on : 25 Nov, 2018, 10:54:54 PM
    Author     : RAJAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% session.invalidate();
response.sendRedirect("indexpage.jsp");%>
         <h1>Hello World!</h1>
    </body>
</html>
