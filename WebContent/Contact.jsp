<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="contactPackage.Contact" %>
<jsp:useBean id="contactId" scope="session" class="contactPackage.Contact" />
<jsp:setProperty name="contactId" property="*" />
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Tony's Garage - Contact Us</title>
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
	<div class="text-center">
	<%	if (contactId.getContactName() != null && contactId.getContactName().length() > 0) {%>
			<br><h3>Thank You, <%=contactId.getContactName()%></h3><br>
			<h6>Your submission regarding "<%=contactId.getContactSubject()%>" has been received.</h6>
			<h6>We will respond to the email you indicated at "<%=contactId.getContactEmail()%>".</h6><br>
			<textarea rows="5" cols="35" placeholder="<%=contactId.getContactMessage()%>"></textarea><br>
			<a class="link" href="Home.jsp">Return</a>
		<%	contactId.setContactName("");
		}
		else {%>
			<br><h3>Contact Us</h3><br>
			<form method="post" action="Contact.jsp">
				<table align="center">
					<tr><td align="left">Your Name (required)</td></tr>
					<tr><td align="left">
						<input name="contactName" type="text" placeholder="John Doe" class="form-control" required><br>
					</td></tr>
					<tr><td align="left">Your Email (required)</td></tr>
					<tr><td align="left">
						<input name="contactEmail" type="email" placeholder="johndoe@email.com" class="form-control" required><br>
					</td></tr>
					<tr><td align="left">Subject</td></tr>
					<tr><td align="left">
						<input name="contactSubject" type="text" list="contactSubjects" placeholder="Summary" class="form-control"><br>
						<datalist id="contactSubjects">
							<option>Home Page</option>
							<option>Search Page</option>
							<option>Account</option>
							<option>Login</option>
							<option>Other</option>
						</datalist>
					</td></tr>
					<tr><td align="left">Message</td></tr>
					<tr><td align="left">
						<textarea name="contactMessage" rows="5" cols="35" placeholder="Type your concern here."></textarea><br>
					</td></tr>
				</table><br>
				<input type="submit" name="Submit" value="Submit">
				<a class="link" href="Home.jsp">Cancel</a>
			</form>
		<%	} %>
	</div>
</body>
</html>
