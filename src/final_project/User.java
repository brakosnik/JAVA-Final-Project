package final_project;
import java.sql.*;
import java.util.*;
import final_project.DBBean;

public class User {
	private String username;
	private int memID;
	private String password;
	private boolean loggedIn;
	private Vector<String> movieQueue = new Vector<String>();
	private boolean validLogin = true;

	
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
	public void setValidLogin(boolean validLogin) {
		this.validLogin = validLogin;
	}
	public boolean getValidLogin() {
		return validLogin;
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
			ResultSet rst = st.executeQuery("select movieID from queue where memberID =" + memID + " order by queueSequence");
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
	public boolean addMovie(int movieID){
		DBBean newBean = new DBBean();
		newBean.initializeJdbc();
		if(!movieQueue.contains(Integer.toString(movieID))){
			movieQueue.add(Integer.toString(movieID));
	
		try {
			Statement st = newBean.getConnection().createStatement();
			ResultSet  rst = st.executeQuery("select * from movie where movieID = " + movieID);
	
			String title = "";
			if(rst.next()){
				title  = rst.getString("movieTitle");
			}	
			PreparedStatement pst = newBean.getConnection().prepareStatement("insert into queue (memberID, movieID, queueSequence, movieTitle) values(?, ?, ?, ?)");
			pst.setInt(1, memID);
			pst.setInt(2, movieID);
			pst.setInt(3, movieQueue.size());
			pst.setString(4, title);
			pst.executeUpdate();
			newBean.getConnection().commit();
			pst.close();
			rst = st.executeQuery("select * from queue where movieID =" + movieID);
			if(rst.next())
				return true;
			rst.close();
			newBean.getConnection().close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		return false;
	}
	public boolean deleteMovie(int movieID){
		DBBean newBean = new DBBean();
		newBean.initializeJdbc();
		if(movieQueue.contains(Integer.toString(movieID))){
			movieQueue.remove(Integer.toString(movieID));
	
		try {
			
			PreparedStatement pst = newBean.getConnection().prepareStatement("delete from queue where movieID = ?");
			pst.setInt(1, movieID);
			pst.executeUpdate();
			newBean.getConnection().commit();
			pst.close();
			Statement st = newBean.getConnection().createStatement();
			ResultSet rs = st.executeQuery("select * from queue where movieID = " + movieID);
			if(!rs.next())
				return true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		return false;
	}

}
