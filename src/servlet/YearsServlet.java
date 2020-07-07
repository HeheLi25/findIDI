package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class YearsServlet extends HttpServlet{
	
		 public void doGet(HttpServletRequest req, HttpServletResponse res)
		    throws IOException, ServletException{
		 }
		
		 public void doPost(HttpServletRequest req, HttpServletResponse res)
		    throws IOException, ServletException{
			
			 HttpSession session=req.getSession();   
	         session.setAttribute("years", req.getParameter("years"));
			 
	         res.sendRedirect("./years.jsp");
		 }
	}
		 

