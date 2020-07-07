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


public class RegisterServlet extends HttpServlet{
	 public void doGet(HttpServletRequest req, HttpServletResponse res)
			    throws IOException, ServletException{
			    }
			
			 public void doPost(HttpServletRequest req, HttpServletResponse res)
			    throws IOException, ServletException{
				// System.out.println("connected to register servlet");
				 User user = new User();
				 user.setEmail(req.getParameter("email"));
				 user.setUsername(req.getParameter("username"));
				 user.setPassword(req.getParameter("password"));
				 String Apassword = req.getParameter("Apassword");
				 
				 System.out.println("get password"+user.getPassword());
				 System.out.println("password again"+Apassword);
				 
				 if(Apassword.equals(user.getPassword())==false){ //add notice if passwords do not match.
					 System.out.println("not match");
					    req.setAttribute("msg0","The passwords entered do not match.");
				        req.getRequestDispatcher("user_register.jsp").forward(req, res);
				 }
				 
				 
				 else{
					 req.setAttribute("msg0",null);	 
				     UserDAO dao = new UserDAOImpl();  
				     int flag = 1;
				 
				     try {
					      flag = dao.checkUsername(user.getUsername());
				     }catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				      }
				    System.out.println(flag);
				     if(flag == 0){
					     req.setAttribute("msg0","The username was occupied.");
				         req.getRequestDispatcher("user_register.jsp").forward(req, res);
				     } 
				     else{
				    	 
				    	 try {
							dao.newUser(user);
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
				    	 
					     req.setAttribute("msg0",null);
					     req.setAttribute("msg1","You have successfully registered.");
				         req.getRequestDispatcher("user_register.jsp").forward(req, res);
					
				     }
				 }
				 
			 }

}
