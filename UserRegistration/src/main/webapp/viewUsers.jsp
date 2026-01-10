<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>View Registered Users</title>
</head>
<body>

<h2>Registered Users</h2>

<table border="1" cellpadding="10">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Address</th>
        <th>Age</th>
        <th>Gender</th>
        <th>City</th>
    </tr>

<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/UserDB",
            "root",
            "12345"
        );

        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM registration_user");

        boolean hasData = false;

        while (rs.next()) {
            hasData = true;
%>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("address") %></td>
        <td><%= rs.getInt("age") %></td>
        <td><%= rs.getString("gender") %></td>
        <td><%= rs.getString("city") %></td>
    </tr>
<%
        }

        if (!hasData) {
%>
    <tr>
        <td colspan="6">No Users Registered</td>
    </tr>
<%
        }

        con.close();
    } catch (Exception e) {
%>
    <tr>
        <td colspan="6">Error: <%= e.getMessage() %></td>
    </tr>
<%
    }
%>

</table>

<br>
<a href="register.jsp">Register Page</a>

</body>
</html>
