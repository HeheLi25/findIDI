<%@ page language="java" import="java.sql.*,java.io.*,java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>FindIDI: Visualiser-Example</title>
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
    
     <br> <button1 type="button" onclick="window.location.href='visualiser.jsp'">Go Back</button1> <br>
    <br>
	 <h1 style="font-size:30px">-Papers published in sigcomm, infocomm and CCR</h1><br>
	    <!-- ############################# -->
        <div class="portfolio">
	   
	     <%@page import="dao.DataDAO"%> 
	     <%@page import="dao.impl.DataDAOImpl"%>
	     <%@page import="database.DBConnect"%> 

	<%
	  DataDAO dao = new DataDAOImpl();
	  
	  ArrayList<String> sigCoun = dao.readCol("test_sigcomm_country","country");
	  ArrayList<String> sigCounData = dao.readCol("test_sigcomm_country","times");
	  ArrayList<String> infoCoun = dao.readCol("test_infocomm_country","country");
	  ArrayList<String> infoCounData = dao.readCol("test_infocomm_country","times");
	  ArrayList<String> ccrCoun = dao.readCol("test_ccr_country","country");
	  ArrayList<String> ccrCounData = dao.readCol("test_ccr_country","times");

      ArrayList<String> sigCoun0 = dao.handleCoun(sigCoun);
      ArrayList<String> ccrCoun0 = dao.handleCoun(ccrCoun);
      ArrayList<String> infoCoun0 = dao.handleCoun(infoCoun);
      	//  System.out.println(ccrCoun0);
     // System.out.println(ccrCounData);	  
	  
	  ArrayList<String> sigKey = dao.readCol("test_sigcomm_key","word");
	  ArrayList<String> sigKeyData = dao.readCol("test_sigcomm_key","times");
	  ArrayList<String> ccrKey = dao.readCol("test_ccr_key","word");
	  ArrayList<String> ccrKeyData = dao.readCol("test_ccr_key","times");
	  
	  ArrayList<String> sigKey0 = dao.handleCoun(sigKey);
	  ArrayList<String> ccrKey0 = dao.handleCoun(ccrKey);
	  
	  
	  ArrayList<String> years = dao.readCol("test_years","year");
	  ArrayList<String> ccrYears = dao.readCol("test_years","ccr");
	  ArrayList<String> sigYears = dao.readCol("test_years","sigcomm");
	  ArrayList<String> infoYears = dao.readCol("test_years","infocomm");
	//  System.out.println(sigYears);
	//  System.out.println(years);
	//  System.out.println(infoYears);
	 %>
	 
	 <div id="years" style="width: 1250px;height:400px;"></div>
	 	     <script type="text/javascript">
      
        var myChart = echarts.init(document.getElementById("years"));
        var option = {
            title: {
                text: 'Number of papers published each year'
            },
            tooltip: { trigger: 'axis'},
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
                data:['Sigcomm','Infocomm','CCR']
            },
            grid: {
                left: '55px',
                bottom:'100px',
                top:'10%'
            },
            xAxis: {
                type : 'category',
                data: <%=years%>,
            },
            yAxis: {
                type : 'value',
                boundaryGap : [0, 0.01]
            },
            
            series: [
            {
                name: 'Sigcomm',
                type: 'line',
                data: <%=sigYears%>,
                smooth:true
            },
            {
                name: 'Infocomm',
                type: 'line',
                data: <%=infoYears%>,
                smooth:true
            },
            {
                name: 'CCR',
                type: 'line',
                data: <%=ccrYears%>,
                smooth:true
            }
            ],
             dataZoom : [
	    	{
                type: 'slider',
                show: true,
                start: 0,
                end: 100,
                handleSize:30 
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
        <br><br><hr><br>
	 <h1 style="font-size:28px">-Sigcomm</h1><br>
       
       <div id="sigCounBar" style="width: 1250px;height:300px;"></div> 
       <script type="text/javascript">
      
       var myChart = echarts.init(document.getElementById("sigCounBar"));
     var option = {
            color:['#093663'],
            title: {
                
                text: 'SigComm: Countries of the authors'
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
                left: '55px',
                bottom:'120px',
                top:'20%'
            },
            xAxis: {
                type : 'category',
                data: <%=sigCoun0%>,
                axisLabel: {
                                           interval:0,
                                           rotate:40
                                        }
            },
            yAxis: {
                type : 'value',
                boundaryGap : [0, 0.01]
            },
            calculable : true,
            series: [
            {
                name: 'Sigcomm',
                type: 'bar',
                data: <%=sigCounData%>,
                smooth:false
            }
            ],
             dataZoom : [
	    	{
                type: 'slider',
                show: true,
                start: 0,
                end: 50,
                handleSize:30 
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
      
      
      
       <div id="sigCounMap" style="width: 1200px;height:600px;"></div>
	    <script>                 
        var myChart = echarts.init(document.getElementById('sigCounMap'));  
        option = {  
            title: {
                top: 'top'  
            },  
            visualMap: {  
                min: 1232,  
                max: 0,  
                precision: 0,
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
                    while(n<sigCoun0.size()){
                      //  System.out.println("{name: '"+ sigCoun.get(n) + "', value: " + sigCounData.get(n) + "},");
			            out.println("{name: "+ sigCoun0.get(n) + ", value: " + sigCounData.get(n) + "},");
			            n++;
		            } 
                    %>
             
                    ] 
                }  
            ]  
        };  
        myChart.setOption(option);
       </script>
       
       
      <br><br>  <div id="sigWord" style="width: 1250px;height:800px;"></div>
	 	     <script type="text/javascript">
      
        var myChart = echarts.init(document.getElementById("sigWord"));

option = {
    color:['#093663'],
    title: {
        text: 'Sigcomm: Keywords frequency',
    },
    tooltip: {
        show: true
    },
            toolbox: {
                show : true,
                feature : {
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
            minSize: 14
        },
        data: [
                    <%
                    int m = 0;
                    while(m<sigKey0.size()){
                      //  System.out.println("{name: '"+ sigKey0.get(m) + "', value: " + sigKeyData.get(m) + ",itemStyle: createRandomItemStyle()},");
			            out.println("{name: "+ sigKey0.get(m) + ", value: " + sigKeyData.get(m) + "},");
			            m++;
		            } 
                    %>
        ]
    }]
};
                    
       
        myChart.setOption(option);
       
    </script>     
       
       
       
       
                    <hr><br>       
      <h1 style="font-size:28px">-CCR</h1><br>
      
      <div id="ccrCounBar" style="width: 1250px;height:300px;"></div> 
       <script type="text/javascript">
      
       var myChart = echarts.init(document.getElementById("ccrCounBar"));
     var option = {
            color:['#093663'],
            title: {
                
                text: 'CCRComm: Countries of the authors'
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
                left: '55px',
                bottom:'120px',
                top:'20%'
            },
            xAxis: {
                type : 'category',
                data: <%=ccrCoun0%>,
                axisLabel: {
                                           interval:0,
                                           rotate:40
                                        }
            },
            yAxis: {
                type : 'value',
                boundaryGap : [0, 0.01]
            },
            calculable : true,
            series: [
            {
                name: 'Sigcomm',
                type: 'bar',
                data: <%=ccrCounData%>,
                smooth:false
            }
            ],
             dataZoom : [
	    	{
                type: 'slider',
                show: true,
                start: 0,
                end: 50,
                handleSize:30 
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
       
       
       
      <br><br> <div id="ccrCounMap" style="width: 1200px;height:600px;"></div>
	    <script>                 
        var myChart = echarts.init(document.getElementById('ccrCounMap'));  
        option = {  
            title: {
                top: 'top'  
            },  
            visualMap: {  
                min: 644,  
                max: 0,  
                precision: 0,
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
                    int n1 = 0;
                    while(n1<ccrCounData.size()){
                     //   System.out.println("{name: '"+ ccrCoun0.get(n1) + "', value: " + ccrCounData.get(n1) + "},");
			            out.println("{name: "+ ccrCoun0.get(n1) + ", value: " + ccrCounData.get(n1) + "},");
			            n1++;
		            } 
                    %>
             
                    ] 
                }  
            ]  
        };  
        myChart.setOption(option);


       </script>               
              
             <br><br>  <div id="ccrWord" style="width: 1250px;height:800px;"></div>
	 	     <script type="text/javascript">
      
        var myChart = echarts.init(document.getElementById("ccrWord"));

option = {
    color:['#093663'],
    title: {
        text: 'CCR: Keywords frequency',
    },
    tooltip: {
        show: true
    },
            toolbox: {
                show : true,
                feature : {
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
            minSize: 14
        },
        data: [
                    <%
                    int m0 = 0;
                    while(m0<ccrKey0.size()){
                      //  System.out.println("{name: "+ ccrKey0.get(m0) + ", value: " + ccrKeyData.get(m0) + "},");
			            out.println("{name: "+ ccrKey0.get(m0) + ", value: " + ccrKeyData.get(m0) + "},");
			            m0++;
		            } 
                    %>
        ]
    }]
};
                    
       
        myChart.setOption(option);
       
    </script>           
              
              
              
              
        <hr><br>       
      <h1 style="font-size:28px">-InfoComm</h1><br>
        <div id="infoCounBar" style="width: 1250px;height:300px;"></div> 
       <script type="text/javascript">
      
       var myChart = echarts.init(document.getElementById("infoCounBar"));
     var option = {
            color:['#093663'],
            title: {
                
                text: 'InfoComm: Countries of the authors'
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
                left: '55px',
                bottom:'120px',
                top:'20%'
            },
            xAxis: {
                type : 'category',
                data: <%=infoCoun0%>,
                axisLabel: {
                                           interval:0,
                                           rotate:40
                                        }
            },
            yAxis: {
                type : 'value',
                boundaryGap : [0, 0.01]
            },
            calculable : true,
            series: [
            {
                name: 'Sigcomm',
                type: 'bar',
                data: <%=infoCounData%>,
                smooth:false
            }
            ],
             dataZoom : [
	    	{
                type: 'slider',
                show: true,
                start: 0,
                end: 50,
                handleSize:30 
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
       
       
       
      <br><br> <div id="infoCounMap" style="width: 1200px;height:600px;"></div>
	    <script>                 
        var myChart = echarts.init(document.getElementById('infoCounMap'));  
        option = {  
            title: {
                top: 'top'  
            },  
            visualMap: {  
                min: 4089,  
                max: 0,  
                precision: 0,
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
                    int n0 = 0;
                    while(n0<infoCoun0.size()){
                   //     System.out.println("{name: '"+ infoCoun.get(n0) + "', value: " + infoCounData.get(n0) + "},");
			            out.println("{name: "+ infoCoun0.get(n0) + ", value: " + infoCounData.get(n0) + "},");
			            n0++;
		            } 
                    %>
             
                    ] 
                }  
            ]  
        };  
        myChart.setOption(option);


       </script>          
       
                

                
              
              
		  	 <div style="text-align: center"> </div>
		  
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