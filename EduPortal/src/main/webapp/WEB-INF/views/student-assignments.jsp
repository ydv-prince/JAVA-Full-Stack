<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Assignments</title>

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

input[type=file] {
	border-radius: 5px;
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
					Courses</a><a href="${pageContext.request.contextPath}/student/allcourses">📚 All Courses</a><a
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
						<span class="navbar-brand mb-0 h5"> 📝 Assignments </span>
					</div>
				</nav>

				<!-- Statistics Row -->
				<div class="row mb-4">
					<div class="col-md-4">
						<div class="card shadow stat-card p-3">
							<h6>Total Assignments</h6>
							<h3>5</h3>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card shadow stat-card p-3">
							<h6>Pending Submissions</h6>
							<h3>2</h3>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card shadow stat-card p-3">
							<h6>Completed</h6>
							<h3>3</h3>
						</div>
					</div>
				</div>

				<!-- Assignment Cards -->
				<div class="row g-4">

					<!-- Assignment 1 -->
					<div class="col-md-6">
						<div class="card shadow p-3">
							<h5>Java OOP Assignment</h5>
							<p class="text-muted">Submission Deadline: 20 June 2025</p>
							<a href="#" class="btn btn-primary mb-3 w-100">Download
								Assignment</a>
							<form>
								<div class="mb-3">
									<label class="form-label">Upload Your Solution</label> <input
										type="file" class="form-control">
								</div>
								<button type="submit" class="btn btn-success w-100">Submit
									Assignment</button>
							</form>
						</div>
					</div>

					<!-- Assignment 2 -->
					<div class="col-md-6">
						<div class="card shadow p-3">
							<h5>Web Development Project</h5>
							<p class="text-muted">Submission Deadline: 25 June 2025</p>
							<a href="#" class="btn btn-primary mb-3 w-100">Download
								Assignment</a>
							<form>
								<div class="mb-3">
									<label class="form-label">Upload Your Solution</label> <input
										type="file" class="form-control">
								</div>
								<button type="submit" class="btn btn-success w-100">Submit
									Assignment</button>
							</form>
						</div>
					</div>

				</div>
				<!-- End Assignment Row -->

			</div>
		</div>
	</div>

</body>
</html>