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
import java.util.Set;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LogoutServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        HttpSession session = request.getSession(false);

        if (session != null) {
            String user = (String) session.getAttribute("user");
            session.invalidate();

            ServletContext context = getServletContext();
            synchronized (context) {
                Set<String> users = (Set<String>) context.getAttribute("loggedUser");
                if (users != null && user != null) {
                    users.remove(user);
                } // inner if
            } // synchronized
        } // outer if

        response.sendRedirect("login.jsp");
    }
}