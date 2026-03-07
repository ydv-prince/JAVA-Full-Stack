<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<title>Login - EduPortal</title>

<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	font-family: 'Segoe UI', Arial, sans-serif;
	background: linear-gradient(135deg, #4e73df, #1cc88a);
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.login-box {
	background: #ffffff;
	padding: 40px;
	width: 400px;
	border-radius: 12px;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
}

.form-control:focus {
	border-color: #4e73df;
	box-shadow: 0 0 5px rgba(78, 115, 223, 0.4);
}

.login-btn {
	background: #4e73df;
	color: white;
	font-weight: 600;
}

.login-btn:hover {
	background: #2e59d9;
}

.role-icon {
	font-size: 50px;
	text-align: center;
	margin-bottom: 15px;
}
</style>
</head>

<body>

	<div class="login-box">

		<div class="role-icon">🎓</div>
		<h3 class="text-center mb-4">EduPortal Login</h3>



		<form action="${pageContext.request.contextPath}/login" method="post">

			<div class="mb-3">
				<label class="form-label">Select Role</label> <select name="role"
					class="form-select" required>
					<option value="">-- Select Role --</option>
					<option value="student">Student</option>
					<option value="teacher">Teacher</option>
					<option value="admin">Admin</option>
				</select>
			</div>

			<div class="mb-3">
				<label class="form-label">Email Address</label> <input type="email"
					name="email" class="form-control" placeholder="Enter your email"
					required />
			</div>

			
			<div class="mb-3">
    <label class="form-label">Password</label>
    <input type="password" name="password" class="form-control" placeholder="Enter your password" required />
    <!-- Forgot password link -->
   <small class="d-block text-end mt-1">
        <a href="${pageContext.request.contextPath}/forget">Forgot Password?</a>
    </small>
</div>

			<button type="submit" class="btn login-btn w-100">Login</button>

		</form>

		<div class="text-center mt-3">
			Don't have an account? <a
				href="${pageContext.request.contextPath}/register">Register Here</a>
		</div>

		<div class="text-center mt-2">
			<a href="${pageContext.request.contextPath}/">← Back to Home</a>
		</div>

	</div>

</body>
</html>