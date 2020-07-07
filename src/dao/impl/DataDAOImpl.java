package dao.impl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import dao.DataDAO;
import database.DBConnect;


public class DataDAOImpl implements DataDAO{
	
	
	
	public ArrayList<String> readCol(String tablename,String col) throws Exception {
		ArrayList<String> arrCol = new ArrayList<String>();
		String sql = "select * from " + tablename;
		PreparedStatement pstmt = null ;   
	    DBConnect dbc = null;   
	   
	    try{     
	         dbc = new DBConnect() ;   
	         pstmt = dbc.getConnection().prepareStatement(sql);
	         pstmt.executeQuery();
	         ResultSet ret = pstmt.executeQuery();   
	         
	         while (ret.next()) {
	  
	                 arrCol.add(ret.getString(col));//table内容

	         }	         
	         pstmt.close() ;   
			
	        }
	        catch (SQLException e){   
	            System.out.println(e.getMessage());   
	        }
	        finally{          
	            dbc.close() ;   
	        }   
	//	System.out.println(arrCol);
        return arrCol;
		
	}
	
	public ArrayList<String> readCoun(String country,String tablename){
		ArrayList<String> arrCoun = new ArrayList<String>();
		String sql = "select * from "+ tablename + " where country=?";
		PreparedStatement pstmt = null ;   
	    DBConnect dbc = null;   
	   
	    try{     
	         dbc = new DBConnect() ;   
	         pstmt = dbc.getConnection().prepareStatement(sql);
	         pstmt.setString(1,country) ;
	         pstmt.executeQuery();
	         ResultSet ret = pstmt.executeQuery();   

	         
	         while (ret.next()) {
	        	 int y = 2007;
	             while(y<=2013){
	            	 String Y = String.valueOf(y);
	                 arrCoun.add(ret.getString(Y));
	                 //System.out.println(ret.getString(Y));
	                 y++;
	             }
	         }	         
	         pstmt.close() ;   
			
	        }
	        catch (SQLException e){   
	            System.out.println(e.getMessage());   
	        }
	        finally{          
	            dbc.close() ;   
	        }   
	    System.out.println("-------------" + country + "-------------");
	    System.out.println(arrCoun);
		return arrCoun;
	}
	
	
	public String getIndexName(String index){
		String indexName=null;
	//	System.out.println("**************"+index);
		if(index.equals("1_sis")){
			indexName = "Secure Internet Servers per million population";
		}
		if(index.equals("2_ixp")){
			indexName = "IXPs(if have IXPs=1; if not=0)";
		}
		if(index.equals("3_mb")){
			indexName = "Mobile broadband monthly subscription per GDPC";
		}
		if(index.equals("4_lr")){
			indexName = "Literacy rates";
		}
		if(index.equals("5_ser")){
			indexName = "Secondary enrolment rates(gross)";
		}
		if(index.equals("6_ter")){
			indexName = "Tertiary enrolment rates(gross) female/male";
		}
		if(index.equals("7_sle")){
			indexName = "School life expectancy female/male";
		}
		if(index.equals("8_pfi")){
			indexName = "Press freedom index";
		}
		if(index.equals("9_fop")){
			indexName = "Freedom of the press";
		}
		if(index.equals("10_pr")){
			indexName = "Political Rights";
		}
		if(index.equals("11_cr")){
			indexName = "Civil rights";
		}
		if(index.equals("12_gos")){
			indexName = "Government online services index";
		}
		if(index.equals("13_iu")){
			indexName = "Internet users per 100";
		}
		if(index.equals("14_ep")){
			indexName = "E-participation index";
		}
		
		return indexName;
	} 
	
	public ArrayList<String> handleCoun(ArrayList<String> countries){
	       int n = 0;
	        String content;
	     		while(n<countries.size()){
				content = "\""+countries.get(n)+"\"";
			//	System.out.print(content);
				countries.set(n, content);
				n++;
			}
		
		return countries;
	}
	

	

}
