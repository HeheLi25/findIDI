<html>
<head>
<title>FindIDI: Login</title>
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
      <li ><a href="contact.jsp">Contact me</a></li>
            <li><a>view Data</a>
	    <ul>
          <li><a href="data_index.jsp">Index</a></li>
          <li><a href="data_country.jsp">Country</a> </li>
        </ul>
		</li>
      <li><a href="visualiser.jsp">Visualiser</a></li>
      <li class="active"><a>User center</a></li>
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
          else{out.println("Please<button1 type=\"button\">Login</button1> or <button1 type=\"button\" onclick=\"window.location.href=\'user_register.jsp\'\">Register </button1>.");}
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
					 Baskerville, 'Palatino Linotype', Palatino, 'Century Schoolbook L', 'Times New Roman', 'serif';font-size:30px;
					 margin-top:20px;margin-bottom:8px">Login</h2></div>
              <div style="width:600px;margin:0 auto;border:1px solid #B2B3B4">
<div class="login" align="left" style="margin-left:155px">

<div style="color:red">
<%if(request.getAttribute("msg")!=null){
out.println("<br>"+request.getAttribute("msg"));
}%>
</div>


  <form action="./user_login" method="post"><br>
	  &nbsp;username:<br>
      &nbsp;<input type="text" name="username" placeholder="Please input your username" required="required"><br>
      &nbsp;Password:<br>
	  &nbsp;<input type="password" name="password" placeholder="Please input your password" required="required"><br><br>
      <button type="submit" class="button">Login</button>
	  <br>Don't have an account? please:<br>
	  <button  onclick="window.location.href='user_register.jsp'" class="button">Register</button>
	  <br><br>&nbsp;
  </form>
</div>

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