package notesApp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/AddNoteServlet")
public class AddNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AddNoteServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = (int) request.getSession().getAttribute("userId");
	    String title = request.getParameter("title");
	    String content = request.getParameter("content");

	    try(Connection con = DBConnection.getConnection()){
	        PreparedStatement ps = con.prepareStatement(
	            "INSERT INTO notes(user_id,title,content) VALUES (?,?,?)");
	        ps.setInt(1, userId);
	        ps.setString(2, title);
	        ps.setString(3, content);
	        ps.executeUpdate();
	        response.sendRedirect("dashboard.jsp");
	    } catch(Exception e){ e.printStackTrace(); }

	}

}
