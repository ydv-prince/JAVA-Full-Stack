package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Set;

@WebServlet("/ActivateUserServlet")
public class ActivateUserServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public ActivateUserServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();

        Set<String> users = (Set<String>) getServletContext().getAttribute("loggedUser");

        if (users == null || users.isEmpty()) {
            pw.print("No active users");
        } else {
            for (String u : users) {
                pw.print("<li>" + u + "</li>");
            }
        }
    }
}