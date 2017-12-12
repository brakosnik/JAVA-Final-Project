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
			<form id = "submitform">
				<div class="form-inline well">
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
					<button type="button" class = "btn btn-primary" data-toggle="collapse" data-target="#AdvancedSearch">Advanced Search</button>
				</div>
				<div id="AdvancedSearch" class="collapse">
					<div class="form-inline well">
						<div class="form-group">
							<label class="control-label pad-right">Genre: </label>
							<select multiple name="genres" id = "genre">
								<option value="" disabled selected>Choose Genres</option>
								<option value="Action">Action</option>
							  	<option value="Comedy">Comedy</option>
							  	<option value="Drama">Drama</option>
							    <option value="Sci-Fi">Sci-Fi</option>
							    <option value="Horror">Horror</option>
							</select>
						</div>
					</div>
					<div class="form-inline well">
						<div class="form-group">
							<label class="control-label pad-right">Director: </label>
							<select multiple name="directorName" id="director">
								<option value="" disabled selected>Choose Directors</option>
								<option value="Alejandro Gonzalez Inarritu">Alejandro González Iñárritu</option>
								<option value="Brian DePalma">Brian DePalma</option>								
								<option value="Chris Columbus">Chris Columbus</option>								
								<option value="David Fincher">David Fincher</option>								
								<option value="Don Roos">Don Roos</option>								
								<option value="Dwight Little">Dwight Little</option>							
								<option value="Emir Kusturica">Emir Kusturica</option>								
								<option value="Fernando Meirelles">Fernando Meirelles</option>								
								<option value="Greg Marcks">Greg Marcks</option>								
								<option value="Guy Ferland">Guy Ferland</option>								
								<option value="Hector Babenco">Hector Babenco</option>								
								<option value="Irwin Winkler">Irwin Winkler</option>								
								<option value="James Brooks">James Brooks</option>								
								<option value="James Cameron">James Cameron	</option>							
								<option value="Jez Butterworth">Jez Butterworth	</option>						
								<option value="Joan Chen">Joan Chen	</option>							
								<option value="Joe Berlinger">Joe Berlinger	</option>							
								<option value="John McTiernan">John McTiernan</option>								
								<option value="Joss Whedon">Joss Whedon</option>								
								<option value="Mark Pellington">Mark Pellington	</option>							
								<option value="Martin Scorsese">Martin Scorsese	</option>							
								<option value="Michael Apted">Michael Apted	</option>							
								<option value="Michael Caton-Jones">Michael Caton-Jones</option>								
								<option value="Mike Barker">Mike Barker	</option>							
								<option value="Milos Forman">Milos Forman</option>								
								<option value="Oliver Stone">Oliver Stone</option>								
								<option value="Paul Verhoeven">Paul Verhoeven</option>								
								<option value="Pedro Almodovar">Pedro Almodóvar	</option>							
								<option value="Penny Marshall">Penny Marshall</option>								
								<option value="Peter Segal">Peter Segal	</option>							
								<option value="Richard Donner">Richard Donner</option>								
								<option value="Richard Linklater">Richard Linklater	</option>							
								<option value="Ridley Scott">Ridley Scott</option>								
								<option value="Rob Reiner">Rob Reiner</option>								
								<option value="Robert Deniro">Robert Deniro	</option>							
								<option value="Robert Zemeckis">Robert Zemeckis	</option>							
								<option value="Roger Michell">Roger Michell	</option>							
								<option value="Ron Howard">Ron Howard</option>								
								<option value="Sam Mendes">Sam Mendes</option>								
								<option value="Spike Jonze">Spike Jonze	</option>							
								<option value="Spike Lee">Spike Lee	</option>							
								<option value="Steven Spielberg">Steven Spielberg</option>								
								<option value="Ted Demme">Ted Demme</option>								
								<option value="Tim Burton">Tim Burton</option>								
								<option value="Tony Kaye">Tony Kaye</option>								
								<option value="Vincent Gallo">Vincent Gallo</option>
							</select>
						</div>
					</div>
					<div class="form-inline well">
						<div class="form-group">
							<label class="control-label pad-right">Actors:</label>
							<select multiple name="actorName" id="actor">
								<option value="" disabled selected>Choose Actors</option>
								<option value="Al Pacino">Al Pacino</option>
								<option value="Alessandro Nivola">Alessandro Nivola</option>
								<option value="Alexandre Rodrigues">Alexandre Rodrigues</option>
								<option value="Angela Alvarado ">Angela Alvarado </option>
								<option value="Arnold Schwarzenegger">Arnold Schwarzenegger</option>
								<option value="Ben Affleck">Ben Affleck</option>
								<option value="Ben Foster">Ben Foster</option>
								<option value="Brad Pitt">Brad Pitt</option>
								<option value="Cameron Diaz">Cameron Diaz</option>
								<option value="Chazz Palminteri">Chazz Palminteri</option>
								<option value="Christina Ricci">Christina Ricci</option>
								<option value="Edward Norton">Edward Norton</option>
								<option value="Emilio Echevarroa">Emilio Echevarroa</option>
								<option value="Ethan Hawke">Ethan Hawke</option>
								<option value="Ewan McGregor">Ewan McGregor</option>
								<option value="F. Murray Abraham">F. Murray Abraham</option>
								<option value="Henry Thomas">Henry Thomas</option>
								<option value="Jack Nicholson">Jack Nicholson</option>
								<option value="Jeff Bridges">Jeff Bridges</option>
								<option value="John Travolta">John Travolta</option>
								<option value="Johnny Depp">Johnny Depp</option>
								<option value="Kevin Spacey">Kevin Spacey</option>
								<option value="Kim Director">Kim Director</option>
								<option value="Laurence Fishburne">Laurence Fishburne</option>
								<option value="Luis Carlos Vasconelos">Luis Carlos Vasconelos</option>
								<option value="Matthew Modine">Matthew Modine</option>
								<option value="Michael Douglas">Michael Douglas</option>
								<option value="Morgna Freeman">Morgna Freeman</option>
								<option value="Nicholas Cage">Nicholas Cage</option>
								<option value="Nicole Kidman">Nicole Kidman</option>
								<option value="Noomi Rapace">Noomi Rapace</option>
								<option value="Penolope Cruz">Penolope Cruz</option>
								<option value="Richard Gere">Richard Gere</option>
								<option value="Robert De Niro">Robert De Niro</option>
								<option value="Robert Downey Jr.">Robert Downey Jr.</option>
								<option value="Robin Williams ">Robin Williams </option>
								<option value="Russell Crowe">Russell Crowe</option>
								<option value="Samuel L. Jackson">Samuel L. Jackson</option>
								<option value="Sean Penn">Sean Penn</option>
								<option value="Sean Penn">Sean Penn</option>
								<option value="Sigourney Weaver">Sigourney Weaver</option>
								<option value="Sylverster Stallone">Sylverster Stallone</option>
								<option value="Tom Hanks">Tom Hanks</option>
								<option value="Tom Skerritt">Tom Skerritt</option>
								<option value="Val Kilmer">Val Kilmer</option>
							</select>
						</div>
					</div>
					<div class="form-inline well">
						<div class="form-group">
							<label class="control-label pad-right">Rating:</label>
							<select multiple name="ageRating" id="rating">
								<option value="" disabled selected>Choose Ratings</option>
								<option value="PG">PG</option>
								<option value="PG-13">PG-13</option>
								<option value="R">R</option>
							</select>
						</div>
					</div>
				</div>
				<br>
				<button type="submit" class="btn btn-primary">Search</button>
			</form>				  
	
		</div>
		
		<!-- Load in all movies -->
		<div class = "container-fluid pad-top">
			<%
				Statement statement = dBBeanId.getConnection().createStatement();
				ResultSet rs;
				String[] keywordResults = request.getParameterValues("keywords");
				String[] categoryResults = request.getParameterValues("catName");
				String[] genreResults = request.getParameterValues("genres");
				String[] directorResults = request.getParameterValues("directorName");
				String[] actorResults = request.getParameterValues("actorName");
				String[] ratingResults = request.getParameterValues("ageRatings");
				if(genreResults == null && ratingResults == null && actorResults == null && directorResults == null){
					System.out.println(dBBeanId.createSimpleQuery(categoryResults, keywordResults));
					rs = statement.executeQuery(dBBeanId.createSimpleQuery(categoryResults, keywordResults));
				}
				else{
					System.out.println(dBBeanId.createSimpleQuery(categoryResults, keywordResults));
					rs = statement.executeQuery(dBBeanId.createQuery(keywordResults, genreResults, directorResults, actorResults, ratingResults));
				}
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

	<script>
		$('#searchIn').selectize({plugins: ['remove_button'],delimiter: ',',maxItems: 1,persist: false, create: function(input) {return {value: input,text: input}}});
	</script>
	
	<script>
		$('#genre').selectize({plugins: ['remove_button'],delimiter: ',',persist: false,create: function(input) {return {value: input,text: input}}});
	</script>
	
	<script>
		$('#director').selectize({plugins: ['remove_button'],delimiter: ',',persist: false,create: function(input) { return {value: input,text: input }}});
	</script>
	
	<script>
		$('#actor').selectize({plugins: ['remove_button'], delimiter: ',', persist: false, create: function(input) {return {value: input,text: input}}});
	</script>
	
	<script>
		$('#rating').selectize({plugins: ['remove_button'], delimiter: ',', persist: false, create: function(input) {return {value: input,text: input}}});
	</script>
	
</html>
