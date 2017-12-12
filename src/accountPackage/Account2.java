package accountPackage;

import java.sql.*;


import final_project.DBBean;

public class Account2 {

		private int memberID;
		private String levelName;
		private String userName; // will be email address
		private String emailAddress;
		private String billAddressLine1;
		private String billAddressLine2;
		private String billCity;
		private String billState;
		private String billZipCode;
		private String memberPassword;
		private String genrePreference;
		private int creditCardCCV;
		private String creditCardNumber;
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
	public String getGenrePreference(){
		return this.genrePreference;
	}
	public void setGenrePreference(String genre){
		this.genrePreference = genre;
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
				levelName = rs.getString("levelName");
				userName = rs.getString("emailAddress");
				billAddressLine1 = rs.getString("billAddressLine1");
				billAddressLine2 = rs.getString("billAddressLine2");
				billCity = rs.getString("billCity");
				billState = rs.getString("billState");
				billZipCode = rs.getString("billZipCode");
				memberPassword = rs.getString("memberPassword");
				creditCardCCV = (rs.getInt("creditCardCCV"));
				creditCardNumber = rs.getString("creditCardNumber");
				expYear = rs.getInt("expYear");
				expMonth = rs.getInt("expMonth");
				ccType = rs.getString("ccType");
				genrePreference = rs.getString("genrePreference");

				
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
					"UPDATE member SET emailAddress=?, "
					+ "billAddressLine1 = ?, billAddressLine2=?, "
					+ "billCity= ?, billState=?, "
					+ "billZipCode= ?, memberPassword=?, "
					+ "creditCardCCV= ?, creditCardNumber=?, "
					+ "expYear= ?, expMonth= ?, ccType = ?, genrePreference =? WHERE memberID= ?; ");

			ps.setString(1, this.emailAddress);
			ps.setString(2, this.billAddressLine1);
			ps.setString(3, this.billAddressLine2);
			ps.setString(4, this.billCity);
			ps.setString(5, this.billState);
			ps.setString(6, this.billZipCode);
			ps.setString(7, this.memberPassword);
			ps.setInt(8, this.creditCardCCV);
			ps.setString(9, this.creditCardNumber);
			ps.setInt(10, this.expYear);
			ps.setInt(11, this.expMonth);
			ps.setString(12, this.ccType);
			ps.setString(13, this.genrePreference);
			ps.setInt(14, this.memberID);
			
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
	
}