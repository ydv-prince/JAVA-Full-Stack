package RegisterUser;

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

@WebServlet("/Register")
public class Register extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String query = "INSERT INTO registration_user (name, address, age, gender, city) VALUES (?, ?, ?, ?, ?)";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();

        // Fetch form data
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String ageStr = request.getParameter("age");
        String gender = request.getParameter("gender");
        String city = request.getParameter("city");

        // Validation
        if (name == null || name.trim().isEmpty()) {
            pw.println("Error: Name is required");
            return;
        }
        if (address == null || address.trim().isEmpty()) {
            pw.println("Error: Address is required");
            return;
        }
        if (ageStr == null || ageStr.trim().isEmpty()) {
            pw.println("Error: Age is required");
            return;
        }
        if (gender == null) {
            pw.println("Error: Gender is required");
            return;
        }
        if (city == null || city.trim().isEmpty()) {
            pw.println("Error: City is required");
            return;
        }

        int age = Integer.parseInt(ageStr);

        if (age <= 0) {
            pw.println("Error: Age must be greater than 0");
            return;
        }

        // JDBC Insertion
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/userDB",
                    "root",
                    "12345"
            );

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, name);
            ps.setString(2, address);
            ps.setInt(3, age);
            ps.setString(4, gender);
            ps.setString(5, city);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                pw.println("<h3>Registration Successful</h3>");
                pw.println("<a href='register.jsp'>Return to Register page</a>");
                pw.println("<a href='viewUsers.jsp'>View Users</a>");
                
            } else {
                pw.println("<h3>Registration Failed</h3>");
                pw.println("<a href='register.jsp'>Return to Register page</a>");
            }

            con.close();

        } catch (Exception e) {
            pw.println("Error: " + e.getMessage());
        }
    }
}
