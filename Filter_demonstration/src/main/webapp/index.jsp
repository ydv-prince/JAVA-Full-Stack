<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="LoginServlet" method="post">
Enter Username: <input type="text" name="username"><br><br>
Enter Password: <input type="password" name="password"><br><br>
<input type="submit" value="login">
</form>

</body>
</html>