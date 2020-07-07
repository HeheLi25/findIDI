<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>FindIDI: About Site</title>
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
      <li ><a href="home.jsp">Home</a></li>
      <li class="active"><a>About site</a></li>
      <li ><a href="contact.jsp">Contact me</a></li>
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
		<a id="left" class="bold" style="font-size: 50px;margin-top:12px">FIND&nbsp;IDI</a></h1>
    <p style="font-family:Baskerville, 'Palatino Linotype', Palatino, 'Century Schoolbook L', 'Times New Roman', 'serif'; margin-bottom:12px">
		<br>{ Global &nbsp; Information &amp; Communication &nbsp; Technology &nbsp; Development &nbsp; Index } </p>
  </div>


<!-- ####################################################################################################### -->

<!-- ####################################################################################################### -->

  <div class="container">
    <div class="wrapper">
  <div id="topbar" class="brow">
    <div class="fl_left">
		<h2>Welcome! 
	<%if((String)request.getSession().getAttribute("username")!=null){
out.println((String)request.getSession().getAttribute("username") + ".");}
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
      <div class="portfolio" >
		      <div style="text-align: center">    
		  <h2 style="font-family:
					 Baskerville, 'Palatino Linotype', Palatino, 'Century Schoolbook L', 'Times New Roman', 'serif';font-size:28px;
					 margin-top:20px;margin-bottom:8px">About me</h2></div>
              <div style="width:800px;margin:0 auto;border:1px solid #B2B3B4">
			<p style="text-align:center; line-height: 40px; margin-bottom:35px;margin-top:30px">
				-Yirong Li-<br>
				-liyirong@bupt.edu.cn-<br>
				-Beijing University of Post and Communication- <br>
			    -International School-<br>
				
				  </p>
              </div>
		  		      <div style="text-align: center">    
		  <h2 style="font-family:
					 Baskerville, 'Palatino Linotype', Palatino, 'Century Schoolbook L', 'Times New Roman', 'serif';font-size:28px;
					 margin-top:20px;margin-bottom:8px">About this website</h2></div>
		  <hr width="950px">
          <div style="width:950px;margin:0 auto" >
			<p style="line-height: 40px; margin-bottom:35px;margin-top:35px">
				The aim of the project is to develop a website which allows the users to view the data of ICT Development Index(IDI)
				of different countries over the world. IDI is a composite index which covers multiple aspects, such as information 
				infrastructure, knowledge level, development environment and effect, and information consumption. It can be a comprehensive 
				evaluation method to measure the degree of information development in global, regional and national level. Therefore,
				 these global data are of great reference value to studies in many fields. Those data will be visualised properly so
				  that the users can easily reference and study. For example, the website will help those students who are doing related
				   research and require data supports as reference. Users can also leave comments and interact socially with the data, so 
				   that they can discuss about the data and learn more from others'opinion. To achieve the interaction functions, there will
				    be a user system.<br></p>
			  <hr width="950px" />
			
         
        </div>
		  
		  
		  
		  
		  

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

