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

@WebServlet("/EditSelect")
public class EditSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EditSelect() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		try {
			//load driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			//establish connection
			Connection con = DriverManager.getConnection
					("jdbc:mysql://localhost:3306/employee","root","");
			PreparedStatement ps = con.prepareStatement("select * from empData where empId=?");
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
                pw.println("<form action='Update' method='get'>");

                pw.println("<input type='hidden' name='empid' value='" + rs.getInt(1) + "'>");

                pw.println("Name: ");
                pw.println("<input type='text' name='empname' value='" + rs.getString(2) + "'><br><br>");

                pw.println("Mobile: ");
                pw.println("<input type='text' name='mobileno' value='" + rs.getString(3) + "'><br><br>");

                pw.println("<input type='submit' value='Update'>");
                pw.println("</form>");
            }
			pw.println("<br><a href='Select'><button>Back</button></a>");
            pw.println("<a href='index.jsp'><button>Home</button></a>");
			
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
