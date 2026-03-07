<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EduPortal - E Learning Platform</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<style>

body {
    background-color: #f8f9fa;
}

/* Hero Section */
.hero {
    background: linear-gradient(135deg, #4e73df, #1cc88a);
    color: white;
    padding: 100px 20px;
    text-align: center;
}

.hero h1 {
    font-size: 48px;
    font-weight: bold;
}

.hero p {
    font-size: 20px;
}

/* Course Card */
.course-card {
    transition: 0.4s;
    border-radius: 15px;
}

.course-card:hover {
    transform: translateY(-10px);
}

/* About Section */
.about-section {
    background-color: white;
    padding: 60px 20px;
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
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/">Home</a></li>
    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/course">Courses</a></li>
    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/about">About</a></li>
    <li class="nav-item ms-2"><a class="btn btn-primary" href="${pageContext.request.contextPath}/login">Login</a></li>
</ul>
    </div>
  </div>
</nav>

<!-- Hero Section -->
<section class="hero">
    <div class="container">
        <h1>Learn Anytime, Anywhere 🚀</h1>
        <p>Upgrade your skills with our professional online courses</p>
        <a href="${pageContext.request.contextPath}/courses" class="btn btn-light btn-lg mt-3 px-5">Explore Courses</a>
    </div>
</section>

<!-- Courses Section -->
<div class="container mt-5">
    <h2 class="text-center mb-5 fw-bold">Popular Courses</h2>
    <div class="row g-4">

        <div class="col-md-4">
            <div class="card shadow course-card p-4 text-center">
                <i class="bi bi-cup-hot fs-1 text-primary"></i>
                <h5 class="mt-3">Java Programming</h5>
                <p>Master Core Java, OOPs & Advanced Concepts.</p>
					<a href="${pageContext.request.contextPath}/login"
						class="btn btn-primary">Enroll Now</a>
				</div>
        </div>

        <div class="col-md-4">
            <div class="card shadow course-card p-4 text-center">
                <i class="bi bi-code-slash fs-1 text-success"></i>
                <h5 class="mt-3">Web Development</h5>
                <p>HTML, CSS, JavaScript & Bootstrap complete guide.</p>
                <a href="${pageContext.request.contextPath}/login" class="btn btn-primary">Enroll Now</a>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card shadow course-card p-4 text-center">
                <i class="bi bi-layers fs-1 text-danger"></i>
                <h5 class="mt-3">Spring Framework</h5>
                <p>Build powerful enterprise-level applications.</p>
                <a href="${pageContext.request.contextPath}/login" class="btn btn-primary">Enroll Now</a>
            </div>
        </div>

    </div>
</div>

<!-- About Section -->
<section class="about-section mt-5">
    <div class="container text-center">
        <h2 class="fw-bold mb-3">Why Choose Us?</h2>
        <p class="lead">
            We provide industry-level training with practical projects and certification.
        </p>
    </div>
</section>

<!-- Footer -->
<div class="footer">
    <p>© 2026 EduPortal | Designed by Rahul 🚀</p>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>