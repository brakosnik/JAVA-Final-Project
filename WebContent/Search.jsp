<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import = "final_project.DBBean" %>

<jsp:useBean id = "dBBeanId" scope = "session" class = "final_project.DBBean" >
</jsp:useBean>

<%@ page import = "java.sql.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
		<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
		<script type="text/javascript" src ="https://unpkg.com/popper.js@1.12.9/dist/umd/popper.js"></script>
		<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="bootstrap/js/bootstrap-multiselect.js"></script>
		<link rel="stylesheet" href="bootstrap/css/bootstrap-multiselect.css" type="text/css"/>
		
		<title>Search</title>
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
			
		<% String tableName = request.getParameter("tablename");
			ResultSet rsColumns = dBBeanId.getConnection().getMetaData().getColumns(null, null, tableName, null);
		%>
		
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
		
		<!-- Search Bar -->
		<div class = "container-fluid">
			<form>
				<div class = "form-group">
					<select id="genre" multiple ="multiple">
						<option value="action">Action</option>
					  	<option value="comedy">Comedy</option>
					  	<option value="drama">Drama</option>
					    <option value="scifi">Sci-Fi</option>
					    <option value="horror">Horror</option>
					</select>
				</div>
				<button type="submit" class="btn btn-primary">Search</button>
			</form>
		</div>
		<!-- Load in all movies -->
		<div class = "container-fluid">
			<% 
			Statement statement = dBBeanId.getConnection().createStatement();
			ResultSet rs = statement.executeQuery("select * from movie"); 
			%>
			<ul class = "list-group">
				<% while(rs.next()){ %>
						<% String imageName = rs.getString("movieImage");%>
						<li class="list-group-item; list-group-item-search" >
							<div class="row row-eq-height">
								<div class = "col-sm-2">
									<img class="img-responsive img-center" src="<%=rs.getString("movieImage") %>" width = "96" height = "160"/>
								</div>
								<div class = "col-sm-6">
									<h1><%=rs.getString("movieTitle")%></h1>
									<p><%=rs.getString("movieDescription") %></p>
								</div>
								<div class = "col-sm-4; mycontent-left">
									<div style = "margin-left: 1em">
										<p>Genre: <%=rs.getString("movieGenre") %><p>
										<p>Released: <%=rs.getString("movieReleaseDate") %><p>
										<p>Director: <%=rs.getString("director") %><p>
										<p>Starring: <%=rs.getString("actor1") %></p>
									</div>
								</div>
							</div>
		       			</li>
				<% } %>
			</ul>
		</div>
	</body>
	
	<script type="text/javascript"> $(document).ready(function() { $('#genre').multiselect(); });</script>
</html>
