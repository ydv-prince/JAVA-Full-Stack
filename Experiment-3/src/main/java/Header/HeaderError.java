package Header;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class HeaderError
 */
@WebServlet("/HeaderError")
public class HeaderError extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HeaderError() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		 PrintWriter pw = response.getWriter();

	        try {
	            response.setHeader(null, "test");
	        } catch (Exception e) {
	            pw.println("Error: " + e.getMessage());
	        }

	        try {
	            response.setIntHeader("Content-Type", -10);
	        } catch (Exception e) {
	            pw.println("<br>Error: " + e.getMessage());
	        }
	}

}
