<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import = "final_project.DBBean" %>

<jsp:useBean id = "dBBeanId" scope = "session" class = "final_project.DBBean" >
</jsp:useBean>

<%@ page import = "java.sql.*" %>

<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
		
		<h3>Search</h3>
		
		<% 
		Statement statement = dBBeanId.getConnection().createStatement();
		ResultSet rs = statement.executeQuery("select * from movie"); 
		%>
		<ul class = "list-group">
			<% while(rs.next()){ %>
					<% String imageName = rs.getString("movieImage");%>
					<li class="list-group-item" >
						<div>
							<img style = "vertical-align:top" src="<%=rs.getString("movieImage") %>" width = "96" height = "160"/>
							<h1 style="color:black;"><%=rs.getString("movieTitle")%></h1>
							<p style = "color:black;"><%=rs.getString("movieDescription") %></p>
						</div>
	       			</li>
			<% } %>
		</ul>
	</body>


</html>