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
import java.sql.SQLException;

@WebServlet("/Update")
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String query= "UPDATE empData SET name=?, mobile=? where id=?";
		
		
    public Update() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		String uname = request.getParameter("name");
		String mno = request.getParameter("mobile");
		int id = Integer.parseInt(request.getParameter("id"));
		try {
			//load driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			//establish connection
			Connection con = DriverManager.getConnection
					("jdbc:mysql://localhost:3306/employee","root","12345");
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, uname);
			ps.setString(2, mno);
			ps.setInt(3, id);
			int count = ps.executeUpdate();
			con.close();
			
			if (count > 0) {
                response.sendRedirect("Select");
                pw.println("<h1>Updated</h1>");
            } else {
                response.getWriter().println("<h1>Update Failed</h1>");
            }
			
		}
		catch(SQLException e) {
			e.getStackTrace();
		}
		catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		pw.println("<button type='submit' name='Home'><a href='index.jsp'>Home</a></button>");
		pw.println("<button type='submit' name='ShowUser'><a href='Select'>Users</a></button>");
	}

}
