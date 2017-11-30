package accountPackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
//import java.sql.Connection;
//import java.sql.DatabaseMetaData;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
// package...
// Matt Weiss

public class Account2 {
	// general
	private String userName;
	//private String middleInitial;
	private String passWord;
	private String email;
	private String phoneNumber;
	
	// credit card on file
	private String firstName;
	//private String middleInitial;
	private String lastName;
	private String company;
	private String creditCardNumber;
	private String expirationDate;
	
	// billing address
	private String address;
	private String city;
	private String state;
	private String zip;
	private Connection connection = null;
	
	public Account2() {
		initialzeJdbc();
	}
	public int UpdateAccount() {
		try {
	        if(connection == null || connection.equals(null) || connection.isClosed()){
	        	throw new Exception("connection is not proper!");
	        }
	        
	        
		} catch(Exception e) {
	    	e.printStackTrace();
	    }
		
		return 0;
	}
	public void changePassword() {
		try {
			//java.lang.Integer hi = new java.lang.Integer(1);
			String p1 = new String("123456new2");
			String p2 = new String(p1.substring(0,10));
			System.out.println((p1 == p2));
			int hi = 4;
			CallableStatement callableStatement = connection.prepareCall("{call change_pw_proc(?, ?, ?, ?, ?}");
			
			//callableStatement.setInt(1, -2);
			
			callableStatement.setInt(1, hi);
			callableStatement.setString(2, "JQDude");
			callableStatement.setString(3, "123456new");
			callableStatement.setString(4, "123456new2");
			callableStatement.setString(5, p1);
			
			callableStatement.registerOutParameter(1, java.sql.Types.INTEGER);
			// ResultSet rs = callableStatement.executeQuery();
			//int doodidy = callableStatement.executeUpdate();
			boolean success = callableStatement.execute();
			
			if(callableStatement.getInt(1) == 1) {
				System.out.println("Success changing password!");
			}
			else {
				System.out.println("Failure changing password.");
			}
		} catch(Exception e) {
			
			e.printStackTrace();
			//System.out.println(e.getCause().toString());
			//System.out.println(e.getClass().toString());
			System.out.println(e.getMessage());
			System.out.println(e.toString());
			System.out.println(new java.util.Date().toString());
		}

	}
	public void initialzeJdbc() {
        String jdbc_url="jdbc:mysql://localhost/moviestoredb";
        String userName="admin";
        String password="password";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(jdbc_url+"?useSSL=false" , userName, password);
		} catch(Exception e) {
	    	e.printStackTrace();
	    }
		
//		try {
//			
//		} catch(Exception e) {
//	    	e.printStackTrace();
//	    }
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
//	public String getMiddleInitial() {
//		return middleInitial;
//	}
//	public void setMiddleInitial(String middleInitial) {
//		this.middleInitial = middleInitial;
//	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getCreditCardNumber() {
		return creditCardNumber;
	}
	public void setCreditCardNumber(String creditCardNumber) {
		this.creditCardNumber = creditCardNumber;
	}
	public String getExpirationDate() {
		return expirationDate;
	}
	public void setExpirationDate(String expirationDate) {
		this.expirationDate = expirationDate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
}
