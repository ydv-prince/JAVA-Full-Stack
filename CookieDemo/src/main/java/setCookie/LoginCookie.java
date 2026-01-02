package setCookie;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class LoginCookie
 */
@WebServlet("/LoginCookie")
public class LoginCookie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCookie() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String username = request.getParameter("uname");
		String password = request.getParameter("pwd");
		
		if("admin".equals(username) && "4567".equals(password)) {
			Cookie ck = new Cookie("username", username);
			ck.setMaxAge(30*60);
			response.addCookie(ck);
			response.sendRedirect("WelcomeCookie");
		}else {
			out.println("<h2>Invalid Username or Password. <br><a href='login.jsp'>Try again</a></h2>");
		}
	}

}
