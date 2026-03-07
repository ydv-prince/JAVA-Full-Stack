<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>My Courses</title>
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

.stat-card {
	border-left: 5px solid #0d6efd;
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
					Courses</a><a href="${pageContext.request.contextPath}/student/allcourses">📚 All Courses</a> <a
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
						<span class="navbar-brand mb-0 h5">📚 My Courses</span>
					</div>
				</nav>

				<!-- Statistics Row -->
				<div class="row mb-4">
					<div class="col-md-4">
						<div class="card shadow stat-card p-3">
							<h6>Total Courses</h6>
							<h3>3</h3>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card shadow stat-card p-3">
							<h6>Completed</h6>
							<h3>1</h3>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card shadow stat-card p-3">
							<h6>In Progress</h6>
							<h3>2</h3>
						</div>
					</div>
				</div>

				<!-- Courses Row -->
				<div class="row g-4">

					<!-- Course 1 -->
					<div class="col-md-4">
						<div class="card shadow text-center p-3">
							<h5>Java Programming</h5>
							<p>Duration: 8 Weeks</p>
							<div class="progress mb-3">
								<div class="progress-bar bg-success" style="width: 70%"></div>
							</div>
							<a href="course-details.jsp" class="btn btn-primary w-100">Continue</a>
						</div>
					</div>

					<!-- Course 2 -->
					<div class="col-md-4">
						<div class="card shadow text-center p-3">
							<h5>Web Development</h5>
							<p>Duration: 6 Weeks</p>
							<div class="progress mb-3">
								<div class="progress-bar bg-warning" style="width: 40%"></div>
							</div>
							<a href="course-details.jsp" class="btn btn-primary w-100">Continue</a>
						</div>
					</div>

					<!-- Course 3 -->
					<div class="col-md-4">
						<div class="card shadow text-center p-3">
							<h5>Spring Framework</h5>
							<p>Duration: 5 Weeks</p>
							<div class="progress mb-3">
								<div class="progress-bar bg-danger" style="width: 20%"></div>
							</div>
							<a href="course-details.jsp" class="btn btn-primary w-100">Continue</a>
						</div>
					</div>

				</div>
				<!-- End Courses Row -->

			</div>
		</div>
	</div>

</body>
</html>