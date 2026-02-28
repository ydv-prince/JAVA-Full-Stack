<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Email Service</title>
</head>
<body>
<form:form action="register" method="post" modelAttribute="user" enctype="multipart/form-data">
<form:input path="name" placeholder="enter name"/>
<form:input path="email" type="email" placeholder="enter email"/>
Select file<input type="file" name="file">
<input type="submit" value="Register"/>
</form:form>
</body>
</html>
