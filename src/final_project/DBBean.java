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
	
	public String createSimpleQuery(String[] catResults, String[] keywordResults){
		String rs = "";
		StringBuilder requestString = new StringBuilder("select ");
		if(catResults != null && keywordResults != null){
			requestString.append("* from movie where " + catResults[0] + " like ");
			for(int i = 0; i < keywordResults.length; i++){
				if(i+1 != keywordResults.length){
					requestString.append("'" + keywordResults[i] + "%' OR " + catResults[0] + " like ");
				}
				else{
					requestString.append("'%" + keywordResults[i] + "%'");
				}		
			}
			requestString.append(";");
		}
		else if(keywordResults != null && catResults == null){
			requestString.append(" * from movie where movieTitle like");
			for(int i = 0; i < keywordResults.length; i++){
				if(i+1 != keywordResults.length){
					requestString.append("'" + keywordResults[i] + "%' OR movieTitle like ");
				}
				else{
					requestString.append("'%" + keywordResults[i] + "%';");
				}		
			}
		}
		else{
			requestString.append("* from movie;");
		}

		rs = requestString.toString();
		return rs;
	}
	public String createQuery(String[] keywordResults, String[] genreResults, String[] directorResults, String[] actorResults, String[] ratingResults){
		String rs = "";
		boolean addedToString = false;
		if((genreResults != null && genreResults.length > 0) || (keywordResults != null && keywordResults.length > 0)){
			StringBuilder requestString = new StringBuilder("select distinct * from movie where ");
			if(genreResults != null){
				addedToString = true;
				requestString.append("movieGenre like ");
				for(int i = 0; i < genreResults.length; i++)	{
					if(i+1 != genreResults.length){
						requestString.append("'" + genreResults[i] + "' OR movieGenre like ");
					}
					else{
						requestString.append("'" + genreResults[i] + "'");
					}
				}
			}
			
			if(keywordResults != null){
				if(addedToString){
					requestString.append("and movieTitle like ");
				}
				else{
					requestString.append(" movieTitle like ");
					addedToString = true;
				}
				for(int i = 0; i < keywordResults.length; i++){
						if(i+1 != keywordResults.length){
							requestString.append("'" + keywordResults[i] + "%' OR movieTitle like ");
						}
						else{
							requestString.append("'%" + keywordResults[i] + "%'");
						}
				}
			}
			
			if(directorResults != null){
				if(addedToString){
					requestString.append("and director like ");
				}
				else{
					requestString.append(" director like ");
					addedToString = true;
				}
				for(int i = 0; i < directorResults.length; i++){
						if(i+1 != directorResults.length){
							requestString.append("'" + directorResults[i] + "%' OR director like ");
						}
						else{
							requestString.append("'%" + directorResults[i] + "%'");
						}
				}
			}
			
			if(actorResults != null){
				if(addedToString){
					requestString.append("and actor1 like ");
				}
				else{
					requestString.append(" actor1 like ");
					addedToString = true;
				}
				for(int i = 0; i < actorResults.length; i++){
						if(i+1 != actorResults.length){
							requestString.append("'" + actorResults[i] + "%' OR actor1 like ");
						}
						else{
							requestString.append("'%" + actorResults[i] + "%'");
						}
				}
			}
			
			if(ratingResults != null){
				if(addedToString){
					requestString.append("and movieMPAARating like ");
				}
				else{
					requestString.append(" movieMPAARating like ");
					addedToString = true;
				}
				for(int i = 0; i < ratingResults.length; i++){
						if(i+1 != ratingResults.length){
							requestString.append("'" + ratingResults[i] + "%' OR movieMPAARating like ");
						}
						else{
							requestString.append("'%" + ratingResults[i] + "%'");
						}
				}
			}
						
			requestString.append(";");
			System.out.println(requestString.toString());
			rs = requestString.toString();
		}	
		else{
			rs = "select * from movie";
		}
		return rs;
	}
	
}
