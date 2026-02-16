<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Mynote</title>
</head>
<body>
    <h1>Login</h1>
    <form action="login" method="post">
        Enter Username:<br>
        <input type="text" name="username" required><br><br>
        Enter Password:<br>
        <input type="password" name="password" required><br><br>
        <button type="submit">Login</button>
    </form>
    <p>Don't have an account? <a href="register.jsp">Register</a></p>
</body>
</html>