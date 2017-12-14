package accountPackage;

import java.sql.*;


import final_project.DBBean;

public class Account2 {

		private int memberID;
		private String levelName;
		private String userName; // will be email address
		private String firstName;
		private String lastName;
		private String emailAddress;
		private String billAddressLine1;
		private String billAddressLine2;
		private String billCity;
		private String billState;
		private String billZipCode;
		private String phoneNumber;
		private String memberPassword;
		private String genrePreference;
		private int creditCardCCV;
		private String creditCardNumber;
		private String cardHolderFirstName;
		private String cardHolderLastName;
		private int expYear;
		private int expMonth;
		private String ccType;
		
		public String getUserName() {
			return userName;
		}
		public void setUserName(String userName) {
			this.userName = userName;
		}
		public String getBillAddressLine1() {
			return billAddressLine1;
		}
		public void setBillAddressLine1(String billAddressLine1) {
			this.billAddressLine1 = billAddressLine1;
		}
		public String getBillAddressLine2() {
			return billAddressLine2;
		}
		public void setBillAddressLine2(String billAddressLine2) {
			this.billAddressLine2 = billAddressLine2;
		}
		public String getBillCity() {
			return billCity;
		}
		public void setBillCity(String billCity) {
			this.billCity = billCity;
		}
		public String getBillState() {
			return billState;
		}
		public void setBillState(String billState) {
			this.billState = billState;
		}
		public String getBillZipCode() {
			return billZipCode;
		}
		public void setBillZipCode(String billZipCode) {
			this.billZipCode = billZipCode;
		}
		public String getMemberPassword() {
			return memberPassword;
		}
		public void setMemberPassword(String memberPassword) {
			this.memberPassword = memberPassword;
		}
		public int getCreditCardCCV() {
			return creditCardCCV;
		}
		public void setCreditCardCCV(int creditCardCCV) {
			this.creditCardCCV = creditCardCCV;
		}
		public String getCreditCardNumber() {
			return creditCardNumber;
		}
		public void setCreditCardNumber(String creditCardNumber) {
			this.creditCardNumber = creditCardNumber;
		}
		public int getExpYear() {
			return expYear;
		}
		public void setExpYear(int expYear) {
			this.expYear = expYear;
		}
		public int getExpMonth() {
			return expMonth;
		}
		public void setExpMonth(int expMonth) {
			this.expMonth = expMonth;
		}
		public String getCcType() {
			return ccType;
		}
		public void setCcType(String ccType) {
			this.ccType = ccType;
		}

	public String getEmail() {
			return emailAddress;
		}
		public void setEmail(String email) {
			this.emailAddress = email;
		}
		public void setAccountID(int id) {
			this.memberID = id;
		}
		public int getAccountId(){
			return this.memberID;
		}
	public String getLevelName() {
			return levelName;
		}
		public void setLevelName(String levelName) {
			this.levelName = levelName;
		}

	public boolean getAccountInfo() {
		try {
			DBBean newBean = new DBBean();
			newBean.initializeJdbc();

			Statement st = newBean.getConnection().createStatement();
			ResultSet rs = st.executeQuery("select * from member where memberID =" + memberID);
		
			if(rs == null ) throw new Exception("Did not getAccountInfo successfully!"); // || !rs.next()

			if(rs.next()) {
				memberID = rs.getInt("memberID");
				emailAddress = rs.getString("emailAddress");
				memberPassword = rs.getString("memberPassword");
				firstName = rs.getString("firstName");
				lastName = rs.getString("lastName");
				phoneNumber = rs.getString("phoneNumber");
				genrePreference = rs.getString("genrePreference");
				
				
				creditCardNumber = rs.getString("creditCardNumber");
				creditCardCCV = (rs.getInt("creditCardCCV"));
				expYear = rs.getInt("expYear");
				expMonth = rs.getInt("expMonth");
				ccType = rs.getString("ccType");
				cardHolderFirstName = rs.getString("cardHolderFirstName");
				cardHolderLastName = rs.getString("cardHolderLastName");
				
				billAddressLine1 = rs.getString("billAddressLine1");
				billAddressLine2 = rs.getString("billAddressLine2");
				billCity = rs.getString("billCity");
				billState = rs.getString("billState");
				billZipCode = rs.getString("billZipCode");
				
				levelName = rs.getString("levelName");
				
			}
			rs.close();
			newBean.getConnection().close();
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
		return true;
	}
	
	public boolean updateAccountInfo() {
		try {
			DBBean newBean = new DBBean();
			newBean.initializeJdbc();
			PreparedStatement ps = newBean.getConnection().prepareStatement(
					"UPDATE member SET emailAddress = ?, "
					+ "billAddressLine1 = ?, billAddressLine2 = ?, "
					+ "billCity = ?, billState = ?, "
					+ "billZipCode = ?, memberPassword = ?, "
					+ "creditCardCCV = ?, creditCardNumber = ?, "
					+ "expYear = ?, expMonth = ?, ccType = ?, "
					+ "cardHolderFirstName = ?, cardHolderLastName = ?, "
					+ "firstName = ?, lastName = ?, phoneNumber = ?, "
					+ "levelName = ?, genrePreference = ? WHERE memberID = ?; ");

			ps.setString(1, emailAddress);
			ps.setString(7, memberPassword);
			
			ps.setString(2, billAddressLine1);
			ps.setString(3, billAddressLine2);
			ps.setString(4, billCity);
			ps.setString(5, billState);
			ps.setString(6, billZipCode);
			
			ps.setInt(8, creditCardCCV);
			ps.setString(9, creditCardNumber);
			ps.setInt(10, expYear);
			ps.setInt(11, expMonth);
			ps.setString(12, ccType);
			ps.setString(13, cardHolderFirstName);
			ps.setString(14, cardHolderLastName);
			
			ps.setString(15, firstName);
			ps.setString(16, lastName);
			ps.setString(17, phoneNumber);
			
			ps.setString(18, levelName);
			ps.setString(19, genrePreference);
			ps.setInt(20, memberID);
			ps.executeUpdate();
			ps.close();
			newBean.getConnection().close();
	
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
		return true;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getCardHolderFirstName() {
		return cardHolderFirstName;
	}
	public void setCardHolderFirstName(String cardHolderFirstName) {
		this.cardHolderFirstName = cardHolderFirstName;
	}
	public String getCardHolderLastName() {
		return cardHolderLastName;
	}
	public void setCardHolderLastName(String cardHolderLastName) {
		this.cardHolderLastName = cardHolderLastName;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getGenrePreference() {
		return genrePreference;
	}
	public void setGenrePreference(String genrePreference) {
		this.genrePreference = genrePreference;
	}
	
}