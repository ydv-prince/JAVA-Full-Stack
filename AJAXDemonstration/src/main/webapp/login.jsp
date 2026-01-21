<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>
<h2> Login page</h2>

<form action="LoginServlet" method="post">
Enter name: <input type="text" name="uname">
Enter password : <input type="password" name="pwd">
<input type="submit" value="login">
</form>

</body>
</html>