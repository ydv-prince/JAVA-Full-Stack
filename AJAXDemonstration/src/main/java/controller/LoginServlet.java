package controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.Set;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // TODO Auto-generated method stub
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();

        String username = request.getParameter("uname");
        String pwd = request.getParameter("pwd");

        if (username != null && !username.isEmpty()) {

            HttpSession session = request.getSession();
            session.setAttribute("user", username);

            ServletContext context = getServletContext();

            synchronized (context) {
                Set<String> users = (Set<String>) context.getAttribute("loggedUser");

                if (users == null) {
                    users = new HashSet<>(); // create collection
                } // inner if

                users.add(username); // take data from user input
                context.setAttribute("loggedUser", users);
            } // end of synchronized

            response.sendRedirect("userHome.jsp");

        } // outer if
        else {
            response.sendRedirect("login.jsp");
        }
    }
}