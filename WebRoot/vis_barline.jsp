<%@ page language="java" import="java.sql.*,java.io.*,java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>FindIDI: Visualiser-Bar/Line Chart</title>
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
            
            
<div style="margin-left:150px;height:150px">
    <img style="float:left" width="30px" height="30px" src="images/demo/heart.png" alt="heart" />
    <a style="float:left"> At the right side of the graph, &nbsp;</a><br><br>
    <a style="float:left">click</a>
    <img style="border:1px solid grey" width="35px" height="35px" src="images/demo/down.png" alt="download" />
    <a style="float:left">to download the it as a image, &nbsp;</a>
    <a style="float:left">click</a>
    <img  style="border:1px solid grey" width="35px" height="35px" src="images/demo/data.png" alt="modify" />
    <a style="float:left">to view/modify the raw data.</a><br><br>
    <a style="float:left">click</a>
    <img  style="border:1px solid grey" width="35px" height="35px" src="images/demo/bar.png" alt="bar" />&nbsp;
    <img  style="border:1px solid grey" width="35px" height="35px" src="images/demo/line.png" alt="line" />
    <a style="float:left">to change the chart between line/bar,&nbsp;</a>
    <a style="float:left">click</a>
    <img  style="border:1px solid grey" width="35px" height="35px" src="images/demo/refresh.png" alt="restore" />
    <a style="float:left">to restore the graph.</a>

    </div>
         <hr>
     <% 
    if(request.getAttribute("width")!=null){
    String width = (String)request.getAttribute("width");
    String height = (String)request.getAttribute("height");
    out.println("<div id=\"BarLine\" style=\"width:" + width + "px;height:" + height + "px;\"></div>");
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
              <input style="background-color:#dedede;color:#525252" type="text" name="type" id="type" value="Bar/Line" size="10"  readonly="readonly"/>
            </p> 
            
            <p>
              <label for="name">Title:</label>
              <input type="text" name="title" id="title" value="Delete the example and input your data." size="82" required="required"/>
            </p>
             <p>
            <label for="name">Size of the graph:(width*height)</label>
            <input type="text" name="width" id="width" value="1250" size="5" required="required"/> 
            <label for="name">*</label>
            <input type="text" name="height" id="hight" value="500" size="5" required="required"/>  
            </p>
            <p>
              <label for="name">Element (Separate by "," as the given example.)</label><br>
              <textarea name="word" id="word" cols="100%" rows="10" required="required">apple,banana,peach,pear,watermelon,strawberry,mango,pineapple,orange,grape,blueberry</textarea>
            </p>
            <p>
              <label for="name">Legends (Separate by "," as the given example.)</label><br>
              <textarea name="legend" id="legend" cols="100%" rows="3" required="required">Year 2017,Year 2019,Year 2010</textarea>
            </p>
            <p>
              <label for="name">Data (Separate by ","(single data) and ";"(a set of data) as the given example.)</label><br>
              <textarea name="data" id="data" cols="100%" rows="10" required="required">
147,65,35,52,180,32,90,180,71,48,31;
129,62,68,12,120,30,87,110,12,13,23;
98,23,66,14,110,30,60,130,45,15,23;</textarea>              
            </p>
            <p>
              <input name="submit" type="submit" id="submit" value="Submit Form" class="button" />
              
				<br>
            </p>
            
            <%
            }else{ %>
             
 <p>
              <label for="name">Type(unchangeable):</label>
              <input style="background-color:#dedede;color:#525252" type="text" name="type" id="type" value="Bar/Line" size="10"  readonly="readonly"/>
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
              <label for="name">Elements (Separate by "," as the given example.)</label><br>
              <textarea name="word" id="word" cols="100%" rows="10" required="required"><%out.print(request.getAttribute("rawWord")); %></textarea>
            </p>
            <p>
              <label for="name">Data (Separate by "," as the given example.)</label><br>
               <textarea name="data" id="data" cols="100%" rows="5" required="required"><%out.print(request.getAttribute("rawData")); %></textarea>           
            </p>
            <p>
              <label for="name">>Data (Separate by ","(single data) and ";"(a set of data) the given example.)</label><br>
               <textarea name="legend" id="legend" cols="100%" rows="5" required="required"><%out.print(request.getAttribute("rawLegend")); %></textarea>           
            </p>
            <p>
              <input name="submit" type="submit" id="submit" value="Submit Form" class="button" />
              
				<br>
            </p>
            
            
            
            <%} %>            
            
            
          </form> 
   </div> 
 
 
 
 
 

 
 <script type="text/javascript">
      
 var myChart = echarts.init(document.getElementById("BarLine"));

 option = {
    title: {
        text: '<%=(String)request.getAttribute("title")%>',
    },
    tooltip: {
        trigger: 'axis'
    },
     legend: {
        data: <%=request.getAttribute("legend")%>
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
            dataView : {show: true, readOnly: false},
            restore : {show: true},
            magicType : {show: true, type: ['line', 'bar']},
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
            data : <%=request.getAttribute("word")%>,
            axisLabel: {
                                           interval:0,
                                           rotate:30
                                        }
        }
    ],
    series: [
    <%
    
    ArrayList<String> legend = (ArrayList<String>)request.getAttribute("legend");
    String[] data0= (String[])request.getAttribute("data0");
    int i = 0;
    if(data0!=null){
    while(i<data0.length){
    out.println("{");
    out.println("name:" + legend.get(i) + ",");
    out.println("type:'line',");
    out.println("data:[" + data0[i] + "]");
    out.println("},");
    i++;
    }}
    
    
    %>],
    

    dataZoom : [
	    	{
                type: 'slider',
                show: true,
                start: 0,
                end: 100,
                handleSize: 30
            },
            {
                type: 'inside',
                start: 1,
                end: 10
            }
	    ]
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
