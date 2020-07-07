<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
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
	
	
	

	
<div class="wrapper" >
  <div id="topnav">
    <ul class="nav">
      <li ><a href="home.jsp">Home</a></li>
      <li ><a href="about.jsp">About site</a></li>
      <li><a href="contact.jsp">Contact me</a></li>
      <li class="active"><a>view Data</a>
	    <ul>
          <li><a href="data_index.jsp">Index</a></li>
          <li><a href="#">Country</a> </li>
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
    
              <form action="./data_country" method="post">
          
              <select id="country" name="country" style="height:30px;width:250px;font-size:20px">
<option>>>Choose an country<<</option>
<option value="Argentina">Argentina</option>
<option value="Australia">Australia</option>
<option value="Austria">Austria</option>
<option value="Bahrain">Bahrain</option>
<option value="Bangladesh">Bangladesh</option>
<option value="Belgium">Belgium</option>
<option value="Benin">Benin</option>
<option value="Botswana">Botswana</option>
<option value="Brazil">Brazil</option>
<option value="Burkina Faso">Burkina Faso</option>
<option value="Cameroon">Cameroon</option>
<option value="Canada">Canada</option>
<option value="Chile">Chile</option>
<option value="China">China</option>
<option value="Colombia">Colombia</option>
<option value="Costa Rica">Costa Rica</option>
<option value="Czech Rep.">Czech Rep.</option>
<option value="Denmark">Denmark</option>
<option value="Ecuador">Ecuador</option>
<option value="Egypt">Egypt</option>
<option value="Estonia">Estonia</option>
<option value="Ethiopia">Ethiopia</option>
<option value="Finland">Finland</option>
<option value="France">France</option>
<option value="Germany">Germany</option>
<option value="Ghana">Ghana</option>
<option value="Greece">Greece</option>
<option value="Haiti">Haiti</option>
<option value="Hungary">Hungary</option>
<option value="Iceland">Iceland</option>
<option value="India">India</option>
<option value="Indonesia">Indonesia</option>
<option value="Ireland">Ireland</option>
<option value="Israel">Israel</option>
<option value="Italy">Italy</option>
<option value="Jamaica">Jamaica</option>
<option value="Japan">Japan</option>
<option value="Jordan">Jordan</option>
<option value="Kazakhstan">Kazakhstan</option>
<option value="Kenya">Kenya</option>
<option value="Korea">Korea</option>
<option value="Malawi">Malawi</option>
<option value="Malaysia">Malaysia</option>
<option value="Mali">Mali</option>
<option value="Mauritius">Mauritius</option>
<option value="Mexico">Mexico</option>
<option value="Morocco">Morocco</option>
<option value="Mozambique">Mozambique</option>
<option value="Myanmar">Myanmar</option>
<option value="Namibia">Namibia</option>
<option value="Nepal">Nepal</option>
<option value="Netherlands">Netherlands</option>
<option value="New Zealand">New Zealand</option>
<option value="Nigeria">Nigeria</option>
<option value="Norway">Norway</option>
<option value="Pakistan">Pakistan</option>
<option value="Peru">Peru</option>
<option value="Philippines">Philippines</option>
<option value="Poland">Poland</option>
<option value="Portugal">Portugal</option>
<option value="Qatar">Qatar</option>
<option value="Russia">Russia</option>
<option value="Rwanda">Rwanda</option>
<option value="Saudi Arabia">Saudi Arabia</option>
<option value="Senegal">Senegal</option>
<option value="Sierra Leone">Sierra Leone</option>
<option value="Singapore">Singapore</option>
<option value="South Africa">South Africa</option>
<option value="Spain">Spain</option>
<option value="Sweden">Sweden</option>
<option value="Switzerland">Switzerland</option>
<option value="Tanzania">Tanzania</option>
<option value="Thailand">Thailand</option>
<option value="Tunisia">Tunisia</option>
<option value="Turkey">Turkey</option>
<option value="Uganda">Uganda</option>
<option value="Ukraine">Ukraine</option>
<option value="United Arab Emirates">United Arab Emirates</option>
<option value="United Kingdom">United Kingdom</option>
<option value="United States">United States</option>
<option value="Uruguay">Uruguay</option>
<option value="Venezuela">Venezuela</option>
<option value="Viet Nam">Viet Nam</option>
<option value="Yemen">Yemen</option>
<option value="Zambia">Zambia</option>
<option value="Zimbabwe">Zimbabwe</option>
 </select>
 <a>&nbsp;&nbsp;&nbsp;(Compare with</a> 
     <select id="country2" name="country2" style="height:30px;width:250px;font-size:20px">
<option>>>Choose an country<<</option>
<option value="Argentina">Argentina</option>
<option value="Australia">Australia</option>
<option value="Austria">Austria</option>
<option value="Bahrain">Bahrain</option>
<option value="Bangladesh">Bangladesh</option>
<option value="Belgium">Belgium</option>
<option value="Benin">Benin</option>
<option value="Botswana">Botswana</option>
<option value="Brazil">Brazil</option>
<option value="Burkina Faso">Burkina Faso</option>
<option value="Cameroon">Cameroon</option>
<option value="Canada">Canada</option>
<option value="Chile">Chile</option>
<option value="China">China</option>
<option value="Colombia">Colombia</option>
<option value="Costa Rica">Costa Rica</option>
<option value="Czech Rep.">Czech Rep.</option>
<option value="Denmark">Denmark</option>
<option value="Ecuador">Ecuador</option>
<option value="Egypt">Egypt</option>
<option value="Estonia">Estonia</option>
<option value="Ethiopia">Ethiopia</option>
<option value="Finland">Finland</option>
<option value="France">France</option>
<option value="Germany">Germany</option>
<option value="Ghana">Ghana</option>
<option value="Greece">Greece</option>
<option value="Haiti">Haiti</option>
<option value="Hungary">Hungary</option>
<option value="Iceland">Iceland</option>
<option value="India">India</option>
<option value="Indonesia">Indonesia</option>
<option value="Ireland">Ireland</option>
<option value="Israel">Israel</option>
<option value="Italy">Italy</option>
<option value="Jamaica">Jamaica</option>
<option value="Japan">Japan</option>
<option value="Jordan">Jordan</option>
<option value="Kazakhstan">Kazakhstan</option>
<option value="Kenya">Kenya</option>
<option value="Korea">Korea</option>
<option value="Malawi">Malawi</option>
<option value="Malaysia">Malaysia</option>
<option value="Mali">Mali</option>
<option value="Mauritius">Mauritius</option>
<option value="Mexico">Mexico</option>
<option value="Morocco">Morocco</option>
<option value="Mozambique">Mozambique</option>
<option value="Myanmar">Myanmar</option>
<option value="Namibia">Namibia</option>
<option value="Nepal">Nepal</option>
<option value="Netherlands">Netherlands</option>
<option value="New Zealand">New Zealand</option>
<option value="Nigeria">Nigeria</option>
<option value="Norway">Norway</option>
<option value="Pakistan">Pakistan</option>
<option value="Peru">Peru</option>
<option value="Philippines">Philippines</option>
<option value="Poland">Poland</option>
<option value="Portugal">Portugal</option>
<option value="Qatar">Qatar</option>
<option value="Russia">Russia</option>
<option value="Rwanda">Rwanda</option>
<option value="Saudi Arabia">Saudi Arabia</option>
<option value="Senegal">Senegal</option>
<option value="Sierra Leone">Sierra Leone</option>
<option value="Singapore">Singapore</option>
<option value="South Africa">South Africa</option>
<option value="Spain">Spain</option>
<option value="Sweden">Sweden</option>
<option value="Switzerland">Switzerland</option>
<option value="Tanzania">Tanzania</option>
<option value="Thailand">Thailand</option>
<option value="Tunisia">Tunisia</option>
<option value="Turkey">Turkey</option>
<option value="Uganda">Uganda</option>
<option value="Ukraine">Ukraine</option>
<option value="United Arab Emirates">United Arab Emirates</option>
<option value="United Kingdom">United Kingdom</option>
<option value="United States">United States</option>
<option value="Uruguay">Uruguay</option>
<option value="Venezuela">Venezuela</option>
<option value="Viet Nam">Viet Nam</option>
<option value="Yemen">Yemen</option>
<option value="Zambia">Zambia</option>
<option value="Zimbabwe">Zimbabwe</option>
 </select>
  <a>)</a>
              <br><br>          
           <button type="submit" class="button">See data</button>
	       </form><hr>
	       <br>
	       <%String thisCountry=(String)session.getAttribute("thisCountry");
	       String country2=(String)session.getAttribute("country2");
	       if(thisCountry!=null){
	       %>
	       <a style="font-size:45px"><%=thisCountry%></a>
	       <%if(country2!=null) {%>
	       <a>--compare with--</a> <a style="font-size:45px"><%=country2%></a>
	       <% } %>
	       <% } %>
	       <br><br>
	    <!-- ############################# -->
        <div class="portfolio">
