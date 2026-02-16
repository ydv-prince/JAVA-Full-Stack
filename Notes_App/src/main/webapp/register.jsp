<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register - Mynote</title>
</head>
<body>
    <h1>Register</h1>
    <form action="register" method="post">
        Enter Username:<br>
        <input type="text" name="username" required><br><br>
        Enter Password:<br>
        <input type="password" name="password" required><br><br>
        <button type="submit">Register</button>
    </form>
    <p>Already have an account? <a href="login.jsp">Login</a></p>
</body>
</html>