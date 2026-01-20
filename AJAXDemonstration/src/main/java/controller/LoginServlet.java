package controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Set;
import java.util.HashSet;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        String username = request.getParameter("user");
        String password = request.getParameter("pwd");

        if (username != null && !username.isEmpty()) {
            HttpSession session = request.getSession();
            session.setAttribute("user", username);

            ServletContext context = getServletContext();
            synchronized (context) {
                Set<String> users = (Set<String>) context.getAttribute("loggedUser");
                if (users == null) {
                    users = new HashSet<>();
                }
                users.add(username);
                context.setAttribute("loggedUser", users);
            }
            response.sendRedirect("userHome.jsp");
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}