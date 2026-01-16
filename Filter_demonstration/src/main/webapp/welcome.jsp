<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Page</title>
</head>
<body>
<h2>Welcome Page ${sessionScope.user}</h2>
<a href="LogoutServlet">Logout</a>
</body>
</html>