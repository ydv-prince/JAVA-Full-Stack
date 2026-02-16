package com.maven.servlet;

import java.io.IOException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

// Updated import to match your new package structure
import com.maven.dao.NoteDAO;

@WebServlet("/deleteNote")
public class DeleteNoteServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        // Get ID from request parameter
        int id = Integer.parseInt(request.getParameter("id"));

        // Use updated DAO package
        NoteDAO dao = new NoteDAO();
        dao.deleteNote(id);

        // Redirect back to the notes list
        response.sendRedirect("loadNotes");
    }
}