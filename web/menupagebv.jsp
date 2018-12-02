<%-- 
    Document   : menupage
    Created on : 21 Nov, 2018, 9:50:21 PM
    Author     : RAJAN
--%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>

<%@page import="java.util.ArrayList"%>
<%@page import="classes.Item"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>k
<style>
    .context-dark, .bg-gray-dark, .bg-primary {
    color: rgba(255, 255, 255, 0.8);
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
    
    .topnav {
    background-color: #333;
    overflow: hidden;
     position: fixed;
      top: 0; /* Position the navbar at the top of the page */
    width: 100%; /* Full width */
}

/* Style the links inside the navigation bar */
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
    
    
     #imgs{
	        position:relative;
	        height: 50px;
	        display:block;
	        
            background-color: black;
            padding-top: 8px;
           
           text-align: center;
    
	}
    
    body{
    background: -webkit-linear-gradient(left, #ff1212, #309dbd);
}
    .img12
{
    height: 12vw;
    width: 15vw;
   
}



 .container {
                
                margin:center;
            }
            .headbanner {
                float: left;
                height: 80px;
                width: 900px;
                vertical-align:middle;
                background-color:#FFCC00;
                
            }
           
            
            .mycontent {
                float: left;
                height: 650px;
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
        
            .cartcontent {
                float: left;
                height: 200px;
                width: 900px;
                background-color:#FFFFC2;
                border-width:1px;
                border-style:solid;
                border-color:#FFCC00;
            }
            .prod1 {
                float: left;
                height: 100px;
                width: 900px;
                border-bottom-width:1px;
                border-bottom-style:solid;
                border-bottom-color:#FFCC00;
            }
             .total {
                float: left;
                height: 180px;
                width: 285px;
                font-family: Verdana, Geneva, sans-serif;
                font-size: 24px;
                font-weight: bold;
                padding-top:20px;
                padding-left:10px;
            }
            
            
            wish
            {
                color: white;
            }
            
             .myitems {
                float: left;
                height: 200px;
                width: 600px;
                border-right-width:1px;
                border-right-style:solid;
                border-right-color:#FFCC00;
                overflow: auto;
            }
            
            .items {
                float: left;
                height: auto;
                width: 900px;
            }

</style>
<script>
    var b=0;   
	 function update_value(chk_bx){
		      if(chk_bx.checked)
		         {
		             var a="checked";
		 	   b+=1;
		 }
		         else{
		             var a="not checked";
		 		if(b>0){
		 			b-=1;
		 		}else if(b==0){
		 			b=0;
		 		}
		         }
		      if (b==0)
		    	  {
			         document.getElementById('wish').innerHTML ='Cart : Empty';

		    	  }else{
		         document.getElementById('wish').innerHTML ='Cart : '+b+'';
		    	  }
		     }

</script>
    </head>
    

          <div class="topnav">
            <a href="newindexpagejsp.jsp">Home</a> 
            <a href="menupageph.jsp">Menu</a>
            <a href="">Updates</a>
            <a href="AboutUs.html">About Us</a>
            <a href="profilejsp.jsp"><% String name=(String)session.getAttribute("uname"); out.println(name); %></a>
            <li><a  style="color:whitesmoke;"><div id="wish" >Cart: Empty</div></a></li>
       </div>
        
    <%
        int a=5;
          String url="jdbc:mysql://localhost:3306/restraunt";
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn =DriverManager.getConnection(url,"root","");
             HttpSession s=request.getSession();
               String pid=(String)session.getAttribute("id");
          
 if(pid==null)
            {
                pid="5";
            }
 String query="select name,price from beverages where id="+pid+"";
        PreparedStatement ps=(PreparedStatement)conn.prepareStatement("SELECT * from beverages");
       ResultSet r=ps.executeQuery();
       Statement st=conn.createStatement();
            ResultSet rs=st.executeQuery(query);
   r.next();
rs.next();
      %>
      
     
        <form action="getdata2.jsp" method="post">  
     
   <div style="margin-left: 30vw;margin-top: 3vw;">

      <table cellspacing="30vw;">
<tr>


<td><img src="caffeamericano.JPG" class="img12"><br><div style="margin-left:0.3vw;margin-top: 0.2vw;">Caffe Americano</div><div style="margin-left:0.3vw;margin-top: 0.2vw;color:#969EAB;font-size: 0.9vw;">pizza</div><div style="margin-left:0.3vw;margin-top: 0.2vw;color:#969EAB;font-size: 1.0vw;">Rs. 90<button type="submit" style="display:inline-block;background: transparent;border:1px solid;border-color: orange;color: orange;margin-left: 7vw;">ADD</button><input type="checkbox" name="chk1" value="1" onchange="update_value(this);"></div></td>

<td><img src="caffeemochaJPG.JPG" class="img12"><br><div style="margin-left:0.3vw;margin-top: 0.2vw;"></div>caffee mocha<div style="margin-left:0.3vw;margin-top: 0.2vw;color:#969EAB;font-size: 0.9vw;">pizza</div><div style="margin-left:0.3vw;margin-top: 0.2vw;color:#969EAB;font-size: 1.0vw;">Rs. 120 <button type="submit" style="display:inline-block;background: transparent;border:1px solid;border-color: orange;color: orange;margin-left: 7vw;">ADD</button><input type="checkbox" name="chk1" value="2" onchange="update_value(this);"></div></td>

</tr>

<tr>

<td><img src="caffelatte.JPG" class="img12"><br><div style="margin-left:0.3vw;margin-top: 0.2vw;">caffe latte</div><div style="margin-left:0.3vw;margin-top: 0.2vw;color:#969EAB;font-size: 0.9vw;">pizza</div><div style="margin-left:0.3vw;margin-top: 0.2vw;color:#969EAB;font-size: 1.0vw;">Rs. 90 <button type="submit" style="display:inline-block;background: transparent;border:1px solid;border-color: orange;color: orange;margin-left: 7vw;">ADD</button><input type="checkbox" name="chk1" value="3" onchange="update_value(this);"></div></td>

<td><img src="cappuchino.JPG" class="img12"><br><div style="margin-left:0.3vw;margin-top: 0.2vw;">cappuchino</div><div style="margin-left:0.3vw;margin-top: 0.2vw;color:#969EAB;font-size: 0.9vw;">pizza</div><div style="margin-left:0.3vw;margin-top: 0.2vw;color:#969EAB;font-size: 1.0vw;">Rs. 120 <button type="submit" style="display:inline-block;background: transparent;border:1px solid;border-color: orange;color: orange;margin-left: 7vw;">ADD</button><input type="checkbox" name="chk1" value="4" onchange="update_value(this);"></div></td>

</tr>

<tr>

<td><img src="coldfoamcascaraJPG.JPG" class="img12"><br><div style="margin-left:0.3vw;margin-top: 0.2vw;">cold foam cascara</div><div style="margin-left:0.3vw;margin-top: 0.2vw;color:#969EAB;font-size: 0.9vw;">pizza</div><div style="margin-left:0.3vw;margin-top: 0.2vw;color:#969EAB;font-size: 1.0vw;">Rs. 90 <button type="submit" style="display:inline-block;background: transparent;border:1px solid;border-color: orange;color: orange;margin-left: 7vw;">ADD</button><input type="checkbox" name="chk1" value="5" onchange="update_value(this);"></div></td>

<td><img src="Coldfoamcascasranitro.JPG" class="img12"><br><div style="margin-left:0.3vw;margin-top: 0.2vw;">Cold foam cascasra nitro</div><div style="margin-left:0.3vw;margin-top: 0.2vw;color:#969EAB;font-size: 0.9vw;">pizza</div><div style="margin-left:0.3vw;margin-top: 0.2vw;color:#969EAB;font-size: 1.0vw;">Rs. 150 <button type="submit" style="display:inline-block;background: transparent;border:1px solid;border-color: orange;color: orange;margin-left: 7vw;">ADD</button><input type="checkbox" name="chk1" value="6" onchange="update_value(this);"></div></td>

</tr>

</table>

</div>

<hr style="margin-left: 18vw;margin-right: 18vw;">

<div><h1 style="margin-left:30vw;">BEVERAGES</h1></div>

<div style="margin-left:30vw;">

<div style="margin-top: 0.2vw;font-size: 1.2vw;">Iced Coffee<button type="submit" style="display:inline-block;background: transparent;border:1px solid;border-color: orange;color: orange;margin-right:33vw; float: right;">ADD</button><input type="checkbox" name="chk1" value="7" onchange="update_value(this);" style="display:inline-block;margin-right:31vw; float: right;">

<br><div style="margin-left:0.3vw;margin-top: 0.2vw;color:#969EAB;font-size: 1.0vw;">Rs. 70</div></div></div>

<hr style="margin-left: 28vw;margin-right: 28vw;">

<div style="margin-left:30vw;">

<div style="margin-top: 0.2vw;font-size: 1.2vw;">iced peppermint<button type="submit" style="display:inline-block;background: transparent;border:1px solid;border-color: orange;color: orange;margin-right:33vw; float: right;">ADD</button><input type="checkbox" name="chk1" value="8" onchange="update_value(this);"style="display:inline-block;margin-right:31vw; float: right";>

<br><div style="margin-left:0.3vw;margin-top: 0.2vw;color:#969EAB;font-size: 1.0vw;">Rs. 200</div></div></div>

<hr style="margin-left: 28vw;margin-right: 28vw;">

<div style="margin-left:30vw;">

<div style="margin-top: 0.2vw;font-size: 1.2vw;">iced  Vanillabean<button type="submit" style="display:inline-block;background: transparent;border:1px solid;border-color: orange;color: orange;margin-right:33vw; float: right;">ADD</button><input type="checkbox" name="chk1" value="9" onchange="update_value(this);"style="display:inline-block;margin-right:31vw; float: right";>

<br><div style="margin-left:0.3vw;margin-top: 0.2vw;color:#969EAB;font-size: 1.0vw;">Rs. 100</div></div></div>

<hr style="margin-left: 28vw;margin-right: 28vw;">

<div style="margin-left:30vw;">

<div style="margin-top: 0.2vw;font-size: 1.2vw;">Nitro Cold Brew with Sweet Cream<button type="submit" style="display:inline-block;background: transparent;border:1px solid;border-color: orange;color: orange;margin-right:33vw; float: right;">ADD</button><input type="checkbox" name="chk1" value="10" onchange="update_value(this);"style="display:inline-block;margin-right:31vw; float: right";>

<br><div style="margin-left:0.3vw;margin-top: 0.2vw;color:#969EAB;font-size: 1.0vw;">Rs. 120</div></div></div>

<hr style="margin-left: 28vw;margin-right: 28vw;">


<div style="margin-left:30vw;">
<div style="margin-top: 0.2vw;font-size: 1.2vw;"><%out.println(rs.getString("name"));%><button type="submit" style="display:inline-block;background: transparent;border:1px solid;border-color: orange;color: orange;margin-right:33vw; float: right;">ADD</button><input type="checkbox" name="chk1" value="<%out.println(pid);%>" onchange="update_value(this);"style="display:inline-block;margin-right:31vw; float: right";>

<br><div style="margin-left:0.3vw;margin-top: 0.2vw;color:#969EAB;font-size: 1.0vw;"><%out.println(rs.getString("price"));%></div></div></div>
<button type="submit" style="display:inline-block;background: transparent;border:1px solid;border-color: orange;color: orange;margin-right:33vw; float: right;">GO TO CART</button>
        </form>



<footer class="section footer-classic context-dark bg-image" style="background: #2d3246;">
        <div class="container">
          <div class="row row-30">
            <div class="col-md-4 col-xl-5">
              <div class="pr-xl-4"><a class="brand" href="index.html"><img class="brand-logo-light" src="images/agency/logo-inverse-140x37.png" alt="" width="140" height="37" srcset="images/agency/logo-retina-inverse-280x74.png 2x"></a>
                <p>Being on a hectic schedule, people may not get enough time to go out for food. They may be quite busy with their personal or office work.

In this scenario users can directly open your restaurant’s or food delivering company’s online food ordering system, irrespective of the place and can order food within no time. <br>As soon as the user places an online order you will be notified about the new order, and you have to prepare & deliver food to the user as per the delivery time mentioned while placing the order..</p>
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
