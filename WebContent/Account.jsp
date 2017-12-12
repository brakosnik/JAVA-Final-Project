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
		currAcctBeanId.setUserName(currUsrBeanId.getUsername());
		currAcctBeanId.setMemberPassword(currUsrBeanId.getPassword());
		currAcctBeanId.getAccountInfo();
	%>
		<%-- AccountBean Loaded --%> 
	<% } %>
		
<h3>My Account</h3>

	<form action="UpdateAccount.jsp" method="post">
		Account Information<br />
	
		
		Email
		<input type = "email" name = "emailAddress" value = "<%= currAcctBeanId.getUserName() %>" required/><br />
		Password
		<input type = "password" name = "passWord" value = "<%=currAcctBeanId.getMemberPassword() %>" min="6" required/><br />
		Level
		<input type = "text" name = "levelName" value = "<%= currAcctBeanId.getLevelName() %>" required/><br />
	
		<br>Credit Card</br>
		
		Company
		<input type = "text" name = "company" value = "<%= currAcctBeanId.getCcType() %>" required/><br />
		CreditCardNumber
		<input type = "text" name = "creditCardNumber" value = "<%= currAcctBeanId.getCreditCardNumber() %>"maxlength="16" size="16" pattern="[0-9]{16}" required/><br />
		ExpirationDate
		
		
		<input type = "number" name = "expirationMonth" value = "<%= currAcctBeanId.getExpMonth() %>" maxlength="2" size="2" pattern="[0-9]{2}" required/>/
		<input type = "number" name = "expirationYear" value = "<%= currAcctBeanId.getExpYear() %>" maxlength = "4" size="4" pattern="[0-9]{4}" required/><br />
		CCV
		<input type = "number" name = "ccv" value = "<%= currAcctBeanId.getCreditCardCCV() %>" maxlength="5" size="5"/><br />
		
		<br>Billing Address</br>
		Address1
		<input type = "text" name = "addressLine1" value = "<%= currAcctBeanId.getBillAddressLine1() %>" required/><br />
		Address2
		<input type = "text" name = "addressLine2" value = "<%= currAcctBeanId.getBillAddressLine2() %>" /><br />
		City
		<input type = "text" name = "city" value = "<%= currAcctBeanId.getBillCity() %>" /><br />
		State
		<input type = "text" name = "state" value = "<%= currAcctBeanId.getBillState() %>" maxlength="2" size="2" pattern="[A-Z]{2}" required/><br />
		Zip
		<input type = "text" name = "zip" value = "<%= currAcctBeanId.getBillZipCode() %>" maxlength="5" size="5" required/><br />
		<input type = "submit" name = "Submit" value = "Save Changes"/>
	</form>

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
       									 		<td>Actors:<%=rs.getString("actor1")%>, <%=rs.getString("actor2")%></td>
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
