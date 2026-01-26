package com.socialmedia.dashboard;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SocialServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static List<Post> posts = new ArrayList<>();
    private static int postId = 1;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        // CREATE POST
        if ("create".equals(action)) {
            String author = request.getParameter("author");
            String content = request.getParameter("content");

            String time = LocalDateTime.now()
                    .format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss"));

            posts.add(new Post(postId++, author, content, time));
        }

        // DELETE POST
        else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            posts.removeIf(p -> p.getId() == id);
        }

        request.setAttribute("posts", posts);
        RequestDispatcher rd = request.getRequestDispatcher("Social.jsp");
        rd.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("posts", posts);
        RequestDispatcher rd = request.getRequestDispatcher("Social.jsp");
        rd.forward(request, response);
    }
}