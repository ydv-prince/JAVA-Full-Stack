<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<h2>Login Page</h2>
<form action="${pageContext.request.contextPath}/doLogin" method="post">
    <label for="Username">Username:</label>
    <input type="text" id="username" name="username"
           placeholder="Enter username" required>
    <br><br>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password"
           placeholder="Enter password" required>
    <br><br>

    <button type="submit">Login</button>

</form>

</body>
</html>

