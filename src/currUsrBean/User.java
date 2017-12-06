package currUsrBean;
import java.sql.*;
import java.util.Vector;

import final_project.DBBean;

public class User {
	private String username;
	private int memID;
	private String password;
	private boolean loggedIn;
	private Vector<String> movieQueue = new Vector<String>();
	
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
	public Vector<String> getMovieQueue() {
		return movieQueue;
	}
	public void setMovieQueue(Vector<String> movieQueue) {
		this.movieQueue = movieQueue;
	}
	public int getMemID() {
		return memID;
	}
	public void setMemID(int memID) {
		this.memID = memID;
	}
	 public boolean Login(){
		try {

			DBBean newBean = new DBBean();
			newBean.initializeJdbc();
			// Connect to the sample database
			
	        PreparedStatement pst = newBean.getConnection().prepareStatement("Select emailAddress, memberID, memberPassword from member"
	        		+ "		 where emailAddress=? and memberPassword=?");
	        pst.setString(1, username);
	        pst.setString(2, password);
	        ResultSet rs = pst.executeQuery();                        
	        if(rs.next())  {
	        	loggedIn = true;
	        	memID = rs.getInt("memberID");
	        	
	        }
			pst.close();
			
			Statement st = newBean.getConnection().createStatement();
			ResultSet rst = st.executeQuery("select movieID from queue where memberID =" + memID);
			while(rst.next()){
				movieQueue.addElement(Integer.toString(rst.getInt("movieID")));
			}	
			newBean.getConnection().close();
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}	
		return loggedIn;	
	}

	
}
