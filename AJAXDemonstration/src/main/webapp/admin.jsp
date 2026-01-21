<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Panel</title>
    <script>
        function loadUsers() {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "ActivateUserServlet", true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    document.getElementById("users").innerHTML = xhr.responseText;
                }
            };
            xhr.send();
        }
        setInterval(loadUsers, 2000);
    </script>
</head>
<body onload="loadUsers()">
    <h2>Admin Dashboard</h2>
    <h3>Currently Logged-in Users</h3>
    <ul id="users"></ul>
</body>
</html>