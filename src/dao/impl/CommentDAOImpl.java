package dao.impl;

import java.sql.PreparedStatement;
//import java.sql.ResultSet;
import java.sql.SQLException;

import dao.CommentDAO;
import database.DBConnect;

public class CommentDAOImpl implements CommentDAO{

	public void newComment(String username,String time,String content,String location){

		String sql = "insert into comments (username,time,content,location) values (?,?,?,?)";
        PreparedStatement pstmt = null ;   
        DBConnect dbc = null;   
   
        try{     
            dbc = new DBConnect() ;   
            pstmt = dbc.getConnection().prepareStatement(sql) ;
            pstmt.setString(1,username);
            pstmt.setString(2,time);
            pstmt.setString(3,content);
            pstmt.setString(4,location);
            pstmt.executeUpdate();
            
            pstmt.close() ;   
		
        }
        catch (SQLException e){   
            System.out.println(e.getMessage());   
        }
        finally{          
            dbc.close() ;   
        }   		
	}
	
	
}