<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
  	    <script src="bootstrap/js/bootstrap.min.js"></script>
<title>Account</title>
</head>
<body>
<%@ page import ="java.sql.*" %>

<jsp:useBean id = "dBBeanId" scope = "session" class = "final_project.DBBean" >
</jsp:useBean>
<jsp:useBean id = "currUsrBeanId" scope = "session" class = "currUsrBean.User" >
</jsp:useBean>
<jsp:useBean id = "currAcctBeanId" scope = "session" class = "accountPackage.Account2" >
</jsp:useBean>

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
	<%
	if(!dBBeanId.isConnected()){
		dBBeanId.initializeJdbc();
	}
	%>

	<% if (dBBeanId.getConnection() == null) { %>
		Error: Login failed. Try again.
	<% } %>
	
	<% if(currUsrBeanId == null || !currUsrBeanId.isLoggedIn()) { 
		response.sendRedirect("http://localhost:8080/JAVA_Final_Project/Login.jsp"); 
		%>
		
	<% } %>
	
	<% if(currAcctBeanId == null || currAcctBeanId.equals(null)) { %>
		AccountBeanNotLoaded
		<%-- AccountBeanNotLoaded --%>
	<% } else {
		currAcctBeanId.setAccountID(currUsrBeanId.getMemID());
	//	currAcctBeanId.setUserName(currUsrBeanId.getUsername());
		currAcctBeanId.setEmail(currUsrBeanId.getUsername());

		currAcctBeanId.setMemberPassword(currUsrBeanId.getPassword());
		currAcctBeanId.getAccountInfo();
	%>
		<%-- AccountBean Loaded --%> 
	<% } %>
		
<h3>My Account</h3>

<div class="container">
	<div class="row-justify-center">
		<form method="post" action="UpdateAccount.jsp">
		
		<div class="input-group col-md-6 offset-md-3">
		 <span class="input-group-addon">Email</span>
		 <input id="emailAddress" type="email" class="form-control" name="emailAddress" value = "<%= currAcctBeanId.getEmail() %>"  autofocus required>
		</div>
		<br>
		<div class="input-group col-md-6 offset-md-3">
		 <span class="input-group-addon">Password</span>
		 <input id="memberPassword" type="password" class="form-control" name="memberPassword" value = "<%=currAcctBeanId.getMemberPassword() %>" min="6" required>
		</div>
		<br>
		
		 <div class="form-group row">
			  <div class="col-md-2 offset-md-2">
			   <label for="firstName"><b>First Name</b></label>
			   <input id="firstName" type="text" class="form-control" name="firstName" value = "<%=currAcctBeanId.getFirstName() %>" required>
			   <span class="help-block">Enter your first and last name.</span>
			  </div>
			  <div class="col-md-2">
			   <label for="lastName"><b>Last Name</b></label>
			   <input id="lastName" type="text" class="form-control" name="lastName" value = "<%=currAcctBeanId.getLastName() %>" required>
			  </div>
			  <div class="col-md-2">
			   <label for="phoneNumber"><b>Phone Number</b></label>
			   <input id="phoneNumber" type="text" class="form-control" name="phoneNumber" maxlength="15" value = "<%= currAcctBeanId.getPhoneNumber() %>" required> 
			  </div> 
			  	<div class="col-md-2">
			   <label for="genrePreference"><b>Genre Preference</b></label>
			   <input id="genrePreference" type="text" class="form-control" name="genrePreference" value = "<%=currAcctBeanId.getGenrePreference() %>" required>
			  </div>
		 </div>
		<br>
		

		
		<div class="form-group row">
		 <div class="col-md-4 offset-md-1"> 
		  <label for="creditCardNumber"><b>Card Number</b></label>
		  <input id="creditCardNumber" type="number" name="creditCardNumber" class="form-control" value = "<%= currAcctBeanId.getCreditCardNumber() %>" maxlength="16" size="16" pattern="[0-9]{16}" required>
		  <span class="help-block">Enter the number without spaces or dashes.</span>
		 </div>
		 <div class="col-md-2 col-md-auto" >
		  <label for="creditCardCCV"><b>CCV</b></label>
		  <input id="creditCardCCV" type="number" name="creditCardCCV" class="form-control" value = "<%= currAcctBeanId.getCreditCardCCV() %>" maxlength="5" size="5" pattern="[0-9]{5}" required>
		 </div>
		 <div class="col-md-2 offset-md-1">
		  <label for="expYear"><b>Expiration</b></label>
		  <input id="expYear" type="number" name="expYear" class="form-control" value = "<%= currAcctBeanId.getExpYear() %>" maxlength = "4" size="4" pattern="[0-9]{4}" min=1900 required>
		  <span class="help-block">Ex: yyyy</span>	
		 </div>
		 <div class="col-md-2"> <%-- col-md-2 --%>
		  <label for="expMonth"><b>Date</b></label> 
		  <input id="expMonth" type="number" name="expMonth" class="form-control" value = "<%= currAcctBeanId.getExpMonth() %>" maxlength="2" pattern="[0-9]{2}" min=1 max = 12 required>
		  <span class="help-block">Ex: mm</span>
		 </div>
		</div>
		<div class="form-group row">
		 <div class="col-md-4 offset-md-1">
		  <label for="cardfirstname"><b>Cardholder First Name</b></label>
		  <input id="cardfirstname" type="text" name="cardHolderFirstName" class="form-control" value = "<%= currAcctBeanId.getCardHolderFirstName() %>"required>
		 </div>
		 <div class="col-md-4">
		  <label for="cardlastname"><b>Cardholder Last Name</b></label>
		  <input id="cardlastname" type="text" name="cardHolderLastName" class="form-control" value = "<%= currAcctBeanId.getCardHolderLastName() %>" required>
		 </div>
		  <div class="col-md-3">
		  <label for="cardtype"><b>Card Type</b></label>
		  <input id="cardtype" type="text" name="ccType" class="form-control" value = "<%= currAcctBeanId.getCcType() %>" required>
		  <span class="help-block">Enter card company name.</span>
		 </div>
		</div>
		<br>
		<div class="form-group row">
		  <div class="col-md-7 offset-md-1">
		   <label for="billAddressLine1"><b>Address Line 1</b></label>
		   <input id="billAddressLine1" type="text" name="billAddressLine1" class="form-control" value = "<%= currAcctBeanId.getBillAddressLine1() %>" required>
		  </div>
		 
		  <div class="col-md-4">
		   <label for="billCity"><b>City</b></label>
		   <input id="billCity" type="text" name="billCity" class="form-control" name = "city" value = "<%= currAcctBeanId.getBillCity() %>" required>
		  </div>
		 
		  <div class="col-md-7 offset-md-1">
		   <label for="billAddressLine2"><b>Address Line 2</b></label>
		   <input id="billAddressLine2" type="text" name="billAddressLine2" class="form-control" value = "<%= currAcctBeanId.getBillAddressLine2() %>">
		  </div>
		  
		  <div class="col-md-2">
		   <label for="billState"><b>State</b></label>
		   <input id="billState" type="text" name="billState" class="form-control" value = "<%= currAcctBeanId.getBillState() %>" maxlength="2" size="2" pattern="[A-Z]{2}" required>
		  </div>
		  
		  <div class="col-sm-2">
		   <label for="billZipCode"><b>ZIP</b></label>
		   <input id="billZipCode" type="number" name="billZipCode" class="form-control" value = "<%= currAcctBeanId.getBillZipCode() %>" pattern="\d(5)" size="5" maxlength="5" required>
		  </div>
		</div>
		
