<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 

<jsp:useBean id = "dBBeanId" scope = "session" class = "final_project.DBBean" >
</jsp:useBean>

<jsp:useBean id = "currUsrBeanId" scope = "session" class = "currUsrBean.User" >
</jsp:useBean>

<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>

<!DOCTYPE html>
<html>
<head>

	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
  	    <script src="bootstrap/js/bootstrap.min.js"></script>
	<title>Home</title>
</head>

<body>

		<%
		if(!dBBeanId.isConnected()){
			dBBeanId.initializeJdbc();
		}
		%>
	
		<% if (dBBeanId.getConnection() == null) { %>
			Error: Login failed. Try again.
		<% } %>
		

		
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

<!-- Welcome Banner -->
<div class = "text-center">
	<h3>Welcome to Tony's</h3>
	<% if(!currUsrBeanId.isLoggedIn()){ %>
	
		<a class="link" href="Login.jsp">Login</a>
		<a class="link" href="Signup.jsp">Signup</a>
	<%
	}
	else{
	
	%>
		<h6>Click on movies to start watching!</h6>
	<%} %>
</div> 
		
	<% if(currUsrBeanId.isLoggedIn()){%>	
		
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

		
		<%}%>
		

	<% 
		Statement statement = dBBeanId.getConnection().createStatement();
		ResultSet rs = statement.executeQuery("select * from movie order by Rand()"); 
		%>
	<div class = "text-left">
		<h5>Check out these movies</h5>
	</div>

 		<div class="container">
    		<div class="row text-center">
    			<%for(int i = 0; i < 5; ++i){ 
    				rs.next();

    			%>
        			<div class="col-md-2 col-md-offset-1">
        		
        				<div>
  							<!-- Button to Open the Modal -->
  							 <a href="#myModal-<%=i +100%>" role="button" data-toggle="modal"> 
							<img class="img-responsive img-center" src=<%=rs.getString("movieImage") %> width = "96" height = "160"></a>


  							<!-- The Modal -->
 							<div class="modal fade" id="myModal-<%=i + 100%>">
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
        								 <form action = "AddMovie.jsp" method = "post" id = "<%=i +100 %>">
      									  <!-- Modal footer -->
       									 <div class="modal-footer">
     						
       									  <table style="width:100%" align ="left">
       									     <tr>
       									    
       									    <%    if(currUsrBeanId.isLoggedIn()){%>
       									  				<td><a class="link" href="<%=rs.getString("movieTrailer")%>">Watch Now</a></td>
       									  				<td>
       									  					<input type = "hidden" name = "movId" value = "<%=rs.getInt("movieID") %>">
       									  					<input type="submit" value="Add to Queue" form = "<%=i +100%>">
       									  					
       									  				</td>
       									  				
       									  				
       										<%}%> 
       											

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
				<%}%>		
    		</div>
		</div>
	
	<div class = "text-left">
		<h5>New Movies</h5>
	</div>

		<%
		statement = dBBeanId.getConnection().createStatement();
	    rs = statement.executeQuery("select * from movie order by movieReleaseDate desc"); 
		%>
	
 		<div class="container">
    		<div class="row text-center">
    			<%for(int i = 0; i < 5; ++i){ 
    				rs.next();
    			%>
        			<div class="col-md-2 col-md-offset-1">
        			<div>
  							<!-- Button to Open the Modal -->
  							 <a href="#myModal-<%=i + 1000%>" role="button" data-toggle="modal"> 
							<img class="img-responsive img-center" src=<%=rs.getString("movieImage") %> width = "96" height = "160">
						
							</a>
							

  							<!-- The Modal -->
 							<div class="modal fade" id="myModal-<%=i + 1000%>">
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
        								 <form action = "AddMovie.jsp" method = "post" id = "<%=i +1000 %>">
      									  <!-- Modal footer -->
       									 <div class="modal-footer">
     						
       									  <table style="width:100%" align ="left">
       									     <tr>
       									    
       									    <%    if(currUsrBeanId.isLoggedIn()){%>
       									  				<td><a class="link" href="<%=rs.getString("movieTrailer")%>">Watch Now</a></td>
       									  				<td>
       									  					<input type = "hidden" name = "movId" value = "<%=rs.getInt("movieID") %>">
       									  					<input type="submit" value="Add to Queue" form = "<%=i +1000%>">
       									  				</td>
       									  				
       									  				
       										<%}%> 
       											

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
				<%}%>
    		</div>
		</div>

</html>