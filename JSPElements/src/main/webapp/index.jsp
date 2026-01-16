<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="java.util.Date" %>
    <%@ page import="java.sql.Connection" %>
    <!-- 
    JSP ELEMENTS
     -->
     <%
     int a=20;
     
     %>
     <!--  how to print any values using experssion tag -->
     a=<%=a%> <br>
     <%-- declaration tag  --%>
     <%! int square(int x){
    	 return x*x;
     }
     %>
     
     square of <%= square(4) %> <br>
     <%-- jsp action elements --%>
      <c:set var="name" value="Admin" />
    Welcome ${name } <br><br>
     <jsp:include page="html/welcome.html" />
    <%-- <jsp:forward page="login.jsp" /> --%>

     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="index.jsp" method="get">
Enter Email: <input type="email" name="email">
<button type="submit" value="submit">Submit</button>
</form>

<% String email=request.getParameter("email");
%>
Email: <%= email%>
</body>
</html>