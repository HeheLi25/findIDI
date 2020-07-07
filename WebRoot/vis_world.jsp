<%@ page language="java" import="java.sql.*,java.io.*,java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>FindIDI: Visualiser-WorldMap</title>
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
  <div style="height:100px">
    <div style="float:left;width:250px"><img style="float:right" width="30px" height="30px" src="images/demo/heart.png" alt="heart" /></div>
    <div style="float:left;margin-left:15px">

    <a style="float:left"> At the top-right corner of the graph, &nbsp;</a><br><br>
    <a style="float:left">click</a>
    <img style="border:1px solid grey" width="35px" height="35px" src="images/demo/down.png" alt="download" />
    <a style="float:left">to download the it as a image, &nbsp;</a>
    <a style="float:left">click</a>
    <img  style="border:1px solid grey" width="35px" height="35px" src="images/demo/refresh.png" alt="restore" />
    <a style="float:left">to restore the graph.</a></div><br><br>
    </div>
            
 
    <hr><% 
    if(request.getAttribute("width")!=null){
    String width = (String)request.getAttribute("width");
    String height = (String)request.getAttribute("height");
    out.println("<div id=\"World\" style=\"width:" + width + "px;height:" + height + "px;\"></div>");
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
              <input style="background-color:#dedede;color:#525252" type="text" name="type" id="type" value="WorldMap" size="10"  readonly="readonly"/>
            </p> 
            <p>
              <label for="name">Title:</label>
              <input type="text" name="title" id="title" value="Delete the example and input your data." size="82" required="required"/>
            </p>
            <p>
            <label for="name">Size of the graph:(width*height)</label>
            <input type="text" style="background-color:#dedede;color:#525252" name="width" id="width" value="1200" size="5" readonly="readonly"/> 
            <label for="name">*</label>
            <input type="text" name="height" id="hight" value="600" size="5" required="required"/> 
            </p>   
            <p>
            <label for="name">Color range: from</label>
            <input type="text" name="low" id="low" value="1" size="5" required="required"/> 
            <label for="name">to</label>
            <input type="text" name="high" id="high" value="250" size="5" required="required"/> 
            </p>
            <p>
            <label for="name">Color of the lowest data:</label>
            <input type="color" name="color" value="#deffd6"> 
            <label for="name">, Color of the highest data:</label>
            <input type="color" name="color2" value="#093663"> 
            </p>
             <p>
              <label for="name">Precision(decimal places):</label>
              <input type=button value="+" onClick="javascript:this.form.prec.value++;">
              <input type="text" name="prec" id="prec" size="1" value=1> 
              <input type=button value="-" onClick="javascript:if(this.form.prec.value>0) this.form.prec.value--;">
            </p> 

            <p>
              <label for="name">Countries (Separate by "," as the given example.)</label><br>
              <textarea name="word" id="word" cols="100%" rows="20" required="required">Argentina,Australia,Austria,Belgium,Benin,Brazil,Canada,China,Croatia,Cuba,Cyprus,Czech Rep.,Denmark,Estonia,Finland,France,Germany,Greece,Hungary,Iceland,India,Iran,Ireland,Israel,Italy,Japan,Lebanon,Macedonia,Malaysia,Mexico,Netherlands,New Zealand,Norway,Pakistan,Philippines,Poland,Portugal,Romania,Russia,Saudi Arabia,Singapore,Slovenia,South Africa,South Korea,Spain,Sweden,Switzerland,Tanzania,Thailand,Turkey,United Arab Emirates,United Kingdom,United States,Uruguay,Venezuela</textarea>
            </p>
            <p>
              <label for="name">Data (Separate by "," as the given example.)</label><br>
              <textarea name="data" id="data" cols="100%" rows="10" required="required">1,65,23,37,1,35,52,180,1,2,4,1,7,1,32,90,180,17,23,1,34,1,15,16,71,48,1,1,2,3,27,14,8,5,1,5,5,6,3,4,7,1,1,31,37,29,64,1,1,1,2,147,250,4,1</textarea>              
            </p>
            <p>
              <input name="submit" type="submit" id="submit" value="Submit Form" class="button" />
				<br>
            </p>
            <%
            }else{ %>
             
            <p>
              <label for="name">Type(unchangeable):</label>
              <input style="background-color:#dedede;color:#525252" type="text" name="type" id="type" value="WorldMap" size="10"  readonly="readonly"/>
            </p> 
            <p>
              <label for="name">Title:</label>
              <%out.print("<input type=\"text\" name=\"title\" id=\"title\" size=\"82\" required=\"required\" value=\"" + request.getAttribute("title") + "\">"); %>
            </p> 
            <p>
            <label for="name">Size of the graph:(width*height)</label>
            <input type="text" style="background-color:#dedede;color:#525252" name="width" id="width" value="1200" size="5" readonly="readonly"/> 
            <label for="name">*</label>
            <input type="text" name="height" id="hight" value="600" size="5" required="required"/> 
            </p>   
            <p>
            <label for="name">Color range: from</label> 
              <%out.print("<input type=\"text\" name=\"low\" id=\"low\" size=\"5\" required=\"required\" value=\"" + request.getAttribute("low") + "\">"); %>
            <label for="name">to</label>
              <%out.print("<input type=\"text\" name=\"high\" id=\"high\" size=\"5\" required=\"required\" value=\"" + request.getAttribute("high") + "\">"); %>
            </p>
            <p>
            <label for="name">Color of the lowest data:</label>
            <%out.print("<input type=\"color\" name=\"color\" id=\"color\" value=\"" + request.getAttribute("color") + "\">"); %>
            <label for="name">, Color of the highest data:</label>
            <%out.print("<input type=\"color\" name=\"color2\" id=\"color2\" value=\"" + request.getAttribute("color2") + "\">"); %>
            </p>
             <p>
              <label for="name">Precision(decimal places):</label>
              <input type=button value="+" onClick="javascript:this.form.prec.value++;">
              <%out.print("<input type=\"text\" name=\"prec\" id=\"prec\" size=\"1\" required=\"required\" value=\"" + request.getAttribute("prec") + "\">"); %>
              <input type=button value="-" onClick="javascript:if(this.form.prec.value>0) this.form.prec.value--;">
            </p> 

            <p>
              <label for="name">Countries (Separate by "," as the given example.)</label><br>
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
 
 
 	    <script>                 
        var myChart = echarts.init(document.getElementById('World'));  
        option = {  
            title: {
                text: '<%=(String)request.getAttribute("title")%>',
                top: 'top'  
            },  
            visualMap: {  
                min: <%=(String)request.getAttribute("low")%>,  
                max: <%=(String)request.getAttribute("high")%>,  
                precision: <%=(String)request.getAttribute("prec")%>,
                text:['High','Low'],  
                realtime: false,  
                calculable: true,  
                color: ['<%=(String)request.getAttribute("color2")%>','<%=(String)request.getAttribute("color")%>']  
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
                    int m = 0;
                    ArrayList<String> word = (ArrayList<String>)request.getAttribute("word");
                    ArrayList<String> data = (ArrayList<String>)request.getAttribute("data");
                    if(word!=null){
                    while(m < word.size()){
                       // System.out.println("{name: '"+ word.get(m) + "', value: " + data.get(m)+"}");
			            out.println("{name: '"+ word.get(m) + "', value: " + data.get(m) + "},");
			            m++;
		            } }
                    %>
             
                    ] 
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
