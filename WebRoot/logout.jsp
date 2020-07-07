

<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>FindIDI: Logout</title>
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
      <li class="active"><a href="home.jsp">Home</a></li>
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
		<a id="left" class="bold" style="font-size: 50px;margin-top:12px">FIND&nbsp;IDI</a></h1>
    <p style="font-family:Baskerville, 'Palatino Linotype', Palatino, 'Century Schoolbook L', 'Times New Roman', 'serif';margin-bottom:12px">
		<br>{ Global &nbsp; Information &amp; Communication &nbsp; Technology &nbsp; Development &nbsp; Index } </p>
  </div>


<!-- ####################################################################################################### -->

<!-- ####################################################################################################### -->

  <div class="container">
    <div class="wrapper">
  <div id="topbar" class="brow">
    <div class="fl_left">
<h2>Logging out...</h2>
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

        
<!--		 <script>
   function logout(){
    <%
    session.invalidate();
    %>
    }
</script>  -->

<h2>You have logged out to your account.</h2>
<button class="button" onclick="window.location.href='home.jsp'">Back to home page</button><br>

  
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
