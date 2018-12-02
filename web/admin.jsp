<%-- 
    Document   : admin
    Created on : 21 Nov, 2018, 12:42:06 PM
    Author     : RAJAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
    <title>carts</title>
</head>
<style>
       
    .topnav {
    background-color: #333;
    overflow: hidden;
}
    body{
    background: -webkit-linear-gradient(left, #ff1212, #309dbd);
}
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
    input[type=text], select {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
input[type=password], select {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
input[type=number], select {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
input[type=email], select {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type=submit] {
    width: 100%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}


    </style>
    
 <body>
      <div class="topnav">
            <a href="newindexpagejsp.jsp">Home</a> 
            <a href="menupage.jsp">Menu</a>
            <a href="">Updates</a>
            <a href="AboutUs.html">About Us</a>
             <li><a href="profilejsp.jsp"><% String name=(String)session.getAttribute("uname"); out.println(name); %></a></li>
            <a href="logout.jsp">Log Out</a>
       </div> 
     <table><center>
<font size = 5 color="black">
<div class="parent">
<form  action="adminupdate.jsp" enctype="multipart/form-data" accept="image/*">
<br>
Please enter item to add or remove:
<br>
<br>
Add Item:
Id:<input type="text" id="n" name="id" size="39" >
<br>
Name:<input type="text" id="n" name="name" size="39" >

<br>
price:<input type="number" id="e" name="price" size="39">
<br>

image:<input type="file" id="" name="photo" size="39">
<br>
<br>
<br>

category: <br>
<SELECT name="cat">
<OPTION>beverages
<OPTION>deserts
<OPTION>indian
<OPTION>chinesse
<OPTION>italian
<OPTION>sea food

</SELECT>
Restraunt: <br>
<SELECT name="res">
<OPTION>beverages
<OPTION>chandigarhrasoi
<OPTION>`pizza hut`
</SELECT>

<br> <br>
<input type="submit" name="submit" value="add">


</form></center>
       </table>
</FONT>
</body>
</html>
