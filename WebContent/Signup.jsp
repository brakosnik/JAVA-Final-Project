<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
<title>Sign Up</title>
</head>
<body>
	<form action = "Logout.jsp" method = post>
		<nav class="navbar fixed-top navbar-expand-sm navbar-dark, bg-dark">
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#nav-content" aria-controls="nav-content" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<!-- Brand -->
			<a class="navbar-brand" href="Home.jsp"><img src ="logo.png"></a>
			
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
	</form>

<div class="container">
 <div class="row-justify-center">
  <div class="offset-md-5">
   <h1>Sign Up</h1>
  </div>
  <div class="offset-md-2">
   <p>Fill out the forms below in order to create an account. Already have an account? <a href="Login.jsp"><b>Click here</b></a> to log in.</p>
  </div> 
 </div>
</div>
<br>
<div class="container">
<div class="row-justify-center">
<form method="post" action="Create.jsp">

<div class="input-group col-md-6 offset-md-3">
 <span class="input-group-addon">Email</span>
 <input id="email" type="email" class="form-control" name="emailAddress" placeholder="email@address.com" autofocus required>
</div>
<br>
<div class="input-group col-md-6 offset-md-3">
 <span class="input-group-addon">Password</span>
 <input id="password" type="password" class="form-control" name="memberPassword" placeholder="Use a secure password!" required>
</div>
<br>

 <div class="form-group row">
  <div class="col-md-3 offset-md-2">
   <label for="firstname"><b>First Name</b></label>
   <input id="firstname" type="text" class="form-control" name="firstName" placeholder="John" required>
   <span class="help-block">Enter your first and last name.</span>
  </div>
  <div class="col-md-3">
   <label for="lastname"><b>Last Name</b></label>
   <input id="lastname" type="text" class="form-control" name="lastName" placeholder="Jeffrey" required>
  </div>
  <div class="col-md-2">
   <label for="phonenumber"><b>Phone Number</b></label>
   <input id="phonenumber" type="tel" class="form-control" name="phoneNumber" maxlength="15" required>
  </div>
 </div>
<br>

<div class="form-group row">
 <div class="col-md-3 offset-md-1">
  <label for="cardnumber"><b>Card Number</b></label>
  <input id="cardnumber" type="number" name="creditCardNumber" class="form-control" maxlength="16" required>
  <span class="help-block">Enter the number without spaces or dashes.</span>
 </div>
 <div class="col-md-1">
  <label for="cardcvv"><b>CCV</b></label>
  <input id="cardcvv" type="password" name="creditCardCCV" class="form-control" size="3" maxlength="3" pattern="[0-9]{3}" required>
 </div>
 <div class="col-md-1 offset-md-1">
  <label for="cardexpireyear"><b>Expiration</b></label>
  <input id="cardexpireyear" type="number" name="expYear" class="form-control" required>
  <span class="help-block">Ex: yyyy</span>	
 </div>
 <div class="col-md-1">
  <label for="cardexpiremonth"><b>Date</b></label>
  <input id="cardexpiremonth" type="number" name="expMonth" class="form-control" required>
  <span class="help-block">Ex: mm</span>
 </div>
 <div class="col-md-3">
  <label for="cardtype"><b>Card Type</b></label>
  <input id="cardtype" type="text" name="ccType" class="form-control" placeholder="Discover, Visa, etc." required>
  <span class="help-block">Enter card company name.</span>
 </div>
</div>
<div class="form-group row">
 <div class="col-md-4 offset-md-2">
  <label for="cardfirstname"><b>Cardholder First Name</b></label>
  <input id="cardfirstname" type="text" name="cardHolderFirstName" class="form-control" required>
 </div>
 <div class="col-md-4">
  <label for="cardlastname"><b>Cardholder Last Name</b></label>
  <input id="cardlastname" type="text" name="cardHolderLastName" class="form-control" required>
 </div>
</div>
<br>
<div class="form-group row">
  <div class="col-md-7 offset-md-1">
   <label for="address1"><b>Address Line 1</b></label>
   <input id="address1" type="text" name="billAddressLine1" class="form-control" required>
  </div>
 
  <div class="col-md-3">
   <label for="city"><b>City</b></label>
   <input id="city" type="text" name="billCity" class="form-control" placeholder="Elmhurst" required>
  </div>
 
  <div class="col-md-7 offset-md-1">
   <label for="address2"><b>Address Line 2</b></label>
   <input id="address2" type="text" name="billAddressLine2" class="form-control" placeholder="Optional">
  </div>
  
  <div class="col-md-1">
   <label for="state"><b>State</b></label>
   <input id="state" type="text" name="billState" class="form-control" maxlength="2" placeholder="IL" required>
  </div>
  
  <div class="col-sm-2">
   <label for="zipcode"><b>ZIP</b></label>
   <input id="zipcode" type="number" name="billZipCode" class="form-control" pattern="\d(5)" size="5" maxlength="5" placeholder="60126" required>
  </div>
</div>

<div class="form-group">
 <div class="col-sm-6 offset-sm-3">
  <label class="control-label" for="sel1">Select Subscription:</label>
  <select class="form-control" id="sel1" name="levelName">
  <option value="silver">Silver ($3.95)</option>
  <option value="gold">Gold ($6.95)</option>
  <option value="platinum">Platinum ($9.95)</option>
  </select>
 </div>
</div>

<div class="row">
 <div class="col offset-md-5">
  <input type = "submit" value = "Submit">
  <input type = "reset">
 </div>
</div>

</form>
</div>
</div>
</body>
</html>