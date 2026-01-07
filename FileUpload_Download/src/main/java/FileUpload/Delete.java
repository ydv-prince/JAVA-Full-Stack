package FileUpload;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class Delete
 */
@WebServlet("/Delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private static final String query = "DELETE FROM file_upload WHERE id=?";

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String id = request.getParameter("id");

	        if (id == null) {
	            response.sendRedirect("Download");
	            return;
	        }

	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");

	            Connection con = DriverManager.getConnection(
	                    "jdbc:mysql://localhost:3306/employee",
	                    "root",
	                    "12345"
	            );

	            PreparedStatement ps = con.prepareStatement(query);
	            ps.setInt(1, Integer.parseInt(id));

	            ps.executeUpdate();

	            ps.close();
	            con.close();

	            response.sendRedirect("Download");

	        } catch (Exception e) {
	            e.printStackTrace();
	            response.getWriter().println("Delete Error: " + e.getMessage());
	        }
	}

}