<!-- ####################################################################################################### 2007 -->	       
	       <% 
	       if(thisCountry!=null){
	      /*   out.println("<br><a>>>>See the <button1 type=\"button\" onclick=\"window.location.href=\'comment.jsp\'\">Comments</button1> of: "
	       + thisCountry + ". <br><p style=\"font-size:30px;color:black\">All indexes of: " + thisCountry + "</p><br>");*/
	       %>
	     <div style="float:left">
	     
	     <%
	   int m = 0;
	   ArrayList<String> index = (ArrayList<String>)session.getAttribute("index");
	   ArrayList<String> indexName = (ArrayList<String>)session.getAttribute("indexName");
	   for(m=0;m<14;m++){
	       String i = index.get(m);//the short index name
           ArrayList<String> thisOne = (ArrayList<String>)session.getAttribute(i);
	      
	       if(!thisOne.isEmpty()){
	       
	       
	      %>
          <div id="<%="num"+m%>" style="width: 610px;height:300px;float:left"></div>
	     <script type="text/javascript">
      
       var myChart = echarts.init(document.getElementById("<%="num"+m%>"));
   
        var option = {
             <%if(country2==null){     
            out.println("color:['#093663'],");
            }%>
                 
            title: {
                text: '<%out.print(indexName.get(m));%>'
            },
            tooltip: {trigger: 'axis'},
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
            data:['','','','','<%=thisCountry%>',
            <%if(country2!=null){     
            out.println("'" + country2 +"'");
            }%>
            ]},

            grid: {
                left: '55px',
                bottom:'100px',
                top:'25%'
            },
            xAxis: {
                type : 'category',
                data: ['2007','2008','2009','2010','2011','2012','2013'],
            /*   axisLabel: {
                                           interval:0,
                                           rotate:40
                                        }*/
            },
            yAxis: {type : 'value',
                boundaryGap : [0, 0.01]},
            
            series: [
            {
                name: '<%=thisCountry%>',
                type: 'line',
                data: <%=session.getAttribute(index.get(m))%>,
                smooth:true
            },
            <%if(country2!=null){     
            out.println("{name: '" + country2 + "',");
            out.println("type: 'line',");
            out.println("data: " + session.getAttribute("s"+index.get(m))+",");
            out.println("smooth:true },");
            }%>          
            ],
         /*    dataZoom : [
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
	    ]*/
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
       
    </script>     
	     <%}}} %>
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