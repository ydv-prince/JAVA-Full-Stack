<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<title>Register - EduPortal</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background: linear-gradient(135deg, #4e73df, #1cc88a);
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.register-container {
	background: #ffffff;
	padding: 40px;
	width: 420px;
	border-radius: 12px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
	animation: fadeIn 0.6s ease-in-out;
}

h2 {
	text-align: center;
	margin-bottom: 25px;
	color: #333;
}

label {
	font-size: 14px;
	font-weight: 600;
	color: #555;
}

input, select {
	width: 100%;
	padding: 10px;
	margin-top: 5px;
	margin-bottom: 15px;
	border-radius: 6px;
	border: 1px solid #ccc;
	transition: 0.3s;
}

input:focus, select:focus {
	border-color: #4e73df;
	outline: none;
}

.gender-group {
	display: flex;
	justify-content: space-between;
	margin-bottom: 15px;
}

.gender-group label {
	font-weight: normal;
	font-size: 14px;
}

.gender-group input {
	width: auto;
	margin-right: 5px;
}

button {
	width: 100%;
	padding: 12px;
	background: #4e73df;
	color: white;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	font-size: 16px;
	transition: 0.3s;
}

button:hover {
	background: #2e59d9;
}

.link-text {
	text-align: center;
	margin-top: 15px;
	font-size: 14px;
}

.link-text a {
	text-decoration: none;
	color: #4e73df;
	font-weight: 600;
}

.link-text a:hover {
	text-decoration: underline;
}

@
keyframes fadeIn {from { opacity:0;
	transform: translateY(-10px);
}

to {
	opacity: 1;
	transform: translateY(0);
}
}
</style>
</head>
<body>

	<div class="register-container">

		<h2>Create Account</h2>

		<form action="${pageContext.request.contextPath}/registerUser"
			method="post">

			<label>Select Role</label> <select name="role" required>
				<option value="">-- Select Role --</option>
				<option value="student">Student</option>
				<option value="teacher">Teacher</option>
			</select> <label>Full Name</label> <input type="text" name="name"
				placeholder="Enter your full name" required /> <label>Email</label>
			<input type="email" name="email" placeholder="Enter your email"
				required /> <label>Password</label> <input type="password"
				name="password" placeholder="Create password" required /> <label>Gender</label>
			<div class="gender-group">
				<label><input type="radio" name="gender" value="Male"
					required> Male</label> <label><input type="radio"
					name="gender" value="Female"> Female</label> <label><input
					type="radio" name="gender" value="Other"> Other</label>
			</div>

			<label>Mobile Number</label> <input type="text" name="mobile"
				placeholder="Enter mobile number" required />

			<button type="submit">Register</button>

		</form>

		<div class="link-text">
			Already have an account? <a
				href="${pageContext.request.contextPath}/login">Login Here</a>
		</div>


		<div class="link-text home-link">
			<a href="${pageContext.request.contextPath}/">← Back to Home</a>
		</div>

	</div>

</body>
</html>