<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="style.css">
</head>
<body>

<div class = "login-box">
<h2>Login</h2>
<form action = "LoginCookie" method = "post">

	<label>Username</label>
	<input type="text" name="uname" required>
	<br><br>
	
	<label>Password</label>
	<input type="password" name="pwd" required>
	<br><br>
	
	<input type="submit" value="Login">

</form>
</div>

</body>
</html>