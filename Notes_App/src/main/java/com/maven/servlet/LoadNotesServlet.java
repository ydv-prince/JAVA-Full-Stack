package com.maven.servlet;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.maven.dao.NoteDAO;
import com.maven.model.Note;
import com.maven.model.User;

@WebServlet("/loadNotes")
public class LoadNotesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if(user == null){
            response.sendRedirect("login.jsp");
            return;
        }

        NoteDAO dao = new NoteDAO();
        List<Note> notes = dao.getNotesByUser(user.getId());

        request.setAttribute("notes", notes);
        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }
}