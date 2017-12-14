<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "final_project.DBBean" %>
  <jsp:useBean id="dBBeanId" scope="session" class="final_project.DBBean">
  </jsp:useBean>
  <jsp:setProperty name = "dBBeanId" property = "*" />
  <jsp:useBean id = "newAcctBeanId" scope = "application" class = "final_project.Account2" >
  </jsp:useBean>
  <jsp:setProperty name = "newAcctBeanId" property = "*" />
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Creating account...</title>
</head>
<body>

<% dBBeanId.initializeJdbc(); %>

<% try{
	if(dBBeanId.getConnection() == null) {
		throw new Exception("Could not connect to database. Try again.");
	}
	
	newAcctBeanId.setEmail(request.getParameter("emailAddress"));
	newAcctBeanId.setMemberPassword(request.getParameter("memberPassword"));
	newAcctBeanId.setLevelName(request.getParameter("levelName"));
	newAcctBeanId.setPhoneNumber(request.getParameter("phoneNumber"));
	
	newAcctBeanId.setCcType(request.getParameter("ccType"));
	newAcctBeanId.setCreditCardNumber(request.getParameter("creditCardNumber"));
	newAcctBeanId.setExpYear(Integer.parseInt(request.getParameter("expYear")));
	newAcctBeanId.setExpMonth(Integer.parseInt(request.getParameter("expMonth")));
	newAcctBeanId.setCreditCardCCV(Integer.parseInt(request.getParameter("creditCardCCV")));
	
	newAcctBeanId.setBillAddressLine1(request.getParameter("billAddressLine1"));
	newAcctBeanId.setBillAddressLine2(request.getParameter("billAddressLine2"));
	newAcctBeanId.setBillCity(request.getParameter("billCity"));
	newAcctBeanId.setBillState(request.getParameter("billState"));
	newAcctBeanId.setBillZipCode(request.getParameter("billZipCode"));
	
	newAcctBeanId.setFirstName(request.getParameter("firstName"));
	newAcctBeanId.setLastName(request.getParameter("lastName"));
	newAcctBeanId.setCardHolderFirstName(request.getParameter("cardHolderFirstName"));
	newAcctBeanId.setCardHolderLastName(request.getParameter("cardHolderLastName"));

	boolean success = newAcctBeanId.createNewAccount();

	
	if(success) {
		response.sendRedirect("http://localhost:8080/JAVA_Final_Project/Login.jsp");
	} else {
		out.println("Check Create.jsp");
	}
	}
catch(Exception e){
	out.println("Something went wrong !! Please try again");
	e.printStackTrace();
}

%>

</body>
</html>