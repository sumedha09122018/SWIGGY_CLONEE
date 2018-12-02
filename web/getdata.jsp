<%-- 
    Document   : checkout
    Created on : Jun 8, 2013, 12:15:52 PM
    Author     : Dilukshan Mahendra
--%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="classes.Item" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Shopping Cart - Check out</title>
        <style type="text/css">
       
            .container {
                height: 700px;
                width: 900px;
                margin:auto;
            }
            .headbanner {
                float: left;
                height: 80px;
                width: 900px;
                vertical-align:middle;
                background-color:#FFCC00;


            }
            .container .headbanner h1 {
                font-family: Verdana, Geneva, sans-serif;
                color: #CC3300;

            }
            .mycontent {
                float: left;
                height: 500px;
                width: 900px;
            }
            .myfooter {
                float: left;
                height: 100px;
                width: 900px;
                border-top-width:3px;
                border-top-style:solid;
                border-top-color:#FFCC00;
            }
            .container .myfooter h3 {
                font-family: Verdana, Geneva, sans-serif;
                font-size: 12px;
                color:#CC3300;
            }
            td{
                font-family:Verdana, Geneva, sans-serif;
                font-weight:normal;
                font-size:14px;

            }

     
        </style>
    </head>

    <body style="margin:0; padding:0">
        <form action="success.jsp">   
            <%
                 PrintWriter pw=response.getWriter();
           double sum=0;
           String url="jdbc:mysql://localhost:3306/restraunt";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con =DriverManager.getConnection(url,"root","");
            Statement st=con.createStatement();   
       ResultSet rs;
            String[] str;
           str=request.getParameterValues("chk1");

            %>
            <div class="container">

                <div class="headbanner">
                    <h1 style="display:inline"><center>
                            <img src="shopping.png" />[My Shopping Cart]
                        </center></h1>
                </div>
                <div class="mycontent">
                    <a style="color:#CC3300; font-family:Verdana, Geneva, sans-serif; font-size:20px; font-weight:bold">Checkout My Cart</a><br/>
                    <table width="500px">
                        <%
                           float count=0;
           if(str!=null){
               for(int i=0;i<str.length;i++){
                   st.executeQuery("select name,price from chandigarhrasoi where id="+str[i]+"");
                   rs=st.getResultSet();
                   while(rs.next()){
                       String nameVal=rs.getString("name");
                       
session.setAttribute("name",nameVal);
                       int c=rs.getInt("price");
           session.setAttribute("price",c);
               sum+=c;
               System.out.print(sum);
               int q=1;
               count++;
             
                        %>
                        
                        <tr>
                            <td><%out.print( rs.getString("name"));%></td> 
                            <td><%out.print(rs.getInt("price"));%></td> 
                        </tr>
                        <%}}%>
                        <tr>
                            <td style="font-weight:bold">My Total</td><td style="font-weight:bold">$[<%= sum%>]</td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Purchase" /></td>
                        </tr>	
                        <tr>
                            <td><img src="paywith.png" width="210" height="80" /></td></tr>
                        <%
           } session.setAttribute("psum",sum);
   %>
                    </table>
                </div>
               
            </div>
        </form>
    </body>
</html>

