package com.maven.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

// Updated imports to match your new package structure
import com.maven.dao.UserDAO;
import com.maven.model.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Fetching data from register.jsp form
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Using updated model and DAO
        User user = new User(username, password);
        UserDAO dao = new UserDAO();

        if (dao.register(user)) {
            // Success: Redirect to login page
            response.sendRedirect("login.jsp");
        } else {
            // Failure: Show error message
            response.getWriter().println("Registration Failed");
        }
    }
}