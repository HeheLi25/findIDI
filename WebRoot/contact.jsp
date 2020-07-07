<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>FindIDI: Contact Me</title>
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
      <li ><a href="about.jsp">About site</a></li>
      <li class="active"><a>Contact me</a></li>
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
      <div class="portfolio">
		      <div style="text-align: center">    
		  <h2 style="font-family:
					 Baskerville, 'Palatino Linotype', Palatino, 'Century Schoolbook L', 'Times New Roman', 'serif';font-size:28px;
					 margin-top:20px;margin-bottom:8px">Two ways to contact me</h2></div>
		  <hr width="800px">
          <div style="width:800px;margin:0 auto" id="respond">
			<p style="line-height: 40px; margin-bottom:35px;margin-top:35px">
				1.Send an e-mail toward { liyirong@bupt.edu.cn }.<br>
			   2.Fill the following textbox and submit the message.<br>
				Thank you for the message, any suggestions of yours are valuable for me.<br></p>
			  <hr width="800px" />
			<div style="color:green">
           <%if(request.getAttribute("msgC")!=null){
                 out.println("<br>"+request.getAttribute("msgC"));
             }%>
</div>
          <form style="margin-bottom:30px;margin-top:30px" action="./contact" method="post">
            <p>
              <input type="text" name="name" id="name" value="" size="22" required="required"/>
              <label for="name"><small>Name </small></label>
            </p>
            <p>
              <input type="email" name="mail" id="mail" value="" size="22" required="required" />
              <label for="email"><small>Mail </small></label>
            </p>
            <p>
              <textarea name="content" id="content" cols="100%" rows="10" required="required"></textarea>
              <label for="comment" style="display:none;"><small>Comment </small></label>
            </p>
            <p>
              <input name="submit" type="submit" id="submit" value="Submit Form" class="button" />
              &nbsp; 
              <input name="reset" type="reset" class="button" id="reset" tabindex="5" value="Reset Form" />
				<br>
            </p>
          </form>
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
