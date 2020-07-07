package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import dao.impl.UserDAOImpl;
import object.User;

public class ContactServlet extends HttpServlet{
	
	 public void doGet(HttpServletRequest req, HttpServletResponse res)
			    throws IOException, ServletException{
			    }
			
			 public void doPost(HttpServletRequest req, HttpServletResponse res)
			    throws IOException, ServletException{
				 
				 String name = req.getParameter("name");
				 String mail = req.getParameter("mail");
				 String content = req.getParameter("content");
				 
				 UserDAO dao = new UserDAOImpl();   
			     try {
					dao.contactMe(name, mail, content);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
                                             
			     req.setAttribute("msgC","You have successfully send the message.");
		         req.getRequestDispatcher("contact.jsp").forward(req, res);

			   //  res.sendRedirect("./contact.jsp"); 
			    }

				 
}
