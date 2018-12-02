
<%@page contentType="text/html"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%
Random rand = new Random();
int n = rand.nextInt(90000) + 10000;
System.out.println(n);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>insert page in test1</title>
    </head>
    <body>
        <%
            
            String name=request.getParameter("txtFName");
            String email=request.getParameter("txtEmail");
        //  String code=request.getParameter("refercode");
           
            String password=request.getParameter("txtpassword");
            String  mnumber=request.getParameter("num");
            
            String  y=Integer.toString(n);
             session.setAttribute("txtname",name);
             session.setAttribute("txtemail",email);
              session.setAttribute("txtpassword",password);
               session.setAttribute("num",mnumber);
            
            String url="jdbc:mysql://localhost:3306/yollo";
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn =DriverManager.getConnection(url,"root","");
            String query="insert into userdetail values('"+name+"','"+email+"','"+password+"',"+mnumber+","+y+")";
           
            Statement st=conn.createStatement();   
            int q=st.executeUpdate(query);    
            if(q>0)
            {
                
             HttpSession s=request.getSession();
              s.setAttribute("txtFName",name);
              response.sendRedirect("indexpage.jsp");
   
            }
            else
            {
               out.println("row has not been inserted");
            }
            st.close();
        %>;
         <p><a href="newindexpage.html">click to go to the home page</a></p>
      
    </body>
</html>