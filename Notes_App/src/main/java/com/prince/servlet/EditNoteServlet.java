package com.prince.servlet;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.prince.dao.NoteDAO;
import com.prince.model.Note;

@WebServlet("/editNote")
public class EditNoteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Note n = new NoteDAO().getNoteById(id);
        request.setAttribute("note", n);
        request.getRequestDispatcher("edit.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        
        Note n = new Note();
        n.setId(id);
        n.setTitle(title);
        n.setContent(content);
        
        new NoteDAO().updateNote(n);
        response.sendRedirect("loadNotes");
    }
}