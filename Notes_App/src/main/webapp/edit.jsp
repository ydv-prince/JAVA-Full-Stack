<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.maven.model.Note" %>
<% 
    Note n = (Note) request.getAttribute("note"); 
    if(n == null) {
        response.sendRedirect("loadNotes");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Note - Mynote</title>
</head>
<body>
    <h2>Edit Note</h2>
    <form action="editNote" method="post">
        <input type="hidden" name="id" value="<%= n.getId() %>">
        Title: <input type="text" name="title" value="<%= n.getTitle() %>" required><br><br>
        Content: <br>
        <textarea name="content" rows="5" cols="30" required><%= n.getContent() %></textarea><br><br>
        <button type="submit">Update Note</button>
        <a href="loadNotes">Cancel</a>
    </form>
</body>
</html>