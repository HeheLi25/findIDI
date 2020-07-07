package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DBConnect {  
	    private final String DBDRIVER = "com.mysql.jdbc.Driver" ;   
	    private final String DBURL = "jdbc:mysql://127.0.0.1:3306/proj?useSSL=false" ;   
	    private final String DBUSER = "root" ;   
	    private final String DBPASSWORD = "111111" ;   
	    private Connection conn = null ;   
	  
	    public DBConnect()   {   
	        try{   
	            Class.forName(DBDRIVER) ;   
	            this.conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;  
	         //   System.out.println("Database connected."); 
	        }catch (Exception e){ 
	        	System.out.println("Fail connection:"+e.getMessage());  
	        	}   
	    }   
	  
	
	    public Connection getConnection(){   
	        return this.conn ;   
	    }   
	  
	  
	    public void close(){   
	        try{   
	            this.conn.close() ; 
	       //     System.out.println("Connection closed.");
	        }catch (Exception e){ }          
	    }

}  

