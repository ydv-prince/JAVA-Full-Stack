<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>My Certificates</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background-color: #f4f6f9;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.sidebar {
	height: 100vh;
	background-color: #212529;
	padding-top: 20px;
}

.sidebar a {
	color: white;
	display: block;
	padding: 12px;
	text-decoration: none;
	border-radius: 5px;
	margin: 5px 10px;
}

.sidebar a:hover {
	background-color: #0d6efd;
}

.card:hover {
	transform: scale(1.02);
	transition: 0.3s;
}

.certificate-card {
	border: 2px solid #0d6efd;
	border-radius: 15px;
	padding: 20px;
}

.certificate-title {
	font-size: 28px;
	font-weight: bold;
	color: #0d6efd;
}

.btn-custom {
	border-radius: 50px;
	padding: 8px 25px;
}
</style>
</head>

<body>

	<div class="container-fluid">
		<div class="row">

			<!-- Sidebar -->
			<div class="col-md-2 sidebar">
				<h4 class="text-center text-white">🎓 Student Panel</h4>
				<hr class="text-white">
				<a href="${pageContext.request.contextPath}/student">🏠
					Dashboard</a> <a
					href="${pageContext.request.contextPath}/student/courses">📚 My
					Courses</a> <a href="${pageContext.request.contextPath}/student/allcourses">📚 All Courses</a><a
					href="${pageContext.request.contextPath}/student/assignments">📝
					Assignments</a> <a
					href="${pageContext.request.contextPath}/student/quiz">🧠 Quiz</a>
				<a href="${pageContext.request.contextPath}/student/progress">📊
					Progress</a> <a
					href="${pageContext.request.contextPath}/student/certificate">🎓
					Certificate</a> <a
					href="${pageContext.request.contextPath}/student/profile">👤
					Profile</a> <a href="${pageContext.request.contextPath}/login">🚪
					Logout</a>
			</div>

			<!-- Main Content -->
			<div class="col-md-10 p-4">

				<!-- Top Navbar -->
				<nav class="navbar navbar-light bg-white shadow-sm mb-4">
					<div class="container-fluid">
						<span class="navbar-brand mb-0 h5">🎓 My Certificates</span>
					</div>
				</nav>

				<!-- Statistics Row -->
				<div class="row mb-4">
					<div class="col-md-4">
						<div class="card shadow stat-card p-3">
							<h6>Total Courses Completed</h6>
							<h3>3</h3>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card shadow stat-card p-3">
							<h6>Certificates Earned</h6>
							<h3>2</h3>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card shadow stat-card p-3">
							<h6>Pending Certificates</h6>
							<h3>1</h3>
						</div>
					</div>
				</div>

				<!-- Certificates Cards -->
				<div class="row g-4">

					<!-- Certificate 1 -->
					<div class="col-md-6">
						<div class="card shadow certificate-card text-center p-4">
							<div class="certificate-title mb-3">Certificate of
								Completion</div>
							<p>This is to certify that</p>
							<h4 class="text-primary">Rahul Kumar</h4>
							<p>has successfully completed the course</p>
							<h5>Java Programming</h5>
							<p class="mt-3">Date: 14 June 2025</p>
							<a href="#" class="btn btn-success btn-custom mt-3 w-100">Download
								Certificate</a>
						</div>
					</div>

					<!-- Certificate 2 -->
					<div class="col-md-6">
						<div class="card shadow certificate-card text-center p-4">
							<div class="certificate-title mb-3">Certificate of
								Completion</div>
							<p>This is to certify that</p>
							<h4 class="text-primary">Rahul Kumar</h4>
							<p>has successfully completed the course</p>
							<h5>Web Development</h5>
							<p class="mt-3">Date: 25 June 2025</p>
							<a href="#" class="btn btn-success btn-custom mt-3 w-100">Download
								Certificate</a>
						</div>
					</div>

				</div>
				<!-- End Certificate Row -->

			</div>
		</div>
	</div>

</body>
</html>