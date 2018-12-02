<%-- 
    Document   : profilejsp
    Created on : 19 Nov, 2018, 9:20:57 PM
    Author     : RAJAN
--%>
<%@page contentType="text/html"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
             <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
  <script type="text/javascript" src="jquery.cycle.all.js"></script> 
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
  <script type="text/javascript" src="jquery.cycle.all.js"></script> 
        <link rel="stylesheet" type="text/css" media="all" href="newcss.css"></link>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .topnav a {
    float: left;
    color: #f2f2f2;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    font-size: 17px;
}

/* Change the color of links on hover */
.topnav a:hover {
    background-color: #ddd;
    color: black;
}

/* Add a color to the active/current link */
.topnav a.active {
    background-color: #4CAF50;
    color: white;
}



.footer-classic a, .footer-classic a:focus, .footer-classic a:active {
    color: #ffffff;
}
.nav-list li {
    padding-top: 5px;
    padding-bottom: 5px;
}

.nav-list li a:hover:before {
    margin-left: 0;
    opacity: 1;
    visibility: visible;
}

ul, ol {
    list-style: none;
    padding: 0;
    margin: 0;
}

.social-inner {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 100%;
    padding: 23px;
    font: 900 13px/1 "Lato", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
    text-transform: uppercase;
    color: rgba(255, 255, 255, 0.5);
}
.social-container .col {
    border: 1px solid rgba(255, 255, 255, 0.1);
}
.nav-list li a:before {
    content: "\f14f";
    font: 400 21px/1 "Material Design Icons";
    color: #4d6de6;
    display: inline-block;
    vertical-align: baseline;
    margin-left: -28px;
    margin-right: 7px;
    opacity: 0;
    visibility: hidden;
    transition: .22s ease;
}
            </style>
    </head>
    <body>
        <%
            String pname=(String)session.getAttribute("uname");
            String email=(String)session.getAttribute("txtemail");
            String password=(String)session.getAttribute("txtpasswordS");
            String number=(String)session.getAttribute("num");
              String url="jdbc:mysql://localhost:3306/restraunt";
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn =DriverManager.getConnection(url,"root","");
             HttpSession s=request.getSession();
               
         String query="select pname,price,total from orderdetail where name='"+pname+"'";
          String query1="select * from userdetail where name='"+pname+"'";
           Statement st=conn.createStatement();
            Statement st1=conn.createStatement();
  ResultSet r=st1.executeQuery(query1);
  r.next();
             ResultSet rs=st.executeQuery(query);
           %>
       
             <div class="topnav">
            <a href="newindexpagejsp.jsp">Home</a> 
            <a href="menupage.jsp">Menu</a>
            <a href="">Updates</a>
            <a href="AboutUs.html">About Us</a>
             <a href="logout.jsp">Log Out</a>
             <li><a href="profilejsp.jsp"><% out.println((String)session.getAttribute("uname")); %></a></li>
           
       </div> 
<div class="container emp-profile">
            <form method="post">
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-img">
                            <img src="contact.png" alt=""/>
                            <div class="file btn btn-lg btn-primary">
                                Change Photo
                                <input type="file" name="file"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="profile-head">
                                    <h5>
                                        <%out.println(pname); %>
                                    </h5>
                                    <h6>
                                      Foodie
                                    </h6>
                                    <p class="proile-rating">RANKINGS : <span>8/10</span></p>
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">About</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Timeline</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                   

                    <div class="col-md-8">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>User Id</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%out.println(pname+123);%></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Name</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%out.println(pname);%></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Email</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%out.println(r.getString("email"));%></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Phone</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%out.println(r.getString("mnumber"));%></p>
                                            </div>
                                        </div>
                                             <div class="row">
                                            <div class="col-md-6">
                                                <label>Refer codes available</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%out.println(r.getString("ReferCode"));%></p>
                                            </div>
                                        </div>
                                              <div class="row">
                                            <div class="col-md-6">
                                                <label>Recent orders</label>
                                            </div>
                                                  <% while(rs.next()) { %>
                                            <div class="col-md-6">
                                                 <label>PRODUCT NAME:</label>
                                                <p><%out.println(rs.getString("pname"));%></p>
                                            </div>
                                         
                                        </div>
                                              <div class="row">
                                            <div class="col-md-6">
                                                <label>PRICE:</label>
                                            </div>
                                            <div class="col-md-6">
                                              <p><%out.println(rs.getInt("price"));%></p>
                                          
                                            </div>
                                        </div>    
                                             <div class="row">
                                            <div class="col-md-6">
                                                <label>TOTAL</label>
                                            </div>
                                            <div class="col-md-6">
                                              <p><%out.println(rs.getInt("total"));%></p>
                                                <% }%>
                                            </div>
                                        </div>        
                                            
                                         
                           
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>Your Bio</label><br/>
                                        <p>Your detail description</p>
                                    </div>
                                     <div class="col-md-6">
                                              <p>food is life.</p>
                                         
                                            </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>           
        </div>
                                       
  <footer class="section footer-classic context-dark bg-image" style="background: #2d3246;">
        <div class="container">
          <div class="row row-30">
            <div class="col-md-4 col-xl-5">
              <div class="pr-xl-4"><a class="brand" href="index.html"><img class="brand-logo-light" src="images/agency/logo-inverse-140x37.png" alt="" width="140" height="37" srcset="images/agency/logo-retina-inverse-280x74.png 2x"></a>
                <p>Being on a hectic schedule, people may not get enough time to go out for food. They may be quite busy with their personal or office work.

In this scenario users can directly open your restaurant’s or food delivering company’s online food ordering system, irrespective of the place and can order food within no time. <br>As soon as the user places an online order you will be notified about the new order, and you have to prepare & deliver food to the user as per the delivery time mentioned while placing the order.</p>
                <!-- Rights-->
                <p class="rights"><span>©  </span><span class="copyright-year">2018</span><span> </span><span>Waves</span><span>. </span><span>All Rights Reserved.</span></p>
              </div>
            </div>
            <div class="col-md-4">
              <h5>Contacts</h5>
              <dl class="contact-list">
                <dt>Address:</dt>
                <dd>798 South Park Avenue, Jaipur, Raj</dd>
              </dl>
              <dl class="contact-list">
                <dt>email:</dt>
                <dd><a href="mailto:#">dkstudioin@gmail.com</a></dd>
              </dl>
              <dl class="contact-list">
                <dt>phones:</dt>
                <dd><a href="tel:#">+91 7568543012</a> <span>or</span> <a href="tel:#">+91 9571195353</a>
                </dd>
              </dl>
            </div>
            <div class="col-md-4 col-xl-3">
              <h5>Links</h5>
              <ul class="nav-list">
                <li><a href="#">About</a></li>
                <li><a href="#">Projects</a></li>
                <li><a href="#">Blog</a></li>
                <li><a href="#">Contacts</a></li>
                <li><a href="#">Pricing</a></li>
              </ul>
            </div>
          </div>
        </div>
        <div class="row no-gutters social-container">
          <div class="col"><a class="social-inner" href="#"><span class="icon mdi mdi-facebook"></span><span>Facebook</span></a></div>
          <div class="col"><a class="social-inner" href="#"><span class="icon mdi mdi-instagram"></span><span>instagram</span></a></div>
          <div class="col"><a class="social-inner" href="#"><span class="icon mdi mdi-twitter"></span><span>twitter</span></a></div>
          <div class="col"><a class="social-inner" href="#"><span class="icon mdi mdi-youtube-play"></span><span>google</span></a></div>
        </div>   
</footer>
        
        
        
    </body>
</html>
