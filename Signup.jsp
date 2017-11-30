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
<nav class="navbar fixed-top navbar-expand-sm navbar-dark, bg-dark">
<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#nav-content" aria-controls="nav-content" aria-expanded="false" aria-label="Toggle navigation">
<span class="navbar-toggler-icon"></span>
</button>

<!-- Brand -->
<a class="navbar-brand" href="Home.jsp">Tony's Garage</a>

<!-- Links -->
<div class="collapse navbar-collapse" id="nav-content">   
<ul class="navbar-nav">
<li class="nav-item">
<a class="nav-link" href="Home.jsp">Home</a>
</li>
<li class="nav-item">
<a class="nav-link" href="Contact.jsp">Contact Us</a>
</li>
</ul>
</div>
</nav>

<h1>Sign Up</h1>

<p>Fill out the forms below to create an account. Already have an account? <a href="Login.jsp">Click here</a> to log in.</p>

<form>

<div class="input-group col-md-6">
 <span class="input-group-addon">Email</span>
 <input id="email" type="email" class="form-control" name="email" placeholder="email@address.com" required>
</div>
<br>
<div class="input-group col-md-6">
 <span class="input-group-addon">Password</span>
 <input id="password" type="password" class="form-control" name="password" placeholder="Use a secure password!" required>
</div>
<br>
<div class="form-group row">
 <div class="col-lg-3">
  <label for="firstname"><b>First Name</b></label>
  <input id="firstname" type="text" class="form-control" placeholder="John">
  <span class="help-block">Enter your first and last name.</span>
 </div>
 <div class="col-md-3">
  <label for="lastname"><b>Last Name</b></label>
  <input id="lastname" type="text" class="form-control" placeholder="Jeffrey">
 </div>
</div>

<div class="form-group">
 <div class="col-md-4">
  <label for="cardnumber"><b>Card Number</b></label>
  <input id="cardnumber" type="number" class="form-control" required>
  <span class="help-block">Enter the number without spaces or dashes.</span>
 </div>
 <div class="col-md-2">
  <label for="cardexpire"><b>Expiration Date</b></label>
  <input id="cardexpire" type="month" class="form-control" required>
 </div>
 <div class="col-md-1">
  <label for="cardcvv"><b>CVV</b></label>
  <input id="cardcvv" type="password" class="form-control" size="3" maxlength="3" pattern="[0-9]{3}" required>
 </div>
</div>

<div class="form-group">
 <div class="col-lg-6">
  <label for="sel1">Select Subscription:</label>
  <select class="form-control" id="sel1">
  <option>Cheap AF (1 Movie)</option>
  <option>The Usual (3 Movies)</option>
  <option>They Call Me Franklin Because I'm Spending Benjamins (5 Movies)</option>
  </select>
 </div>
</div> 

<input type = "submit" value = "Submit">
<input type = "reset">
</form>
</body>
</html>