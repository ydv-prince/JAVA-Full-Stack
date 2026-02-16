package com.prince.servlet;

import java.io.IOException;

import com.prince.dao.NoteDAO;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/deleteNote")
public class DeleteNoteServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        NoteDAO dao = new NoteDAO();
        dao.deleteNote(id);

        response.sendRedirect("loadNotes");
    }
}
