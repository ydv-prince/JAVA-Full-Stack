<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
int userId = (int) session.getAttribute("userId");
Connection con = DBConnection.getConnection();
PreparedStatement ps = con.prepareStatement("SELECT * FROM notes WHERE user_id=?");
ps.setInt(1, userId);
ResultSet rs = ps.executeQuery();
while(rs.next()){
%>
<h3><%= rs.getString("title") %></h3>
<p><%= rs.getString("content") %></p>
<a href="DeleteNoteServlet?id=<%= rs.getInt("id") %>">Delete</a>
<% } %>


</body>
</html>