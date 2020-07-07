package object;

import java.util.ArrayList;

import dao.DataDAO;
import dao.impl.DataDAOImpl;

public class Data {
	
	public ArrayList<String> getCol(String tableName,String colName){  //method to get a column of data from DB
	
		ArrayList<String> col = new ArrayList<String>();
	    DataDAO dao = new DataDAOImpl();
//		System.out.println("running");
	try {
		    col = dao.readCol(tableName,colName);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return col;
	}
}
