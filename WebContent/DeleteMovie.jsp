<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import ="java.sql.*" %>
<jsp:useBean id = "currUsrBeanId" scope = "session" class = "currUsrBean.User" >
</jsp:useBean>
<%
    try{
    
        
    	if( currUsrBeanId.deleteMovie(Integer.parseInt(request.getParameter("movId"))))
    		request.getRequestDispatcher(request.getParameter("viewid")).forward(request, response);
    	else{
    		request.getRequestDispatcher(request.getParameter("viewid")).forward(request, response);
    	}
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again");       
   } 
   %>