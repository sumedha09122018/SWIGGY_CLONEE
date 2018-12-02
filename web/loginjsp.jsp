
<%@page contentType="text/html"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>

        
        <% 
          
            String user=request.getParameter("uname");
            String pass=request.getParameter("psw");
            String url="jdbc:mysql://localhost:3306/yollo";
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn =DriverManager.getConnection(url,"root","");
            String query="select * from userdetail";
            Statement st=conn.createStatement();
            ResultSet rs=st.executeQuery(query);
            //String username1=rs.getString("name");
        
            
            while(rs.next())
            {
      String username=rs.getString("name");
      String passs=rs.getString("password");
      if(pass.equals(passs))
          {
          if(username.equals(user))
          {
         HttpSession s=request.getSession();
              s.setAttribute("uname",user);
              response.sendRedirect("newindexpagejsp.jsp");
          }
          }
            }
        %>
 