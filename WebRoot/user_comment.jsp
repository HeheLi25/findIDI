<%@ page language="java" import="java.sql.*,java.io.*,java.util.*,dao.DataDAO,dao.impl.DataDAOImpl" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>FindIDI: My comments</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="css.css" type="text/css" />
<script type="text/javascript" src='js\echarts.js'></script>
	<style> body{background-attachment: fixed;

background-image: url(images/demo/back.jpg) ;</style>
	
	
</head>
<body id="top" style="background-image:url(images/demo/back.jpg)">
	
	
	

	
  <div class="wrapper">
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
              <li class="active"><a href="user_info.jsp">User center</a></li>
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
                  </div>
                  <br class="clear" />
              </div>
          </div>
      <div class="whitebox" > 
	  <!-- ############################# -->
         
              <h2>All your comments:</h2>  
	          <%   
	          if((String)session.getAttribute("username")!=null) {
                  String driverName = "com.mysql.jdbc.Driver";   
                  String userName = "root";  
                  String userPasswd = "111111";  
                  String dbName = "proj";  
 
                  String url = "jdbc:mysql://127.0.0.1:3306/proj" +  "?user="  
                               + userName + "&password=" + userPasswd + "&useSSL=false";  
                  Class.forName("com.mysql.jdbc.Driver").newInstance();  
                  Connection connection = DriverManager.getConnection(url); 
               
                  Statement statement = connection.createStatement(); 
     
        
                   ResultSet rs = statement.executeQuery("select * from comments where username=" + "'" + (String)session.getAttribute("username") + "'");
                %>  
    
                <%  
                   int n = 1;
                   while (rs.next()) {  
                       session.setAttribute("n",n);
                       DataDAO dao = new DataDAOImpl(); 
                       String indexName = dao.getIndexName(rs.getString(4));
            
                 %>  
        
                  <div class="portfolio">
                 <div class="comments">
                     <div class="cm">
				     <a style="font-size:36px;background:#3C5D73;color:aliceblue;">&nbsp;<%out.print("#"+session.getAttribute("n"));%> &nbsp;</a>
				     &nbsp; <a class="bold" style="color:black;font-size:22px">  <%out.print(indexName);%> </a>
                     </div>
			         <div class="cm_right" style="width:1100px">
			             <a style="font-size:18px;background:#DBE2E8;color:grey"> <%out.print(rs.getString(2));%></a>
	                     <hr><%out.print(rs.getString(3));%>
                     </div>
		  	         <div style="text-align: center"> </div>
		  
                     <div class="clear"></div>
                 </div>            </div>
                 <%  
                        n++;
                    } 
                 %>  
                 <div class="clear"></div>
            
   
      <%
        rs.close();  
        statement.close();  
        connection.close();  
        }
       %>  

             <br>
	         <button onclick="window.location.href='user_info.jsp'" class="button">Go Back</button>
	         <br>
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