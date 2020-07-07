package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DataDAO;
import dao.impl.DataDAOImpl;	

public class IndexServlet extends HttpServlet{
	
		 public void doGet(HttpServletRequest req, HttpServletResponse res)
		    throws IOException, ServletException{
		 }
		
		 public void doPost(HttpServletRequest req, HttpServletResponse res)
		    throws IOException, ServletException{
			 
			 String tableName = req.getParameter("index");
			 

			 ArrayList<String> country = new ArrayList<String>();
			 ArrayList<String> country0 = new ArrayList<String>();
			 ArrayList<String> y2007 = new ArrayList<String>();
			 ArrayList<String> y2008 = new ArrayList<String>();
			 ArrayList<String> y2009 = new ArrayList<String>();
			 ArrayList<String> y2010 = new ArrayList<String>();
			 ArrayList<String> y2011 = new ArrayList<String>();
			 ArrayList<String> y2012 = new ArrayList<String>();
			 ArrayList<String> y2013 = new ArrayList<String>();
			 
			 DataDAO dao = new DataDAOImpl();   
		     try {
		    	  country = dao.readCol(tableName,"country");
		    	  country0 = dao.readCol(tableName,"country");
		    	  y2007 = dao.readCol(tableName,"2007");
		    	  y2008 = dao.readCol(tableName,"2008");
		    	  y2009 = dao.readCol(tableName,"2009");
		    	  y2010 = dao.readCol(tableName,"2010");
		    	  y2011 = dao.readCol(tableName,"2011");
		    	  y2012 = dao.readCol(tableName,"2012");
		    	  y2013 = dao.readCol(tableName,"2013");
		    	  
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
			}

        int n = 0;
        String content;
		
		while(n<country.size()){
			content = "\""+country.get(n)+"\"";
		//	System.out.print(content);
			country.set(n, content);
			n++;
		}
	/*	System.out.println(country0);
        System.out.println(country);
        System.out.println(y2007);
        System.out.println(y2008);
        System.out.println(y2009);
        System.out.println(y2010);
        System.out.println(y2011);
        System.out.println(y2012);
        System.out.println(y2013);
    */    
        String thisIndex = dao.getIndexName(tableName);
        System.out.println(thisIndex);
        HttpSession session=req.getSession(); 
        session.setAttribute("thisIndex", thisIndex);
        session.setAttribute("country", country);
        session.setAttribute("country0", country0);
        session.setAttribute("2007", y2007); 
        session.setAttribute("2008", y2008);
        session.setAttribute("2009", y2009);
        session.setAttribute("2010", y2010);
        session.setAttribute("2011", y2011);
        session.setAttribute("2012", y2012);
        session.setAttribute("2013", y2013);
        session.setAttribute("tableName", tableName);
        
        res.sendRedirect("./data_index.jsp");
		 }
	}
		 

