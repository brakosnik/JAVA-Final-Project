

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Redirect
 */
@WebServlet("/Redirect")
public class Redirect extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//TODO: Add check to see if username and password exist once database is set up 
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		// hard-coded username/email for demonstration
		if (username.equals("foo") && password.equals("bar"))
			response.sendRedirect("http://localhost:8080/JAVA_Final_Project/Home.jsp");
		else // else reload login page
			response.sendRedirect("http://localhost:8080/JAVA_Final_Project/Login.jsp");
	}
}
