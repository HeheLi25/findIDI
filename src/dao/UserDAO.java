package dao;

import object.User;

public interface UserDAO {
	public int queryByUsername(User user) throws Exception;

	public User getUserInfo(String username, String password) throws Exception;

	public int checkUsername(String username) throws Exception;

	public void newUser(User user)throws Exception;

	public void deleteUser(String username) throws Exception;
	
	public void contactMe(String name, String mail, String content) throws Exception;


}
