package servlet;

import java.io.IOException;
import java.text.DateFormat;
//import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommentDAO;
import dao.impl.CommentDAOImpl;



public class CommentServlet extends HttpServlet{
	 public void doGet(HttpServletRequest req, HttpServletResponse res)
			    throws IOException, ServletException{
			    }
			
			 public void doPost(HttpServletRequest req, HttpServletResponse res)
			    throws IOException, ServletException{
				 System.out.println("connected to comment servlet");
				 Date now = new Date();
				 
				 HttpSession session=req.getSession(); 
				 
				 String username = (String)session.getAttribute("username");
				 DateFormat d0 = DateFormat.getTimeInstance(); 
				 DateFormat d1 = DateFormat.getDateInstance();//get date and time
				 String time1 = d0.format(now);
				 String time2 = d1.format(now);
				 String time = time2+" "+time1;
				 String content = req.getParameter("comment");
	             String location = (String)session.getAttribute("tableName");

				     CommentDAO dao = new CommentDAOImpl();  
				     try {
					      dao.newComment(username,time,content,location);
				     }catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();			   				
				     }
				     res.sendRedirect("./data_index.jsp");
				 }
				 

}
	
	
	
	
	

