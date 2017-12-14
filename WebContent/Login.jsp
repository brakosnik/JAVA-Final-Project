<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
<jsp:useBean id = "currUsrBeanId" scope = "session" class = "final_project.User" >
</jsp:useBean>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	<title>Log In</title>
</head>
<body>
	<nav class="navbar fixed-top navbar-expand-sm navbar-dark, bg-dark">
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#nav-content" aria-controls="nav-content" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<!-- Brand -->
		<a class="navbar-brand" href="Home.jsp">Logo</a>
		
		<!-- Links -->
		<div class="collapse navbar-collapse" id="nav-content">   
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link" href="Home.jsp">Home</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="Search.jsp">Browse Movies</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="Account.jsp">My Account</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="Contact.jsp">Contact Us</a>
				</li>
			</ul>
		</div>
	</nav>
	<div class = "text-center">
		<br><h3>Welcome to Tony's Garage! Please sign in below:</h3><br>
		<form action="Validate.jsp" method="post">
			<table align="center">
				<tr><td align="left">Username</td></tr>
				<tr><td align="left">
					<input type="text" name="username" class="form-control" required>
				</td></tr>
				<tr><td align="left">Password</td></tr>
				<tr><td align="left">
					<input type="password" name="password" class="form-control">
				</td></tr>
			</table>
		<%	if (currUsrBeanId.getValidLogin() == false) {
				currUsrBeanId.setValidLogin(true);%>
				<h6 style="color:red;" align="center">Invalid username and/or password</h6>
		<%	}
			else {%>
				<br>
		<%	}%>
			<input type="submit" value="Login" />
			<a class="link" href="Signup.jsp">Signup</a>
		</form>
	</div>
</body>
</html>
