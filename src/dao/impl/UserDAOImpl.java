package dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.UserDAO;
import database.DBConnect;
import object.User;

public class UserDAOImpl implements UserDAO  {

	public int queryByUsername(User user) throws Exception { //method of matching password while logging in
		// TODO Auto-generated method stub
		int flag = 0;
		String sql = "select * from userinfo where username=?";
        PreparedStatement pstmt = null ;   
        DBConnect dbc = null;   
   
        try{     
            dbc = new DBConnect() ;   
            pstmt = dbc.getConnection().prepareStatement(sql) ; 
            pstmt.setString(1,user.getUsername()) ; 
            
            
            ResultSet rs = pstmt.executeQuery();
            
           // System.out.println(user.getUsername());
            
            while(rs.next()){  
               
                if(rs.getString("password").equals(user.getPassword())){
                	flag = 1;
                } 
               
            }   
            rs.close() ; 
            pstmt.close() ;   
        }catch (SQLException e){   
            System.out.println(e.getMessage());   
        }finally{   
           
            dbc.close() ;   
        }   
		return flag;
	}
	
	public User getUserInfo(String username,String password)throws Exception{  //method of storing the information of current user
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		
		String sql = "select * from userinfo where username=?";
        PreparedStatement pstmt = null ;   
        DBConnect dbc = null;   
        try{   
            
            dbc = new DBConnect() ;   
            pstmt = dbc.getConnection().prepareStatement(sql) ; 
            pstmt.setString(1,user.getUsername()) ; 
            
            
            ResultSet rs = pstmt.executeQuery();
            
           // System.out.println(user.getUsername());
            
            while(rs.next()){  
               
                user.setEmail(rs.getString("email"));
            //    System.out.println(user.getEmail());
            }   
            rs.close() ; 
            pstmt.close() ;   
        }
        catch (SQLException e){   
            System.out.println(e.getMessage());   
        }
        finally{   
           
            dbc.close() ;   
        }   
		return user;
	}
	
	public int checkUsername(String username){   //whether the username was occupied
		int flag = 1; 
		
		String sql = "select * from userinfo where username=?";
        PreparedStatement pstmt = null ;   
        DBConnect dbc = null;   
   
        try{     
            dbc = new DBConnect() ;   
            pstmt = dbc.getConnection().prepareStatement(sql) ;
            pstmt.setString(1,username) ;
            ResultSet rs = pstmt.executeQuery();

                if(rs.next()){
                	flag = 0;
                }      
                
            rs.close() ; 
            pstmt.close() ;   
		
        }
        catch (SQLException e){   
            System.out.println(e.getMessage());   
        }
        finally{          
            dbc.close() ;   
        }   
		
		return flag;
	}
	
	public void newUser(User user){   //Register for new users
		
		String sql = "insert into userinfo (email,username,password) values (?,?,?)";
        PreparedStatement pstmt = null ;   
        DBConnect dbc = null;   
   
        try{     
            dbc = new DBConnect() ;   
            pstmt = dbc.getConnection().prepareStatement(sql) ;
            pstmt.setString(1,user.getEmail()) ;
            pstmt.setString(2,user.getUsername()) ;
            pstmt.setString(3,user.getPassword()) ;
            
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
	
	
	public void deleteUser(String username){
		
		String sql = "delete from userinfo where username=?";
		PreparedStatement pstmt = null ;   
	    DBConnect dbc = null;   
	   
	    try{     
	         dbc = new DBConnect() ;   
	         pstmt = dbc.getConnection().prepareStatement(sql) ;
	         pstmt.setString(1,username) ;
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
	
	public void contactMe(String name, String mail, String content){
		
		String sql = "insert into contact (name,mail,content) values (?,?,?)";
        PreparedStatement pstmt = null ;   
        DBConnect dbc = null;   
   
        try{     
            dbc = new DBConnect() ;   
            pstmt = dbc.getConnection().prepareStatement(sql) ;
            pstmt.setString(1,name) ;
            pstmt.setString(2,mail) ;
            pstmt.setString(3,content) ;
            
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
