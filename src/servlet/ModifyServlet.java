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


public class ModifyServlet extends HttpServlet{
	
	 public void doGet(HttpServletRequest req, HttpServletResponse res)
			    throws IOException, ServletException{
			    }
	 public void doPost(HttpServletRequest req, HttpServletResponse res)
			    throws IOException, ServletException{
				// System.out.println("connected to register servlet");
				 User user = new User();
				 HttpSession session=req.getSession();  
				 
				 System.out.println("username:"+(String)req.getSession().getAttribute("username"));
				 
				 user.setUsername((String)session.getAttribute("username"));
				 user.setEmail(req.getParameter("email"));
				 user.setPassword(req.getParameter("Npassword"));
				 String Opassword = req.getParameter("Opassword");
				 
				 System.out.println("new password"+user.getPassword());
				 System.out.println("old password"+Opassword);
				 
				 if(Opassword.equals((String)session.getAttribute("password"))==false){ //add notice if passwords do not match.
					    System.out.println("not match");
					    req.setAttribute("msg2","You have entered the old password wrong.");
				        req.getRequestDispatcher("user_modify.jsp").forward(req, res);
				 }
				 
				 else{
					 UserDAO dao = new UserDAOImpl(); 
					 try {
						dao.deleteUser(user.getUsername());  //Delete the user information
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					 
					 try {
						dao.newUser(user);      //add the new user information
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					 
			         session.setAttribute("password", user.getPassword());
			         session.setAttribute("email", user.getEmail()); 
					 
					req.setAttribute("msg2",null);
					req.setAttribute("msg3","You have successfully changed your information");
				    req.getRequestDispatcher("user_modify.jsp").forward(req, res);
					 
					 
				 }
}
	
	
	

}
