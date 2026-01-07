package JDBC;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/EditSelect")
public class EditSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditSelect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 response.setContentType("text/html");
	        PrintWriter pw = response.getWriter();

	        int id = Integer.parseInt(request.getParameter("id"));

	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");

	            Connection con = DriverManager.getConnection(
	                    "jdbc:mysql://localhost:3306/employee","root","12345");

	            
	            PreparedStatement ps =
	                    con.prepareStatement("SELECT * FROM empdata WHERE id=?");

	            ps.setInt(1, id);
	            ResultSet rs = ps.executeQuery();

	            pw.println("<h2>Edit Employee</h2>");

	            if (rs.next()) {
	                pw.println("<form action='Update' method='post'>");

	                pw.println("<input type='hidden' name='id' value='" + rs.getInt(1) + "'>");

	                pw.println("Name: ");
	                pw.println("<input type='text' name='name' value='" + rs.getString(2) + "'><br><br>");

	                pw.println("Mobile: ");
	                pw.println("<input type='text' name='mobile' value='" + rs.getString(3) + "'><br><br>");

	                pw.println("<input type='submit' value='Update'>");
	                pw.println("</form>");
	            }

	            pw.println("<br><a href='Select'><button>Back</button></a>");
	            pw.println("<a href='index.jsp'><button>Home</button></a>");

	            

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		
	}

	

}
