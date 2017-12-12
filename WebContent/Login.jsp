<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
<jsp:useBean id = "currUsrBeanId" scope = "session" class = "currUsrBean.User" >
</jsp:useBean>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	<title>Log In</title>
</head>
<body>

	<div class = "text-center">
		<h3>Welcome to Tony's Garage! Please sign in below:</h3><br><br>
		<form action="Validate.jsp" method="post">
			<table align="center">
				<tr>
					<td>Username:</td>
					<td><input type="text" name="username"></td>
				
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="text" name="password"></td>
			
				</tr>
			</table><br>
			<input type="submit" value="Login" />
			<a class="link" href="Signup.jsp">Signup</a>
		
	 </form>
	</div>
</body>
</html>
