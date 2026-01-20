<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Page</title>
</head>
<body>

<h4>Welcome user</h4>
<p>Welcome, ${sessionScope.user}</p>
<a href="LogoutServlet">Logout</a>
</body>
</html>