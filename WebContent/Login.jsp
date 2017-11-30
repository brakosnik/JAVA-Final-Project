<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
		<form action="Redirect" method="get">
			<table align="center">
				<tr>
					<td>Username:</td>
					<td><input type="text" name="username"></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="password" name="password"></td>
				</tr>
			</table><br>
			<input type="submit" value="Login">
			<a class="link" href="Home.jsp">Cancel</a>
		</form>
	</div>
</body>
</html>
