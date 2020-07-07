package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import dao.impl.UserDAOImpl;
import object.User;	

public class LoginServlet extends HttpServlet{


		 public void doPost(HttpServletRequest req, HttpServletResponse res)
		    throws IOException, ServletException{
			 User user = new User();
			 user.setUsername(req.getParameter("username"));
			 user.setPassword(req.getParameter("password"));			 
			 //System.out.println("get input:"+user.getUsername()+user.getPassword());		 
			 UserDAO dao = new UserDAOImpl();   
		     int flag = 0;
		     try {
					flag = dao.queryByUsername(user);
				} catch (Exception e) {
					e.printStackTrace();
			} 
			 if(flag == 1){   
				 HttpSession session=req.getSession();   
		         session.setAttribute("username", user.getUsername());
		         session.setAttribute("password", user.getPassword()); 
				 User user0 = new User();
				 try {
					user0 = dao.getUserInfo(user.getUsername(),user.getPassword());
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				 session.setAttribute("email", user0.getEmail());
		         
		         res.sendRedirect("./home.jsp");                                               
		     }else {   
		        req.setAttribute("msg","You have input an incorrect username or password.");
		        req.getRequestDispatcher("user_login.jsp").forward(req, res);
		     // res.sendRedirect("./user_login.jsp");
		      }
		 }
	}
		 

