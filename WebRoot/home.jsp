<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>FindIDI: Home</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="css.css" type="text/css" />

	<style> body{background-attachment: fixed;

background-image: url(images/demo/back.jpg) ;</style>
	
</head>
<body id="top" style="background-image:url(images/demo/back.jpg)">
	
	
	

	
<div class="wrapper" >
  <div id="topnav">
    <ul class="nav">
      <li class="active"><a>Home</a></li>
      <li ><a href="about.jsp">About site</a></li>
      <li><a href="contact.jsp">Contact me</a></li>
      <li><a>view Data</a>
	    <ul>
          <li><a href="data_index.jsp">Index</a></li>
          <li><a href="data_country.jsp">Country</a> </li>
        </ul>
		</li>
       <li><a href="visualiser.jsp">Visualiser</a></li>
      <li>   <%if((String)request.getSession().getAttribute("username")!=null){
out.println("<a href=\"user_info.jsp\">User center</a>");}
          else{out.println("<a href=\"user_login.jsp\">User center</a>");}
%></li>
    </ul>
    <div class="clear"></div>
  </div>

<!-- ####################################################################################################### -->

<div id="header">

    <h1 style="font-family:Baskerville, 'Palatino Linotype', Palatino, 'Century Schoolbook L', 'Times New Roman', 'serif'">
	<a class="bold hd_left" style="float:">FIND&nbsp;IDI</a></h1>
    <p style="font-family:Baskerville, 'Palatino Linotype', Palatino, 'Century Schoolbook L', 'Times New Roman', 'serif'"> { Global &nbsp; Information &amp; Communication &nbsp; Technology &nbsp; Development &nbsp; Index } </p>

	</div>

<!-- ####################################################################################################### -->

<!-- ####################################################################################################### -->

  <div class="container">
    <div class="wrapper">
  <div id="topbar" class="brow">
    <div class="fl_left">
    
   
				<h2>Welcome! 
	<%if((String)request.getSession().getAttribute("username")!=null){
out.println((String)request.getSession().getAttribute("username") + ". &nbsp;<button1 type=\"button\" onclick=\"window.location.href=\'logout.jsp\'\">Logout</button1>");}
     else{out.println("Please<button1 type=\"button\" onclick=\"window.location.href=\'user_login.jsp\'\">Login</button1> or <button1 type=\"button\" onclick=\"window.location.href=\'user_register.jsp\'\">Register </button1>.");}
%>




</h2>
	  </div>
    <div class="fl_right">
		<h2>Search &amp; View &amp; Discuss</h2>
		<!--
      <form action="#" method="post">
        <fieldset>
          <legend>Site Search</legend>
          <input type="text" value="Search Our Website&hellip;"  onfocus="this.value=(this.value=='Search Our Website&hellip;')? '' : this.value ;" />
          <input type="submit" name="go" id="go" value="Search" />
        </fieldset>
      </form>
-->
   
    </div>
    <br class="clear" />
  </div>
</div>
    <div class="whitebox" >
      <!-- ############################# -->
      <div class="portfolio">
        <div class="fl_left" style="text-align:center">
          <h2 style="font-size:30px">-Start your journey</h2>
          
         <button class="btm1" onclick="window.location.href='data_index.jsp'">View by indexes</button><br>
			
		<br><button class="btm3" onclick="window.location.href='data_country.jsp'">View by countries</button>
		

 
<!-- <p class="readmore"><a href="#">View More Information &raquo;</a></p>   -->
        
         
         <hr><h2>NOTICE</h2> 
         <p> You can choose to view the existing visualized data,
          <br>or visualize your own data. </p>
          <hr>
		<button class="btm4" onclick="window.location.href='visualiser.jsp'">Custom Visualiser</button>
				<br>
        </div>
        <div class="fl_right"><img src="images/demo/home.png" alt="" /></div>
        <div class="clear"></div>
      </div>
   
		
  
      <!-- ############################# -->
      <div class="clear"></div>
    </div>

<!-- ####################################################################################################### -->
<!-- ####################################################################################################### -->

  <div id="copyright">
    <p>2019 - Yirong Li - Beijing University of Post and Communication </p>
<br class="clear" />
  </div>
</div>
	</div>
</body>

</html>
