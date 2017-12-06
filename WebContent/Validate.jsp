<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import ="java.sql.*" %>
<jsp:useBean id = "currUsrBeanId" scope = "session" class = "currUsrBean.User" >
</jsp:useBean>
<%
    try{
        currUsrBeanId.setUsername(request.getParameter("username"));   
        currUsrBeanId.setPassword(request.getParameter("password"));   
    	if(currUsrBeanId.Login())
    		 response.sendRedirect("http://localhost:8080/JAVA_Final_Project/Home.jsp");
    	else{
    		System.out.println("Login failed");
    		response.sendRedirect("http://localhost:8080/JAVA_Final_Project/Login.jsp");
    		
    	}
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again");       
   } 
   %>