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
import java.sql.SQLException;

/**
 * Servlet implementation class Delete
 */
@WebServlet("/Delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String query= "delete from empData where id=?";
    public Delete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		//fetch id
		int id = Integer.parseInt(request.getParameter("id"));
		try {
			//load driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			//establish connection
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee","root","12345");
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);
			int count = ps.executeUpdate();
			if(count == 1) {
				pw.println("<h1>Record deleted</h1>");
			}else {
				pw.println("<h1>Record not deleted</h1>");
			}
		}catch(SQLException e) {
			e.getStackTrace();
		}
		catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		pw.println("<button type='submit' name='Home'><a href='index.jsp'>Home</a></button>");
		pw.println("<button type='submit' name='ShowUser'><a href='Select'>Users</a></button>");
	}
}
