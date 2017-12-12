<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import ="java.sql.*" %>
<jsp:useBean id = "currAcctBeanId" scope = "session" class = "accountPackage.Account2" >
</jsp:useBean>
<jsp:useBean id = "dBBeanId" scope = "session" class = "final_project.DBBean" >
</jsp:useBean>

<%
    try{
    	if(currAcctBeanId == null || !dBBeanId.isConnected()) {
    		throw new Exception("currAcctBeanId is invalid");
    	}
    	
 
    	currAcctBeanId.setEmail(request.getParameter("emailAddress"));
    	currAcctBeanId.setMemberPassword(request.getParameter("passWord"));
    	currAcctBeanId.setLevelName(request.getParameter("levelName"));
    	currAcctBeanId.setGenrePreference(request.getParameter("genrePreference"));
    	
    	currAcctBeanId.setCcType(request.getParameter("company"));
    	currAcctBeanId.setCreditCardNumber(request.getParameter("creditCardNumber"));
    	currAcctBeanId.setExpYear(Integer.parseInt(request.getParameter("expirationYear")));
    	currAcctBeanId.setExpMonth(Integer.parseInt(request.getParameter("expirationMonth")));
    	currAcctBeanId.setCreditCardCCV(Integer.parseInt(request.getParameter("ccv")));
    	
    	currAcctBeanId.setBillAddressLine1(request.getParameter("addressLine1"));
    	currAcctBeanId.setBillAddressLine2(request.getParameter("addressLine2"));
    	currAcctBeanId.setBillCity(request.getParameter("city"));
    	currAcctBeanId.setBillState(request.getParameter("state"));
    	currAcctBeanId.setBillZipCode(request.getParameter("zip"));

    	boolean success = currAcctBeanId.updateAccountInfo();
    	if(success) {
    		response.sendRedirect("http://localhost:8080/JAVA_Final_Project/Account.jsp");
    	} else {
    		out.println("updateaccountjsp");
    	}
   	}
	catch(Exception e){
		out.println("Something went wrong !! Please try again");
		e.printStackTrace();
   }
   %>