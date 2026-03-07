<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Courses Page</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background-color: #f4f6f9;
}

.course-card {
	transition: 0.3s;
}

.course-card:hover {
	transform: scale(1.05);
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

	<div class="container mt-5">

		<h2 class="text-center mb-4">📚 Courses</h2>

		<div class="row">

			<!-- Course 1 -->
			<div class="col-md-4 mb-4">
				<div class="card shadow text-center p-3 course-card">
					<h5>Java Programming</h5>
					<p>Learn Core & Advanced Java.</p>
					<button class="btn btn-primary"
						onclick="window.location.href='login'">Enroll Now</button>
				</div>
			</div>

			<!-- Course 2 -->
			<div class="col-md-4 mb-4">
				<div class="card shadow text-center p-3 course-card">
					<h5>Web Development</h5>
					<p>HTML, CSS, JavaScript full course.</p>
					<button class="btn btn-primary"
						onclick="window.location.href='login'">Enroll Now</button>
				</div>
			</div>

			<!-- Course 3 -->
			<div class="col-md-4 mb-4">
				<div class="card shadow text-center p-3 course-card">
					<h5>Spring Framework</h5>
					<p>Build Java Web Applications.</p>
					<button class="btn btn-primary"
						onclick="window.location.href='login'">Enroll Now</button>
				</div>
			</div>

			<!-- Course 4 -->
			<div class="col-md-6 mb-4">
				<div class="card shadow text-center p-3 course-card">
					<h5>Python Programming</h5>
					<p>Beginner to Advanced Python.</p>
					<button class="btn btn-primary"
						onclick="window.location.href='login'">Enroll Now</button>
				</div>
			</div>

			<!-- Course 5 -->
			<div class="col-md-6 mb-4">
				<div class="card shadow text-center p-3 course-card">
					<h5>Data Structures</h5>
					<p>Master DSA for interviews.</p>
					<button class="btn btn-primary"
						onclick="window.location.href='login'">Enroll Now</button>
				</div>
			</div>

		</div>

	</div>
	

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>