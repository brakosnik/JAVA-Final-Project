<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account</title>
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

<h3>My Account</h3>
<% Account2 myAccount = new Account2(); %>
<% myAccount.changePassword(); %>
<% Account2 myAccount = new Account2(); %>
<h3>My Account</h3>

	<form method = "get" action = "">
	<br><br>Account Information<br />
	UserName
	<input type = "text" name = "userName" /><br />
	Password
	<input type = "text" name = "passWord" /><br />
	Email
	<input type = "text" name = "email" /><br />
	PhoneNumber
	<input type = "text" name = "phoneNumber" /><br />
	
	<br>Credit Card</br>
	firstName
	<input type = "text" name = "firstName" /><br />
	lastName
	<input type = "text" name = "lastName" /><br />
	Company
	<input type = "text" name = "company" /><br />
	CreditCardNumber
	<input type = "text" name = "creditCardNumber" /><br />
	ExpirationDate
	<input type = "text" name = "expirationDate" /><br />
	
	
	
	<br>Billing Address</br>
	Address
	<input type = "text" name = "address" /><br />
	City
	<input type = "text" name = "city" /><br />
	State
	<input type = "text" name = "state" /><br />
	Zip
	<input type = "text" name = "zip" /><br />
	</form>

<input type = "submit" name = "Submit" value = "Save Changes"/>
</body>
</html>
