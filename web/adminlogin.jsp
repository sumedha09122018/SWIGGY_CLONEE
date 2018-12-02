<%-- 
    Document   : adminlogin
    Created on : 25 Nov, 2018, 11:42:11 PM
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
        
        <%
             String username = (String) request.getParameter("uname");
        String password = (String) request.getParameter("pass");
        if (password.equals("1234")) {
            HttpSession mysession = request.getSession();
            mysession.setAttribute("uname", username);
           
            response.sendRedirect("admin.jsp");
        }else{
        
        response.sendRedirect("adminlogin.jsp");
        }
            %>
    </body>
</html>
