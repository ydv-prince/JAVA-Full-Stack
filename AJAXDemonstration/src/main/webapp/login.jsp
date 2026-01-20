<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>
<form method="post" action="LoginServlet">

<label for="user">Enter Username :</label>
<input type="text" id="user" name="username"><br><br>
<label for="psw">Enter Password :</label>
<input type="text" id="psw" name="password"><br><br>
<button type="submit">Login</button>

</form>

</body>
</html>