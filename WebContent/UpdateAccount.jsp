<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import ="java.sql.*" %>
<jsp:useBean id = "currAcctBeanId" scope = "session" class = "final_project.Account2" >
</jsp:useBean>
<jsp:useBean id = "dBBeanId" scope = "session" class = "final_project.DBBean" >
</jsp:useBean>

<%
    try{
    	if(currAcctBeanId == null || !dBBeanId.isConnected()) {
    		throw new Exception("currAcctBeanId is invalid");
    	}
    	
  
    	currAcctBeanId.setEmail(request.getParameter("emailAddress"));
    	currAcctBeanId.setMemberPassword(request.getParameter("memberPassword"));
    	currAcctBeanId.setFirstName(request.getParameter("firstName"));
    	currAcctBeanId.setLastName(request.getParameter("lastName"));
    	currAcctBeanId.setPhoneNumber(request.getParameter("phoneNumber"));
    	currAcctBeanId.setGenrePreference(request.getParameter("genrePreference"));
    	
    	currAcctBeanId.setCreditCardNumber(request.getParameter("creditCardNumber"));
    	currAcctBeanId.setCreditCardCCV(Integer.parseInt(request.getParameter("creditCardCCV")));
    	currAcctBeanId.setExpYear(Integer.parseInt(request.getParameter("expYear")));
    	currAcctBeanId.setExpMonth(Integer.parseInt(request.getParameter("expMonth")));
    	currAcctBeanId.setCcType(request.getParameter("ccType"));
    	currAcctBeanId.setCardHolderFirstName(request.getParameter("cardHolderFirstName"));
    	currAcctBeanId.setCardHolderLastName(request.getParameter("cardHolderLastName"));
    	
    	currAcctBeanId.setBillAddressLine1(request.getParameter("billAddressLine1"));
    	currAcctBeanId.setBillAddressLine2(request.getParameter("billAddressLine2"));
    	currAcctBeanId.setBillCity(request.getParameter("billCity"));
    	currAcctBeanId.setBillState(request.getParameter("billState"));
    	currAcctBeanId.setBillZipCode(request.getParameter("billZipCode"));

    	currAcctBeanId.setLevelName(request.getParameter("levelName"));
    	boolean success = currAcctBeanId.updateAccountInfo();
    	if(success) {
    		response.sendRedirect("http://localhost:8080/JAVA_Final_Project/Account.jsp");
    	} else {
        	out.println(currAcctBeanId.getEmail() + "<br>");
        	out.println(currAcctBeanId.getMemberPassword() + "<br>");
        	out.println(currAcctBeanId.getFirstName() + "<br>");
        	out.println(currAcctBeanId.getLastName() + "<br>");
        	out.println(currAcctBeanId.getPhoneNumber() + "<br>");
        	out.println(currAcctBeanId.getGenrePreference() + "<br>");
        	
        	out.println(currAcctBeanId.getCreditCardNumber() + "<br>");
        	out.println(currAcctBeanId.getCreditCardCCV() + "<br>");
        	out.println(currAcctBeanId.getExpYear() + "<br>");
        	out.println(currAcctBeanId.getExpMonth() + "<br>");
        	out.println(currAcctBeanId.getCcType() + "<br>");
        	out.println(currAcctBeanId.getCardHolderFirstName() + "<br>");
        	out.println(currAcctBeanId.getCardHolderLastName() + "<br>");
        	
        	out.println(currAcctBeanId.getBillAddressLine1() + "<br>");
        	out.println(currAcctBeanId.getBillAddressLine2() + "<br>");
        	out.println(currAcctBeanId.getBillCity() + "<br>");
        	out.println(currAcctBeanId.getBillState() + "<br>");
        	out.println(currAcctBeanId.getBillZipCode() + "<br>");
        	
        	out.println(currAcctBeanId.getLevelName() + "<br>");
    	}
   	}
	catch(Exception e){
		out.println("Something went wrong !! Please try again");
		e.printStackTrace();
   }
   %>