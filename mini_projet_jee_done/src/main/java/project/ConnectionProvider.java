package project;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
	public static Connection getConn() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/miniprojetjee","root","");
			return conn;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
			
		}
	}
}
