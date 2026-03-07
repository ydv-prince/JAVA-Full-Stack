<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<title>Forgot Password - EduPortal</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

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

.forgot-text {
	text-align: center;
	margin-top: 10px;
	font-size: 0.9rem;
}

.forgot-text a {
	color: #4e73df;
	text-decoration: none;
}

.forgot-text a:hover {
	text-decoration: underline;
}
</style>
</head>

<body>

	<div class="login-box">

		<div class="role-icon">🔒</div>
		<h3 class="text-center mb-4">Forgot Password</h3>

		<div class="mb-3">
			<label class="form-label">Enter Your Email</label> 
			<input type="email" class="form-control" placeholder="Enter your registered email" required />
		</div>

		<button type="button" class="btn login-btn w-100"
		        onclick="window.location.href='${pageContext.request.contextPath}/login'">
		    Send Reset Link
		</button>

		<div class="forgot-text mt-3">
			<a href="${pageContext.request.contextPath}/login">← Back to Login</a>
		</div>

		<div class="forgot-text mt-2">
			<a href="${pageContext.request.contextPath}/">← Back to Home</a>
		</div>

	</div>

</body>
</html>