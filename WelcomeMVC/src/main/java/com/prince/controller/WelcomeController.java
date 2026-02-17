package com.prince.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/WelcomeController")
public class WelcomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public WelcomeController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("message", "Welcome Page for MVC");
        RequestDispatcher dispatcher =
                request.getRequestDispatcher("/WEB-INF/views/welcome.jsp");
        dispatcher.forward(request, response);
	}

}