<div class="form-group">
<div class="col-sm-6 offset-sm-3">
  <label class="control-label" for="levelName">Subscription:</label>
  <select class="form-control" id="levelName" name="levelName" >
  <%if(currAcctBeanId.getLevelName().equals("silver")) { %>
  <option value="silver" selected="selected">Silver ($3.95)</option>
  <option value="gold">Gold ($6.95)</option>
  <option value="platinum">Platinum ($9.95)</option>
  <% } else if(currAcctBeanId.getLevelName().equals("gold") ) { %>
  <option value="silver">Silver ($3.95)</option>
  <option value="gold" selected="selected">Gold ($6.95)</option>
  <option value="platinum">Platinum ($9.95)</option>
  <% } else if(currAcctBeanId.getLevelName().equals("platinum")) { %>
  <option value="silver" >Silver ($3.95)</option>
  <option value="gold">Gold ($6.95)</option>
  <option value="platinum" selected="selected">Platinum ($9.95)</option>
  <% } %>
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

<div class = "text-left">
		<h5>Your Queue</h5>
	</div>

 		<div class="container">
    		<div class="row text-center">
    	<% 
    		Statement statement = dBBeanId.getConnection().createStatement();
    		if(currUsrBeanId.getMovieQueue().isEmpty()){
    		%>	<a class="link" href="Search.jsp">Browse movies to add to your queue</a>
    			
    		<% }
    		else{
			for(int i = 0; i < currUsrBeanId.getMovieQueue().size(); ++i){
					ResultSet rs = statement.executeQuery("select * from movie where movieID = " 
									+ currUsrBeanId.getMovieQueue().get(i)); 
    				rs.next();
    			%>
        			<div class="col-md-2 col-md-offset-1">
	       				  			<div>
  							<!-- Button to Open the Modal -->
  							 <a href="#myModal-<%=i%>" role="button" data-toggle="modal"> 
							<img class="img-responsive img-center" src=<%=rs.getString("movieImage") %> width = "96" height = "160">
						
							</a>
							

  							<!-- The Modal -->
 							<div class="modal fade" id="myModal-<%=i%>">
    							<div class="modal-dialog">
     								 <div class="modal-content">
      
       									 <!-- Modal Header -->
     										   <div class="modal-header">
         											 <h4 class="modal-title"><%=rs.getString("movieTitle") %></h4>
   												     <h6>Year: <%=rs.getString("movieYearReleased")%>  Rated: <%=rs.getString("movieMPAARating")%>   </h6>
      										   </div>
        
      									  <!-- Modal body -->
   									     <div class="modal-body">						
       										<p><%=rs.getString("movieDescription") %></p>
       										 <table style="width:100%" align ="left">
       									 	<tr>
       									 		<td>Actors: <%=rs.getString("actor1")%>, <%=rs.getString("actor2")%></td>
       									    	<td>Genre: <%=rs.getString("movieGenre")%></td> 
       									    </tr>
       									    </table>
     									 </div>
        								<form action = "DeleteMovie.jsp" method = post id = "<%=i %>">
      									  <!-- Modal footer -->
       									 <div class="modal-footer">
       									  <table style="width:100%" align ="left">
       									 	
       									     <tr>
       									 
       									  				 <td><a class="link" href="<%=rs.getString("movieTrailer")%>">Watch Now</a></td>				
       													<td>
       														<input type="hidden" name="viewid" value="Account.jsp">
       									  					<input type = "hidden" name = "movId" value = "<%=rs.getInt("movieID") %>">
       									  					<input type="submit" value="Remove from Queue" form = "<%=i%>">
       									  				</td>

       										</tr>
       										<tr>
       											<td></td>
       											<td></td>
       											<td> <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button></td>
       										</tr>
       									 </table>	
        								 </div>
        								 </form>
   								   </div>
 							  </div>
  						</div>
					</div> 		
        			</div>
				<%}}%>
    		</div>
		</div>

		
</body>
</html>
