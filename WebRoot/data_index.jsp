<%@ page language="java" import="java.sql.*,java.io.*,java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>FindIDI: View by Indexes</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="css.css" type="text/css" />
<script type="text/javascript" src='js\echarts.js' charset="UTF-8"></script>

	<style> body{background-attachment: fixed;

background-image: url(images/demo/back.jpg) ;</style>
	
	
</head>
<body id="top" style="background-image:url(images/demo/back.jpg)">
	
	
	

	
<div class="wrapper">
  <div id="topnav">
    <ul class="nav">
      <li ><a href="home.jsp">Home</a></li>
      <li ><a href="about.jsp">About site</a></li>
      <li><a href="contact.jsp">Contact me</a></li>
      <li class="active"><a>view Data</a>
	    <ul>
          <li><a href="#">Index</a></li>
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
    
              <form action="./data_index" method="post">
          
              <select id="index" name="index" style="height:30px;width:500px;font-size:20px">
                  <option>>>>Choose an index<<<</option>
	              <option value="1_sis">Secure Internet Servers per million population</option>
	              <option value="2_ixp">IXPs(if have IXPs=1; if not=0)</option>
	              <option value="3_mb">Mobile broadband monthly subscription per GDPC</option>
	              <option value="4_lr">Literacy rates</option>
	              <option value="5_ser">Secondary enrolment rates(gross)</option>
	              <option value="6_ter">Tertiary enrolment rates(gross) female/male</option>
	              <option value="7_sle">School life expectancy female/male</option>
	              <option value="8_pfi">Press freedom index</option>
	              <option value="9_fop">Freedom of the press</option>
	              <option value="10_pr">Political Rights</option>
	              <option value="11_cr">Civil rights</option>
	              <option value="12_gos">Government online services index</option>
	              <option value="13_iu">Internet users per 100</option>
	              <option value="14_ep">E-participation index</option>
              </select>
              <br><br>          
           <button type="submit" class="button">See data</button>
	       </form>
	    <!-- ############################# -->
             
	       <% String thisIndex=(String)session.getAttribute("thisIndex");
	       if(thisIndex!=null){   %>
	       
	       <div class="portfolio">  
	       <% 
	       out.println("<br><a style=\"font-size:45px\">" + thisIndex + "<hr></a><a>>>><button1 type=\"button\" onclick=\"window.location.href=\'years.jsp\'\">Click Here</button1> too see the seperate data of each year."
	       +"</a><br><br><br><div id=\"chartAll\" style=\"width: 1350px;height:700px;\"></div>");
	       
	       %>
	                <div class="clear"></div>
                    </div>
                    
                   <div class="portfolio">


	       <% 
	       if(thisIndex!=null){
	       out.println("<p style=\"font-size:35px\">" + thisIndex + "--->>>Comments:</p>");
	       }%>      
	   
	   
	     <%  
       
        String driverName = "com.mysql.jdbc.Driver";  
        String userName = "root";  
        String userPasswd = "111111";  
        String dbName = "proj";  
        String url = "jdbc:mysql://127.0.0.1:3306/proj" +  "?user="  
                + userName + "&password=" + userPasswd + "&useSSL=false";  
        Class.forName("com.mysql.jdbc.Driver").newInstance();  
        Connection connection = DriverManager.getConnection(url); 
        String location=(String)session.getAttribute("tableName");
        Statement statement = connection.createStatement();   
         ResultSet rs = statement.executeQuery("select * from comments where location=" + "'" + location + "'");
        %>  
        <% 
        int n = 1;
        while (rs.next()) {  
        session.setAttribute("n",n);
        %>  
        
        <div class="portfolio" >
            <div class="comments">
                <div class="cm_left">
				      <a style="font-size:36px;background:#3C5D73;color:aliceblue;">&nbsp;<%out.print("#"+session.getAttribute("n"));%> &nbsp;</a>
				      &nbsp; <a class="bold" style="color:black;font-size:26px"> <%out.print(rs.getString(1));%>  </a>
				      <br>&nbsp;&nbsp;
                      <a style="color:grey;font-size:18px"><%out.print(rs.getString(2));%></a>
			    </div>
		    	<div class="cm_right">
				    <hr><%out.print(rs.getString(3));%>
		        </div>
		      	<div style="text-align: center"> </div> 
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
        </div>
    
    
    
           
        <%  n++;
            } 
            
            if(n==1){
        %>  
    <hr>
    <a>No comments under this index yet! You can be the first one here.</a>
   
    
        <%}%>
          <div class="clear"></div>
      </div>
   
		 <%
        rs.close();  
        statement.close();  
        connection.close();  
    %>  

    <%if((String)request.getSession().getAttribute("tableName")!=null){%>
    <div id="leaveComment">
        <br><button type="button" class="button" onclick="leaveComment()">leave a comment</button><br><br>
    </div>
    
    
    
    <script>
    function leaveComment(){
    
    <%String username = (String)session.getAttribute("username");
    if(username!=null){
   %>
    var newdiv = document.getElementById("leaveComment");
    newdiv.innerHTML = "<form action=\"./comment\" method=\"post\">"
                       +"<h2>Leave your comment here:"
                       +"<p>"
                       +"<p>"
                       +"<textarea name=\"comment\" id=\"comment\" cols=\"100%\" rows=\"10\" style=\"width:800px\" required=\"required\"></textarea>"
                       +"</p>"
                       +"<p>"
                       +"<input name=\"submit\" type=\"submit\" id=\"submit\" value=\"Submit Form\" class=\"button\" />"
                       +"&nbsp; <input name=\"reset\" type=\"reset\" class=\"button\" id=\"reset\" tabindex=\"5\" value=\"Reset Form\" />"
				       +"<br></p></form>";
   <%
    }
    else{
    %>
    var newdiv = document.getElementById("leaveComment");
    newdiv.innerHTML = "<br><h2>In order to leave comments, "
                       +"first please<button1 type=\"button\" onclick=\"window.location.href=\'user_login.jsp\'\">Login</button1>"
                       +" or <button1 type=\"button\" onclick=\"window.location.href=\'user_register.jsp\'\">Register </button1>.</h2><br>";
    <%
    }%>

    }
    </script>
    <%
    }%>
                    
               
	       <% }%>
	   

    <script type="text/javascript">
       var thisIndex="<%=session.getAttribute("thisIndex")%>";
       //System.out.println("********************"+thisIndex);
       if(thisIndex!=null){     
       var myChart = echarts.init(document.getElementById('chartAll'));

        // 指定图表的配置项和数据
        var option = {
    title : {
        text: 'All data from 2007 to 2013',
        subtext: '<%=session.getAttribute("thisIndex")%>'
    },
    tooltip : {
        trigger: 'axis'
    },
    legend: {
        data:['Year 2007', 'Year 2008', 'Year 2009', 'Year 2010', 'Year 2011', 'Year 2012', 'Year 2013', 'Year 2014']
    },
    grid: {
                left: '50px',
                bottom:'120px',
                top:"100px"
            },
    toolbox: {
        show : true,
        orient: 'vertical',
        x: 'right',
        y: 'center',
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: true},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    yAxis : [
        {
            type : 'value',
            boundaryGap : [0, 0.01]
        }
    ],
    xAxis : [
        {
            type : 'category',
            data : <%=session.getAttribute("country")%>,
            axisLabel: {
                                           interval:0,
                                           rotate:30
                                        }
        }
    ],
    series : [
        {
            name:'Year 2007',
            type:'bar',
            data:<%=session.getAttribute("2007")%>
        },
        {
            name:'Year 2008',
            type:'bar',
            data:<%=session.getAttribute("2008")%>
        },
        {
            name:'Year 2009',
            type:'bar',
            data:<%=session.getAttribute("2009")%>
        },
        {
            name:'Year 2010',
            type:'bar',
            data:<%=session.getAttribute("2010")%>
        },
        {
            name:'Year 2011',
            type:'bar',
            data:<%=session.getAttribute("2011")%>
        },
        {
            name:'Year 2012',
            type:'bar',
            data:<%=session.getAttribute("2012")%>
        },
        {
            name:'Year 2013',
            type:'bar',
            data:<%=session.getAttribute("2013")%>
        }
    ],
     dataZoom : [
	    	{
                type: 'slider',
                show: true,
                start: 0,
                end: 20,
                handleSize: 30
            },
            {
                type: 'inside',
                start: 1,
                end: 10
            }
	    ]

};
                    

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
        }
    </script>


 
   
		

      <!-- ############################# -->
 
    <div class="clear"></div></div>
<!-- ####################################################################################################### -->

  <div id="copyright">
    <p>2019 - Yirong Li - Beijing University of Post and Communication </p>
<br class="clear" />
  </div>
</div>
	</div>
</body>
</html>