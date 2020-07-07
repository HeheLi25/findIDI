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


public class CountryServlet extends HttpServlet{
	
	 public void doGet(HttpServletRequest req, HttpServletResponse res)
			    throws IOException, ServletException{
			 }
			
			 public void doPost(HttpServletRequest req, HttpServletResponse res)
			    throws IOException, ServletException{
				 
				 String test = req.getParameter("country2");
				 String country2 = null;
         
						 String country = req.getParameter("country");
						 if(country.equals(">>Choose an country<<")){
							 if(!test.equals(">>Choose an country<<")){
								 country = null;
							 }
							 else{
							 res.sendRedirect("./data_country.jsp"); 
							 return;}
						 }
						 if(!test.equals(">>Choose an country<<")){
							 country2 = test;
							// System.out.println(country2);
						 }
						 System.out.println(country2);
						 DataDAO dao = new DataDAOImpl(); 
						 ArrayList<String> index1 = new ArrayList<String>();
						 ArrayList<String> index2 = new ArrayList<String>();
						 ArrayList<String> index3 = new ArrayList<String>();
						 ArrayList<String> index4 = new ArrayList<String>();
						 ArrayList<String> index5 = new ArrayList<String>();
						 ArrayList<String> index6 = new ArrayList<String>();
						 ArrayList<String> index7 = new ArrayList<String>();
						 ArrayList<String> index8 = new ArrayList<String>();
						 ArrayList<String> index9 = new ArrayList<String>();
						 ArrayList<String> index10 = new ArrayList<String>();
						 ArrayList<String> index11 = new ArrayList<String>();
						 ArrayList<String> index12 = new ArrayList<String>();
						 ArrayList<String> index13 = new ArrayList<String>();
						 ArrayList<String> index14 = new ArrayList<String>();
						 
						 ArrayList<String> index1s = new ArrayList<String>();
						 ArrayList<String> index2s = new ArrayList<String>();
						 ArrayList<String> index3s = new ArrayList<String>();
						 ArrayList<String> index4s = new ArrayList<String>();
						 ArrayList<String> index5s = new ArrayList<String>();
						 ArrayList<String> index6s = new ArrayList<String>();
						 ArrayList<String> index7s = new ArrayList<String>();
						 ArrayList<String> index8s = new ArrayList<String>();
						 ArrayList<String> index9s = new ArrayList<String>();
						 ArrayList<String> index10s = new ArrayList<String>();
						 ArrayList<String> index11s = new ArrayList<String>();
						 ArrayList<String> index12s = new ArrayList<String>();
						 ArrayList<String> index13s = new ArrayList<String>();
						 ArrayList<String> index14s = new ArrayList<String>();
						 
						 try {
							if(country!=null){ 
							index1 = dao.readCoun(country, "1_sis");
							index2 = dao.readCoun(country, "2_ixp");
							index3 = dao.readCoun(country, "3_mb");
							index4 = dao.readCoun(country, "4_lr");
							index5 = dao.readCoun(country, "5_ser");
							index6 = dao.readCoun(country, "6_ter");
							index7 = dao.readCoun(country, "7_sle");
							index8 = dao.readCoun(country, "8_pfi");
							index9 = dao.readCoun(country, "9_fop");
							index10 = dao.readCoun(country, "10_pr");
							index11 = dao.readCoun(country, "11_cr");
							index12 = dao.readCoun(country, "12_gos");
							index13 = dao.readCoun(country, "13_iu");
							index14 = dao.readCoun(country, "14_ep");
							}
							if(country2!=null){
							index1s = dao.readCoun(country2, "1_sis");
							index2s = dao.readCoun(country2, "2_ixp");
							index3s = dao.readCoun(country2, "3_mb");
							index4s = dao.readCoun(country2, "4_lr");
							index5s = dao.readCoun(country2, "5_ser");
							index6s = dao.readCoun(country2, "6_ter");
							index7s = dao.readCoun(country2, "7_sle");
							index8s = dao.readCoun(country2, "8_pfi");
							index9s = dao.readCoun(country2, "9_fop");
							index10s = dao.readCoun(country2, "10_pr");
							index11s = dao.readCoun(country2, "11_cr");
							index12s = dao.readCoun(country2, "12_gos");
							index13s = dao.readCoun(country2, "13_iu");
							index14s = dao.readCoun(country2, "14_ep");
							
							}
							
							
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}

						// if(index6.isEmpty()){System.out.println("yes");}
						 
						 HttpSession session=req.getSession(); 
						    if(country!=null){
					        session.setAttribute("1_sis", index1);
					        session.setAttribute("2_ixp", index2);
					        session.setAttribute("3_mb", index3);
					        session.setAttribute("4_lr", index4); 
					        session.setAttribute("5_ser", index5);
					        session.setAttribute("6_ter", index6);
					        session.setAttribute("7_sle", index7);
					        session.setAttribute("8_pfi", index8);
					        session.setAttribute("9_fop", index9);
					        session.setAttribute("10_pr", index10);
					        session.setAttribute("11_cr", index11);
					        session.setAttribute("12_gos",index12);
					        session.setAttribute("13_iu", index13);
					        session.setAttribute("14_ep", index14);	
						    }
					    	if(country2!=null){    
					        session.setAttribute("s1_sis", index1s);
					        session.setAttribute("s2_ixp", index2s);
					        session.setAttribute("s3_mb", index3s);
					        session.setAttribute("s4_lr", index4s); 
					        session.setAttribute("s5_ser", index5s);
					        session.setAttribute("s6_ter", index6s);
					        session.setAttribute("s7_sle", index7s);
					        session.setAttribute("s8_pfi", index8s);
					        session.setAttribute("s9_fop", index9s);
					        session.setAttribute("s10_pr", index10s);
					        session.setAttribute("s11_cr", index11s);
					        session.setAttribute("s12_gos",index12s);
					        session.setAttribute("s13_iu", index13s);
					        session.setAttribute("s14_ep", index14s);	
					        session.setAttribute("country2", country2);
					    	}
					    	else{
					    		session.setAttribute("country2", null);
					    	}
					    	 if(country!=null){
					        session.setAttribute("thisCountry", country);
					    	 }
						 ArrayList<String> index = new ArrayList<String>();
						 index.add("1_sis");index.add("2_ixp");index.add("3_mb");index.add("4_lr");
						 index.add("5_ser");index.add("6_ter");index.add("7_sle");index.add("8_pfi");
						 index.add("9_fop");index.add("10_pr");index.add("11_cr");index.add("12_gos");
						 index.add("13_iu");index.add("14_ep");
						 int m = 0;
						 ArrayList<String> indexName = new ArrayList<String>(); 
						 for(m=0;m<14;m++){
							 indexName.add(dao.getIndexName(index.get(m)));		 
						 }
						 //System.out.println(index);
						 //System.out.println(indexName);
						 session.setAttribute("index", index);
						 session.setAttribute("indexName", indexName);
						// System.out.println(country2);
						 res.sendRedirect("./data_country.jsp"); 
               
					      }



}
