<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<title>About Us</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #eef2f7;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.about-header {
	background: linear-gradient(135deg, #36b9cc, #1cc88a);
	color: white;
	padding: 80px 20px;
	text-align: center;
	border-radius: 12px;
	margin-bottom: 40px;
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

.team-member img {
	border-radius: 50%;
	width: 150px;
	height: 150px;
	object-fit: cover;
}

.team-member h5 {
	margin-top: 15px;
	font-weight: 600;
}

.team-member p {
	color: #555;
}

.btn-custom {
	border-radius: 50px;
	padding: 8px 25px;
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

	<div class="container mt-5">

		<!-- Header -->
		<div class="about-header">
			<h1>About EduPortal</h1>
			<p>Your online learning platform for coding, web development, and
				more.</p>
		</div>

		<!-- About Section -->
		<div class="row mb-5">
			<div class="col-md-6">
				<h3>Our Mission</h3>
				<p>EduPortal aims to provide high-quality online courses that
					help learners develop new skills, enhance their knowledge, and
					advance their careers. We focus on practical learning with
					interactive content and real-world projects.</p>
			</div>
			<div class="col-md-6">
				<h3>Our Vision</h3>
				<p>To be a leading e-learning platform that empowers students
					globally to learn at their own pace and succeed in the digital
					world.</p>
			</div>
		</div>

		<!-- Team Section -->
		<h3 class="mb-4 text-center">Our Team</h3>
		<div class="row text-center">
			<div class="col-md-4 mb-4 team-member">
				<div class="card p-3">
					<!-- <img src="assets/images/team1.jpg" alt="Team Member">-->
					<h5>Rahul Yadav</h5>
					<p>Founder & CEO</p>
				</div>
			</div>
			<div class="col-md-4 mb-4 team-member">
				<div class="card p-3">
					<!--  <img src="assets/images/team2.jpg" alt="Team Member"> -->
					<h5>Raj Vardhan Singh</h5>
					<p>Lead Instructor</p>
				</div>
			</div>
			<div class="col-md-4 mb-4 team-member">
				<div class="card p-3">
					<!--<img src="assets/images/team3.jpg" alt="Team Member">-->
					<h5>Prince Yadav</h5>
					<p>Web Developer</p>
				</div>
			</div>
		</div>

		<!-- CTA -->
		<div class="text-center mt-5 mb-5">
			<h4>Ready to Start Learning?</h4>
			<a href="${pageContext.request.contextPath}/course"
				class="btn btn-primary btn-custom mt-3">View Courses</a>
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