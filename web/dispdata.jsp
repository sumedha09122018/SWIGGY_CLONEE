<%-- 
    Document   : dispdata
    Created on : 21 Nov, 2018, 1:02:41 PM
    Author     : RAJAN
--%>

<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
    </head>
    <body>
        <%
            
           
            response.setContentType("image/jpg");
             try
           {   
            String url="jdbc:mysql://localhost:3306/restraunt";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con =DriverManager.getConnection(url,"root","");
            Blob image = null;
            byte[ ] imgData = null ;
            Statement stmt = null;
            ResultSet rs = null;


stmt = con.createStatement();
rs = stmt.executeQuery("select photo from chandigarhrasoi where name ='abhishek'");
if (rs.next()) {
image = rs.getBlob(5);
imgData = image.getBytes(1,(int)image.length());

}
else {
out.println("Display Blob Example");
out.println("image not found for given id>");

        }
OutputStream o = response.getOutputStream();
o.write(imgData);
o.flush();
o.close();
           }
           
        
        catch(Exception e)
        {
            out.println("got an exception");
            out.println(e.getMessage());
        }
        %>
    </body>
</html>