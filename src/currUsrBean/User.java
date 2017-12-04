package currUsrBean;
import java.sql.*;
import final_project.DBBean;

public class User {
	private String username;
	private String password;
	private boolean loggedIn;
	private String movieQueue[];
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isLoggedIn() {
		return loggedIn;
	}
	public void setLoggedIn(boolean loggedIn) {
		this.loggedIn = loggedIn;
	}
	public String[] getMovieQueue() {
		return movieQueue;
	}
	public void setMovieQueue(String movieQueue[]) {
		this.movieQueue = movieQueue;
	}
	
	 public boolean Login(){
		try {
			DBBean newBean = new DBBean();
			newBean.initializeJdbc();
			// Connect to the sample database
			
	        PreparedStatement pst = newBean.getConnection().prepareStatement("Select emailAddress, memberPassword from member"
	        		+ "		 where emailAddress=? and memberPassword=?");
	        pst.setString(1, username);
	        pst.setString(2, password);
	        ResultSet rs = pst.executeQuery();                        
	        if(rs.next())  
	        	loggedIn = true;
			pst.close();
			
			newBean.getConnection().close();
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}	
		return loggedIn;	
	}
	
}
