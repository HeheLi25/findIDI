<%@ page language="java" import="java.sql.*,java.io.*,java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>FindIDI: Indexes-Years</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="css.css" type="text/css" />
<script type="text/javascript" src='js\echarts.js' charset="UTF-8"></script>
<script src="js\world.js"></script> 
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
    
	    <!-- ############################# -->
	    
        <div class="portfolio">
       <br> <button1 type="button" onclick="window.location.href='data_index.jsp'">Go Back</button1> <br><br>
       
   <form action="./years" method="post">
          
              <select id="years" name="years" style="height:30px;width:240px;font-size:20px">
                  <option value="error">>>Choose a year<<</option>
	              <option value="2007">2007</option>
	              <option value="2008">2008</option>
	              <option value="2009">2009</option>
	              <option value="2010">2010</option>
	              <option value="2011">2011</option>
	              <option value="2012">2012</option>
	              <option value="2013">2013</option>
              </select>
              <br><br>          
           <button type="submit" class="button">See data</button>
	       </form>
	       <% String thisIndex=(String)session.getAttribute("thisIndex");
	          String thisYear = (String)session.getAttribute("years");
	                              if(thisYear==null){thisYear = "2007";}else{
                    	          if (!thisYear.equals("2007")&&!thisYear.equals("2008")&&!thisYear.equals("2009")&&!thisYear.equals("2010")&&!thisYear.equals("2011")&&!thisYear.equals("2012")&&!thisYear.equals("2013")){
	                              thisYear = "2007";
	                              }}
	                              System.out.println(thisYear);
	        out.println("<p style=\"font-size:26px\">" + thisIndex );
	       if(thisYear!=null){
	       out.println( "--->>>" + thisYear +":</p>");
	       }%>      
	 
	   
	 
	<!-- ####################################################################################################### 2007 -->
	       <%if(thisYear!=null){
	       out.println("<div id=\"main\" style=\"width: 1200px;height:600px;border:1px solid #ccc\"></div><br><div id=\"thisChart\" style=\"width: 1350px;height:400px;\"></div>");
	       
	       }%>
	       
	       
	       <script>

                    <% 

                       ArrayList<String> yearData = (ArrayList<String>)session.getAttribute(thisYear);
                       ArrayList<String> country = (ArrayList<String>)session.getAttribute("country"); 
                      // System.out.println(yearData+"+"+country);
               double maxDevation = 0.0;

                double minDevation = 9999;

                int yy=2007;
              for(yy=2007;yy<2014;yy++){
              ArrayList<String> YY = (ArrayList<String>)session.getAttribute(String.valueOf(yy));
              
              try{             
               
                int totalCount = YY.size();
                if (totalCount >= 1){
                    double max = Double.parseDouble(YY.get(0).toString());
                    for (int i = 0; i < totalCount; i++)
                    {
                        double temp = Double.parseDouble(YY.get(i).toString());
                        if (temp > max)
                        {
                            max = temp;
                        }
                    } 
                    if (max > maxDevation){
                    maxDevation = max; }
               //     System.out.println(maxDevation);
               }
     
     
               
                if (totalCount >= 1)
                {
                        double min = Double.parseDouble(YY.get(0).toString());
                        for (int i = 0; i < totalCount; i++)
                        {
                            double temp = Double.parseDouble(YY.get(i).toString());
                            if (min > temp)
                            {
                                min = temp;
                            }
                        }  
                        if (min < minDevation){
                        minDevation = min; }
                 //        System.out.println(minDevation);
                 }
                   }
                       catch (Exception e)
                   {
                              throw e;
                   }
                   }
                       %>
                       
                       
     var myChart = echarts.init(document.getElementById('main'));  
        option = {  
            title: {  
                left: 'center',  
                top: 'top'  
            },  
            visualMap: {  
                min: <%out.println(minDevation);%>,  
                max: <%out.println(maxDevation);%>,  
                precision: 3,
                text:['High','Low'],  
                realtime: false,  
                calculable: true,  
                color: ['#093663','#deffd6']  
            },  
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    restore : {show: true},
                    saveAsImage : {show: true}
                    }
            },
            series: [  
                {  
                    name: 'Map chart',  
                    type: 'map',  
                    mapType: 'world',  
                    roam: true,  
                    itemStyle:{  
                        emphasis:{label:{show:true}}  
                    },  
                    data: [  

                    <%
                    int n = 0;
                    if(yearData != null){
                    while(n<yearData.size()){
			            out.println("{name: "+ country.get(n) + ", value: " + yearData.get(n) + "},");
			            n++;
		            } }
                    %>
             
                    ] 
                }  
            ]  
        };  
        myChart.setOption(option);


</script>
	       
	       
   <script type="text/javascript">

	          
	          
       //System.out.println("********************"+thisIndex);
       
       var myChart = echarts.init(document.getElementById('thisChart'));
   
        // 指定图表的配置项和数据
        var option = {
            color:['#093663'],
            title: {
                text: '<%=session.getAttribute("years")%>'
            },
            tooltip: {},
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: true},
                    magicType : {show: true, type: ['line', 'bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                    }
            },
  
            legend: {
                data:['yes']
            },
            grid: {
                left: '50px',
                bottom:'120px',
                top:'10%'
            },
            xAxis: {
                data: <%=session.getAttribute("country")%>,
                axisLabel: {
                                           interval:0,
                                           rotate:40
                                        }
            },
            yAxis: {},
            
            series: [{
                name: 'legend',
                type: 'bar',
                data: <%=session.getAttribute(thisYear)%>
            }],
             dataZoom : [
	    	{
                type: 'slider',
                show: true,
                start: 0,
                end: 50,
                handleSize: 50
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
       
    </script>


      <!-- ############################# -->
      <div class="clear"></div>
    </div></div>

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