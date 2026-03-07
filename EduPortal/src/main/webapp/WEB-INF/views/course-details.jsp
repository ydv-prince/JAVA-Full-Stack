<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<title>Java Programming Course</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #eef2f7;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.card {
	border-radius: 12px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s, box-shadow 0.3s;
}

.card:hover {
	transform: translateY(-5px);
	box-shadow: 0 12px 25px rgba(0, 0, 0, 0.15);
}

.video-container {
	border-radius: 12px;
	overflow: hidden;
	margin-bottom: 15px;
}

.module-item {
	padding: 12px;
	border-bottom: 1px solid #ddd;
	border-radius: 6px;
	transition: background-color 0.3s;
	cursor: default;
}

.module-item:hover {
	background-color: #f1f8ff;
}

.enroll-box {
	background: linear-gradient(135deg, #36b9cc, #1cc88a);
	color: white;
	border-radius: 12px;
	padding: 25px 15px;
	text-align: center;
	margin-top: 20px;
}

.enroll-box h5 {
	margin-bottom: 10px;
}

.progress {
	height: 20px;
	border-radius: 10px;
	background-color: #d9e6f2;
}

.progress-bar {
	font-weight: 500;
	font-size: 0.9rem;
}

.btn-custom {
	border-radius: 50px;
	padding: 8px 25px;
}

.back-btn {
	margin-bottom: 25px;
}
/* Footer */
.footer {
    background-color: #212529;
    color: white;
    padding: 25px;
    text-align: center;
    margin-top: 50px;
}
</style>
</head>

<body>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
		<div class="container">
			<a class="navbar-brand fw-bold" href="#">EduPortal</a>

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/">Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/course">Courses</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/about">About</a></li>
					<li class="nav-item ms-2"><a class="btn btn-primary"
						href="${pageContext.request.contextPath}/login">Login</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container mt-4">



		<!-- Course Header -->
		<div class="card mb-4 p-4">
			<h2 class="mb-2">Java Programming</h2>
			<p class="text-muted">Learn core Java concepts including OOP,
				Collections, Exception Handling, and Multithreading.</p>
			<div class="progress mt-3">
				<div class="progress-bar bg-success" role="progressbar"
					style="width: 70%;">70% Completed</div>
			</div>
		</div>

		<div class="row g-4">

			<!-- Left Side - Video Preview -->
			<div class="col-lg-8">
				<div class="card p-3">
					<h5 class="mb-3">📺 Course Preview</h5>
					<div class="video-container">
						<iframe width="100%" height="400"
							src="https://www.youtube.com/embed/eIrMbAQSU34"
							title="Java Tutorial" frameborder="0" allowfullscreen> </iframe>
					</div>
				</div>
			</div>

			<!-- Right Side - Modules & Enroll -->
			<div class="col-lg-4">
				<div class="card p-3 mb-3">
					<h5 class="mb-3">📚 Course Modules</h5>
					<div class="module-item">✔ Introduction to Java</div>
					<div class="module-item">✔ Variables & Data Types</div>
					<div class="module-item">✔ OOP Concepts</div>
					<div class="module-item">✔ Exception Handling</div>
					<div class="module-item">✔ Collections Framework</div>
					<div class="module-item">✔ Multithreading</div>
				</div>

				<div class="enroll-box">
					<h5>Want Full Access?</h5>
					<p>Login or Register to access assignments & quizzes.</p>
					<a href="login" class="btn btn-light btn-custom mb-2">Login</a> <br>
					<a href="register" class="btn btn-dark btn-custom">Register</a>
				</div>
			</div>

		</div>

		<!-- Assignment & Quiz Preview -->
		<div class="row g-4 mt-1">

			<div class="col-md-6">
				<div class="card p-4 text-center">
					<h5>📝 Assignment</h5>
					<p class="text-muted">Login required to download assignment.</p>
					<a href="login" class="btn btn-primary btn-custom">Login to
						Download</a>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card p-4 text-center">
					<h5>🧠 Take Quiz</h5>
					<p class="text-muted">Login required to attempt quiz.</p>
					<a href="login" class="btn btn-success btn-custom">Login to
						Start Quiz</a>
				</div>
			</div>

		</div>

	</div>
	<!-- Footer -->
<div class="footer">
    <p>© 2026 EduPortal | Designed by Rahul 🚀</p>
</div>
	
	<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>