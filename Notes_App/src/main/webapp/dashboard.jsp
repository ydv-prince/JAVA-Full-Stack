<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.maven.model.User,com.maven.model.Note" %>

<%
    // Session validation: User login check
    User user = (User) session.getAttribute("user");
    if(user == null){
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Mynote</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; line-height: 1.6; }
        .note-card { border: 1px solid #ddd; padding: 15px; margin: 10px 0; border-radius: 5px; background: #f9f9f9; }
        .delete-btn { color: red; text-decoration: none; font-weight: bold; margin-left: 10px; }
        .edit-btn { color: blue; text-decoration: none; }
        .logout-link { color: #555; text-decoration: none; border: 1px solid #ccc; padding: 5px 10px; border-radius: 3px; }
        .logout-link:hover { background: #eee; }
    </style>
</head>
<body>

    <div style="display: flex; justify-content: space-between; align-items: center;">
        <h1>Welcome, <%= user.getUsername() %>!</h1>
        <a href="logout" class="logout-link">Logout</a>
    </div>
    
    <hr>

    <section>
        <h2>Add New Note</h2>
        <form action="addNote" method="post">
            <label>Title:</label><br>
            <input type="text" name="title" required style="width: 300px; padding: 5px;"><br><br>

            <label>Content:</label><br>
            <textarea name="content" rows="4" cols="40" required style="padding: 5px;"></textarea><br><br>

            <button type="submit" style="padding: 10px 20px; cursor: pointer;">Save Note</button>
        </form>
    </section>
    
    <hr>

    <section>
        <h2>Your Saved Notes</h2>
        <%
            // Fetch notes list from request attribute (set by LoadNotesServlet)
            List<Note> notes = (List<Note>) request.getAttribute("notes");
            
            if(notes != null && !notes.isEmpty()){
                for(Note n : notes){
        %>
            <div class="note-card">
                <h3><%= n.getTitle() %></h3>
                <p><%= n.getContent() %></p>
                <a href="editNote?id=<%= n.getId() %>" class="edit-btn">Edit</a>
                <a href="deleteNote?id=<%= n.getId() %>" class="delete-btn" 
                   onclick="return confirm('Delete this note?')">Delete</a>
            </div>
        <%
                }
            } else {
        %>
            <p style="color: gray;">Abhi tak koi notes nahi hain. Pehla note create karein!</p>
        <%
            }
        %>
    </section>

</body>
</html>