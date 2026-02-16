package com.prince.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.prince.dao.UserDAO;
import com.prince.model.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User(username, password);
        UserDAO dao = new UserDAO();

        if (dao.register(user)) {
            response.sendRedirect("login.jsp");
        } else {
            response.getWriter().println("Registration Failed");
        }
    }
}
