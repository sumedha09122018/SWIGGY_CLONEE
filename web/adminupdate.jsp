<%-- 
    Document   : adminupdate
    Created on : 21 Nov, 2018, 12:34:36 PM
    Author     : RAJAN
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.FileInputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
                <title>JSP Page</title>
    </head>
    <body>
        <%
            
            String name=request.getParameter("name");
               String pid=request.getParameter("id");
         HttpSession s=request.getSession();
         String restraunt=request.getParameter("res");
         out.println(restraunt);
              s.setAttribute("id",pid);
                s.setAttribute("res",restraunt);
            String pass=request.getParameter("photo");
            String Price=request.getParameter("price");
            String Cat=request.getParameter("cat");
           // int a=Integer.parseInt(Price);
            out.println(pass +" "+Cat);
             try
             {
            String url="jdbc:mysql://localhost:3306/restraunt";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con =DriverManager.getConnection(url,"root","");
           PreparedStatement ps=con.prepareStatement("insert into "+restraunt+" values(?,?,?,?)"); 
           ps.setString(1,pid);
             ps.setString(4,Cat);
            ps.setString(3,Price);
         //  FileInputStream fin=new FileInputStream(pass); 
           // ps.setBinaryStream(5,fin,fin.available()); 
            ps.setString(2,name);
            int q=ps.executeUpdate(); 
            if(q>0)
            {
                RequestDispatcher rd=request.getRequestDispatcher("newindexpagejsp.jsp");
                
                rd.forward(request,response);
                
            }
            else
            {
               out.println("not inserted");
            }
            ps.close();
        }
        
        catch(Exception e)
        {
            
            out.println("got an exception");
            out.println(e.getMessage());
        }
        %>
    </body>
</html>