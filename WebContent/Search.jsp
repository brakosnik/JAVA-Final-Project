<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import = "final_project.DBBean" %>

<jsp:useBean id = "dBBeanId" scope = "session" class = "final_project.DBBean" >
</jsp:useBean>

<%@ page import = "java.sql.*, java.io.*,java.util.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
		<script src="//ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script type="text/javascript" src="bootstrap/js/bootstrap.bundle.min.js"></script>
		<!-- Scripts and CCS for nice looking multiselects -->
		<script type="text/javascript" src="selectize/js/standalone/selectize.min.js"></script>
		<link rel="stylesheet" type="text/css" href="selectize/css/selectize.bootstrap3.css">
		
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
			<form id = "submitform" class="form-inline well">
				<div class = "form-group">
					<label class = "control-label pad-right">Search: </label>
					<input type ="text" class="form-control pad-right" name ="keywords" id="keywrds">
				</div>
				<div class="form-group select-input">
					<select multiple name = "catName" id = "searchIn">
						<option value="movieTitle" selected>Title</option>
					  	<option value="movieDescription">Description</option>
					  	<option value="director">Director</option>
					    <option value="actor1">Actor</option>
					</select>
				</div>
				<button type="submit" class="btn btn-primary">Search</button>
			</form>	
			<!-- Advanced Searching below
			  
			<button type="button" class = "btn btn-info" data-toggle="collapse" data-target="#Search">Search</button>
			<div id="Search" class="collapse">
			</div>
						Select By all the Genres
						<select multiple name = "gName" id = "genre">
							<option value="Action">Action</option>
						  	<option value="Comedy">Comedy</option>
						  	<option value="Drama">Drama</option>
						    <option value="Sci-Fi">Sci-Fi</option>
						    <option value="Horror">Horror</option>
						</select>
			
			-->
		</div>
		
		<!-- Load in all movies -->
		<div class = "container-fluid">
			<%
				Statement statement = dBBeanId.getConnection().createStatement();
				String[] categoryResults = request.getParameterValues("catName");
				String[] keywordResults = request.getParameterValues("keywords");
				System.out.println(dBBeanId.createSimpleQuery(categoryResults, keywordResults));
				ResultSet rs = statement.executeQuery(dBBeanId.createSimpleQuery(categoryResults, keywordResults));
				
			%>
			<ul class = "list-group">
				<% while(rs.next()){ %>
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
	<!-- 
		<script>
	$(document).ready($(function()
			{
	    $("submitform").submit(function()
	    {
	        $(this).children(':input[value=""]').attr("disabled", "disabled");

	        return true; // ensure form still submits
	    });
	});
	</script>
	-->
	<script>
		$('#searchIn').selectize({
			plugins: ['remove_button'],
			delimiter: ',',
			maxItems: 1,
		    persist: false,
		    create: function(input) {
		        return {
		            value: input,
		            text: input
		        }
		    }
		});
	</script>
</html>
