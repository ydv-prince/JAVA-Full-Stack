<%@ page language="java"
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Operation</title>
</head>
<body>

<form action="../update" method="post">
<input type="hidden" name="id" value="${user.id}">
<input type="text" name="name" value="${user.name}">
<input type="text" name="email" value="${user.email}">
<input type="submit" value="update">
</form>

</body>
</html>
