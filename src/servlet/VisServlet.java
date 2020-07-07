package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class VisServlet extends HttpServlet{
	 public void doGet(HttpServletRequest req, HttpServletResponse res)
			    throws IOException, ServletException{
			 }
			
			 public void doPost(HttpServletRequest req, HttpServletResponse res)
			    throws IOException, ServletException{
				 String type = null;
						 type = req.getParameter("type");
				 String title = req.getParameter("title");
				 String color = req.getParameter("color");
				 String color2 = req.getParameter("color2");
				 
				 String rawWord = req.getParameter("word");
				 String rawData = req.getParameter("data");
				 
				 String low = req.getParameter("low");
				 String high = req.getParameter("high");
				 
				 String width = req.getParameter("width");
				 String height = req.getParameter("height");
				 
				 String prec = req.getParameter("prec");
				 
				 String rawLegend = req.getParameter("legend");
				 
				 ArrayList<String> data = new ArrayList<String>();
				 ArrayList<String> word = new ArrayList<String>();
				 ArrayList<String> legend = new ArrayList<String>();
				 
				 


				 
				 
				 if(type.equals("Bar/Line")){
					 
					 
					 
					 String l [] = rawLegend.split(",");
				     for(int i=0;i<l.length;i++){
				    	 legend.add("'"+l[i]+"'");}
				     
				     String dataLine []= rawData.split(";");
				     for(int i=0;i<dataLine.length;i++){
				    	 dataLine[i] = dataLine[i].replaceAll("\r|\n", "");
				    	// System.out.print(dataLine[i]);
					 }
				     String a [] = rawWord.split(",");
				     for(int i=0;i<a.length;i++){
				    	 word.add("'"+a[i]+"'");}
				     
				     
				     
				     
				     req.setAttribute("data0", dataLine);
					 
					 
				 }else{ 
					 
				     String a [] = rawWord.split(",");
				     for(int i=0;i<a.length;i++){
				    	 word.add(a[i]);
					 }
				// System.out.println(word);


				     String b [] = rawData.split(",");
				     for(int i=0;i<b.length;i++){
					     data.add(b[i]);
					 }
				 
				 }
				 
				 

				 System.out.println(word);
				// System.out.println(data);
				 
				 req.setAttribute("color", color);
				 req.setAttribute("color2", color2);
				 
				 req.setAttribute("title", title);
				 req.setAttribute("word", word);
				 req.setAttribute("data", data);
				 
				 req.setAttribute("legend",legend);
				 

				 
				 
				 
				 req.setAttribute("rawWord",req.getParameter("word"));
				 req.setAttribute("rawData",req.getParameter("data"));
				 req.setAttribute("rawLegend",req.getParameter("legend"));
				
				 req.setAttribute("low", low);
				 req.setAttribute("high",high);
				 
				 req.setAttribute("width", width);
				 req.setAttribute("height",height);
				 
				 req.setAttribute("prec",prec);
				// System.out.println(type+"!!");
				 
				 if(type.equals("WordMap")){
				     req.getRequestDispatcher("vis_word.jsp").forward(req, res);
				 }
				 else if(type.equals("WorldMap")){
					 req.getRequestDispatcher("vis_world.jsp").forward(req, res);
				 }
				 else if(type.equals("PieChart")){
					 req.getRequestDispatcher("vis_pie.jsp").forward(req, res);
				 }
				 else if(type.equals("Bar/Line")){
					 req.getRequestDispatcher("vis_barline.jsp").forward(req, res); 
				 }
				 
			 }

}
