<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.socialmedia.dashboard.Post" %>

<!DOCTYPE html>
<html>
<head>
    <title>Social Media Dashboard</title>
    <style>
        body {
            font-family: Arial;
            background-color: #f4f4f4;
        }
        .container {
            width: 60%;
            margin: auto;
            background: white;
            padding: 20px;
            margin-top: 30px;
        }
        textarea {
            width: 100%;
            height: 80px;
        }
        input, button {
            padding: 8px;
            margin-top: 5px;
        }
        .post {
            border-bottom: 1px solid #ccc;
            padding: 10px 0;
        }
        .time {
            font-size: 12px;
            color: gray;
        }
    </style>
</head>

<body>
<div class="container">

    <h2>Social Media Dashboard</h2>

    <!-- CREATE POST -->
    <form action="SocialServlet" method="post">
        <input type="hidden" name="action" value="create">

        <input type="text" name="author" placeholder="Your Name" required><br><br>

        <textarea name="content" placeholder="What's on your mind?" required></textarea><br><br>

        <button type="submit">Publish Post</button>
    </form>

    <hr>

    <h3>Published Posts</h3>

    <%
        List<Post> posts = (List<Post>) request.getAttribute("posts");
        if (posts != null && !posts.isEmpty()) {
            for (Post p : posts) {
    %>
        <div class="post">
            <b><%= p.getAuthor() %></b><br>
            <%= p.getContent() %><br>
            <span class="time">Posted at: <%= p.getTime() %></span>

            <form action="SocialServlet" method="post" style="display:inline;">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="<%= p.getId() %>">
                <button type="submit">Delete</button>
            </form>
        </div>
    <%
            }
        } else {
    %>
        <p>No posts available.</p>
    <%
        }
    %>

</div>
</body>
</html>