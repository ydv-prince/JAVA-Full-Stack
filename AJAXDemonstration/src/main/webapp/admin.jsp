<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
<script>
function loadUsers() {
    // ✅ Corrected XMLHttpRequest spelling
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "ActivateUserServlet", true);
    xhr.onreadystatechange = function() {
        // ✅ Corrected readyState capitalization
        if (xhr.readyState === 4 && xhr.status === 200) {
            document.getElementById("users").innerHTML = xhr.responseText;
        }
    };
    xhr.send();
}
// ✅ Will call loadUsers every 10 seconds
setInterval(loadUsers, 1000 * 10);
</script>
</head>
<body onload="loadUsers()">
<h2>Admin Panel</h2>
<h3>Currently active users</h3>
<ul id="users">
    ${user}
</ul>
</body>
</html>