package final_project;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class DBBean {
	private Connection connection = null;
	//The username and password need to be changed depending on what you called your DB user and pass are.
	private String username = "root";
	private String password = "admin";
	private String url = "jdbc:mysql://localhost/moviestoredb?useSSL=false";
	private String driver = "com.mysql.jdbc.Driver";
	private boolean connected = false;
	private String movieQueue[];
	
	public void initializeJdbc() {
		try {
			//System.out.println("Driver is " + driver);
			Class.forName(driver);
			
			// Connect to the sample database
			connection = DriverManager.getConnection(url, username, password);
			System.out.println("connection sucessesful");
			connected = true;
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
	}
		
	
	public Connection getConnection() {
		return connection;
	}
	
	public void setUsername(String newUsername) {
		username = newUsername;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setPassword(String newPassword) {
		password = newPassword;
	}
	
	public String getPassword() {
		return password;
	}
	
	public boolean isConnected(){
		return connected;
	}
	
}
