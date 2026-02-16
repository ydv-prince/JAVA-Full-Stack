package com.maven.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.maven.dao.NoteDAO;
import com.maven.model.Note;
import com.maven.model.User;

@WebServlet("/addNote")
public class AddNoteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if(user == null){
            response.sendRedirect("login.jsp");
            return;
        }

        String title = request.getParameter("title");
        String content = request.getParameter("content");

        Note note = new Note(title, content, user.getId());
        NoteDAO dao = new NoteDAO();
        dao.addNote(note);

        response.sendRedirect("loadNotes");
    }
}