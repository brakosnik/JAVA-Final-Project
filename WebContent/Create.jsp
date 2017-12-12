<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "final_project.DBBean" %>
  <jsp:useBean id="dBBeanId" scope="session" class="final_project.DBBean">
  </jsp:useBean>
  <jsp:setProperty name = "dBBeanId" property = "*" />
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Creating account...</title>
</head>
<body>

<% dBBeanId.initializeJdbc(); %>

<% if (dBBeanId.getConnection() == null) { %>
			Error: Login failed. Try again.
		<% }
   else {%>
			<%-- Run functions to add customer information to database --%>
			<jsp:forward page = "Contact.jsp" />
		<% } %>

</body>
</html>