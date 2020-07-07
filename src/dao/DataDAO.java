 package dao;

import java.util.ArrayList;

//import object.Data;

public interface DataDAO {

	
	public ArrayList<String> readCol(String tablename,String col) throws Exception;
	public String getIndexName(String index);
	public ArrayList<String> readCoun(String country,String tablename) throws Exception;
	public ArrayList<String> handleCoun(ArrayList<String> countries);
}
