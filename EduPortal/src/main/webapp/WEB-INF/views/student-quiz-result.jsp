<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Quiz Result</title>
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

.result-card {
	border-radius: 15px;
	padding: 40px 20px;
}

.score {
	font-size: 50px;
	font-weight: bold;
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
						<span class="navbar-brand mb-0 h5">🧠 Quiz Result</span>
					</div>
				</nav>

				<!-- Result Card -->
				<div class="card shadow text-center result-card">
					<div class="card-body">

						<p class="score text-success">8 / 10</p>
						<p class="text-muted">You scored 80%</p>
						<hr>
						<p>
							<strong>Status:</strong> <span class="badge bg-success">Passed</span>
						</p>
						<p>Great job! Keep improving your skills 🚀</p>

						<!--  <a href="student-quiz.jsp" class="btn btn-primary mt-3 w-50"> Retake Quiz </a> -->

					</div>
				</div>

			</div>
		</div>
	</div>

</body>
</html>