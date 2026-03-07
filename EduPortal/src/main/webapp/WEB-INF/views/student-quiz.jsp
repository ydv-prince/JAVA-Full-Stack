<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Java Quiz</title>
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
						<span class="navbar-brand mb-0 h5">🧠 Java Quiz</span>
					</div>
				</nav>

				<!-- Quiz Card -->
				<div class="card shadow p-4">

					<!-- Form with redirect to student-quiz-result.jsp -->
					<form
						action="${pageContext.request.contextPath}/student/quiz-result"
						method="get">

						<!-- Question 1 -->
						<div class="mb-4">
							<h6>1. Java is?</h6>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="q1" id="q1a"
									value="Programming Language"> <label
									class="form-check-label" for="q1a">Programming Language</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="q1" id="q1b"
									value="Operating System"> <label
									class="form-check-label" for="q1b">Operating System</label>
							</div>
						</div>

						<!-- Question 2 -->
						<div class="mb-4">
							<h6>2. OOP stands for?</h6>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="q2" id="q2a"
									value="Object Oriented Programming"> <label
									class="form-check-label" for="q2a">Object Oriented
									Programming</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="q2" id="q2b"
									value="Only One Program"> <label
									class="form-check-label" for="q2b">Only One Program</label>
							</div>
						</div>

						<!-- Question 3 -->
						<div class="mb-4">
							<h6>3. Which is not a primitive type?</h6>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="q3" id="q3a"
									value="int"> <label class="form-check-label" for="q3a">int</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="q3" id="q3b"
									value="String"> <label class="form-check-label"
									for="q3b">String</label>
							</div>
						</div>

						<!-- Submit Button -->
						<button type="submit" class="btn btn-success btn-custom w-100">
							Submit Quiz</button>

					</form>

				</div>

			</div>
		</div>
	</div>

</body>
</html>