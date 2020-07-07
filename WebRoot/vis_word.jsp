<%@ page language="java" import="java.sql.*,java.io.*,java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>FindIDI: Visualiser-WordMap</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="css.css" type="text/css" />
<script type="text/javascript" src='js\echarts.js' charset="UTF-8"></script>
<script src="js\world.js"></script> 
<script src="js\echarts-wordcloud.js"></script> 
	<style> body{background-attachment: fixed;

background-image: url(images/demo/back.jpg) ;</style>
	
	
</head>
  
<body id="top" style="background-image:url(images/demo/back.jpg)">
<div class="wrapper" >
  <div id="topnav">
    <ul class="nav">
      <li ><a href="home.jsp">Home</a></li>
      <li ><a href="about.jsp">About site</a></li>
      <li><a href="contact.jsp">Contact me</a></li>
      <li><a>view Data</a>
	    <ul>
          <li><a href="data_index.jsp">Index</a></li>
          <li><a href="data_country.jsp">Country</a> </li>
        </ul>
      </li>
      <li class="active"><a href="visualiser.jsp">Visualiser</a></li>
      
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
          else{out.println("Please<button1 type=\"button\" onclick=\"window.location.href=\'user_login.jsp\'\">Login</button1> or "
                           +"<button1 type=\"button\" onclick=\"window.location.href=\'user_register.jsp\'\">Register </button1>.");}
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
    
    
            <br><button1 type="button" onclick="window.location.href='visualiser.jsp'"> Go Back </button1>    
            <br> <br>
            
   
            
            <% 
             if((String)request.getAttribute("title")!=null){
            %>
            
          <hr>
            
            
<div style="margin-left:20px;height:100px">
    <img style="float:left" width="30px" height="30px" src="images/demo/heart.png" alt="heart" />
    <a style="float:left"> At the top-right corner of the graph, &nbsp;</a><br><br>
    <a style="float:left">click</a>
    <img style="border:1px solid grey" width="35px" height="35px" src="images/demo/down.png" alt="download" />
    <a style="float:left">to download the it as a image, &nbsp;</a>
    <a style="float:left">click</a>
    <img  style="border:1px solid grey" width="35px" height="35px" src="images/demo/data.png" alt="restore" />
    <a style="float:left">to view/modify the raw data,&nbsp;</a>
    <a style="float:left">click</a>
    <img  style="border:1px solid grey" width="35px" height="35px" src="images/demo/refresh.png" alt="restore" />
    <a style="float:left">to restore the graph.</a>

    </div>
         <hr>
     <% 
    if(request.getAttribute("width")!=null){
    String width = (String)request.getAttribute("width");
    String height = (String)request.getAttribute("height");
    out.println("<div id=\"Word\" style=\"width:" + width + "px;height:" + height + "px;\"></div>");
    }
    %>
            <% } %>
<div class="portfolio">
 <div style="text-align: center">


          <form style="margin-bottom:30px;margin-top:30px" action="./vis_word" method="post">
          <%
           if(request.getAttribute("title")==null){ 
          %>          
          
            <p>
              <label for="name">Type(unchangeable):</label>
              <input style="background-color:#dedede;color:#525252" type="text" name="type" id="type" value="WordMap" size="10"  readonly="readonly"/>
            </p> 
            
            <p>
              <label for="name">Title:</label>
              <input type="text" name="title" id="title" value="Delete the example and input your data." size="82" required="required"/>
            </p>
             <p>
            <label for="name">Size of the graph:(width*height)</label>
            <input type="text" name="width" id="width" value="1200" size="5" required="required"/> 
            <label for="name">*</label>
            <input type="text" name="height" id="hight" value="900" size="5" required="required"/>  
            </p>
            <p>
              <label for="name">Words (Separate by "," as the given example.)</label><br>
              <textarea name="word" id="word" cols="100%" rows="20" required="required">Network architecture,Computer architecture,Internet,Communication,Internet protocols,Algorithms,Complex networks,Design,Transmission control protocol,Data center networks,Internet service providers,Data centers,Routers,Software defined networkings,Virtualizations,Open flow,Social networking online,Network security,Radio,Software defined networks,Optimization,Topology,Wireless networks,Data privacy,Measurements,Mobile telecommunication systems,Performance,Scheduling,Security,Virtual reality,Wireless telecommunication systems,Internet measurement,Network virtualization,Quality of service,Traffic Engineering,Digital storage,Hardware,Network management,Research communities,Congestion control communication,Datacenter,Distributed computer systems,Information centric networkings,IPv6,Network protocols,Packet networks,Computer hardware,Experiments,HTTP,Internet architecture,Research,Software defined networking (SDN),Websites,Active measurement,Architecture,Cloud computing,Distributed systems,Future internet,Middleboxes,Mobile devices,Named data networkings,Prototype implementations,Resource allocation,Telecommunication networks,Testbeds,Video streaming,Abstracting,Bandwidth,Computer simulation,DNS,Experimentation,Mobile security,Network condition,Network routing,Personal communication systems,Surveys,TCP,Webservices,WiFi,Address space,Carrier mobility,Computer operating systems,Cryptography,Design and implementations,Gateways computer networks,Home networks,Internet exchange points,MIMO systems,Network functions,Network layers,Network measurement,Network operator,Network performance,Online social networks,Open systems,Packet loss,Packet processing</textarea>              
            </p>
            <p>
              <label for="name">Data (Separate by "," as the given example.)</label><br>
              <textarea name="data" id="data" cols="100%" rows="10" required="required">121,86,79,78,64,27,25,25,23,21,21,20,20,19,19,18,18,16,16,16,15,15,15,14,14,14,14,14,14,14,14,13,13,13,13,12,12,12,12,11,11,11,11,11,11,11,10,10,10,10,10,10,10,9,9,9,9,9,9,9,9,9,9,9,9,9,8,8,8,8,8,8,8,8,8,8,8,8,8,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7</textarea>              
            </p>
            <p>
              <input name="submit" type="submit" id="submit" value="Submit Form" class="button" />
              
				<br>
            </p>
            
            <%
            }else{ %>
             
 <p>
              <label for="name">Type(unchangeable):</label>
              <input style="background-color:#dedede;color:#525252" type="text" name="type" id="type" value="WordMap" size="10"  readonly="readonly"/>
            </p> 
            
            <p>
              <label for="name">Title:</label>
              <%out.print("<input type=\"text\" name=\"title\" id=\"title\" size=\"82\" required=\"required\" value=\"" + request.getAttribute("title") + "\">"); %>
            </p>
             <p>
            <label for="name">Size of the graph:(width*height)</label>
            <%out.print("<input type=\"text\" name=\"width\" id=\"width\" size=\"5\" required=\"required\" value=\"" + request.getAttribute("width") + "\">"); %> 
            <label for="name">*</label>
            <%out.print("<input type=\"text\" name=\"height\" id=\"height\" size=\"5\" required=\"required\" value=\"" + request.getAttribute("height") + "\">"); %> 
            </p>   
            <p>
              <label for="name">Words (Separate by "," as the given example.)</label><br>
              <textarea name="word" id="word" cols="100%" rows="10" required="required"><%out.print(request.getAttribute("rawWord")); %></textarea>
            </p>
            <p>
              <label for="name">Data (Separate by "," as the given example.)</label><br>
               <textarea name="data" id="data" cols="100%" rows="5" required="required"><%out.print(request.getAttribute("rawData")); %></textarea>           
            </p>
            <p>
              <input name="submit" type="submit" id="submit" value="Submit Form" class="button" />
              
				<br>
            </p>
            
            
            
            <%} %>            
            
            
          </form> 
   </div> 
 
 
 
 
 

 
 <script type="text/javascript">
      
 var myChart = echarts.init(document.getElementById("Word"));

 option = {
    title: {
        text: '<%=(String)request.getAttribute("title")%>',
    },
    tooltip: {
        show: true
    },
            toolbox: {
                show : true,
                feature : {
                    restore : {show: true},
                    dataView : {show: true, readOnly: false},
                    saveAsImage : {show: true}
                    }
            },
    series: [{
        type: 'wordCloud',
        size: ['100%', '100%'],
        textRotation : [0, 45, 90, -45],
        textPadding: 0,
        textStyle: {
                            normal: {
                                color: function() {
                                    return 'rgb(' +
                                            Math.round(Math.random() * 255) +
                                            ', ' + Math.round(Math.random() * 255) +
                                            ', ' + Math.round(Math.random() * 255) + ')'
                                }
                            }
                        },
        autoSize: {
            enable: true,
            minSize: 1
        },
        data: [
                    <%
                    int m = 0;
                    ArrayList<String> word = (ArrayList<String>)request.getAttribute("word");
                    ArrayList<String> data = (ArrayList<String>)request.getAttribute("data");
                    if(word!=null){
                    while(m < word.size()){
                   //     System.out.println("{name: '"+ word.get(m) + "', value: " + data.get(m)+"}");
			            out.println("{name: '"+ word.get(m) + "', value: " + data.get(m) + "},");
			            m++;
		            } }
                    %>
        ]
    }]
};
                    
       
        myChart.setOption(option);
       
    </script>     

  
</div></div>
<!-- ####################################################################################################### -->

 <div id="copyright">
    <p>2019 - Yirong Li - Beijing University of Post and Communication </p>
<br class="clear" />
  </div>
</div>
	</div>
</body>
 
</html>





  </body>
</html>
