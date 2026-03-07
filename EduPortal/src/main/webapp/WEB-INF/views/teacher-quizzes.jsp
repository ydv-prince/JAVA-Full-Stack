<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Teacher Quiz Management</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background-color: #f4f6f9;
}

.sidebar {
	height: 100vh;
	background-color: #1e1e2f;
	padding-top: 20px;
}

.sidebar a {
	color: white;
	display: block;
	padding: 12px 20px;
	text-decoration: none;
}

.sidebar a:hover {
	background-color: #2e2e3e;
}

.sidebar .active {
	background-color: #343a40;
}

.card {
	border-radius: 12px;
}
</style>
</head>

<body>

	<!-- ===== NAVBAR ===== -->
	<nav class="navbar navbar-dark bg-dark">
		<div class="container-fluid">
			<span class="navbar-brand">👨‍🏫 Teacher Dashboard</span>

		</div>
	</nav>

	<div class="container-fluid">
		<div class="row">

			<!-- ===== SIDEBAR ===== -->
			<div class="col-md-2 sidebar">
				<h5 class="text-center text-white">Menu</h5>
				<hr class="text-white">

				<a href="${pageContext.request.contextPath}/teacher">🏠
					Dashboard</a> <a
					href="${pageContext.request.contextPath}/teacher/courses">📚 My
					Courses</a> <a
					href="${pageContext.request.contextPath}/teacher/add-course">➕
					Add Course</a> <a
					href="${pageContext.request.contextPath}/teacher/students">👥
					Students</a> <a
					href="${pageContext.request.contextPath}/teacher/assignments">📝
					Assignments</a> <a
					href="${pageContext.request.contextPath}/teacher/quizzes"
					class="active">🧠 Quizzes</a> <a
					href="${pageContext.request.contextPath}/teacher/profile">👤
					Profile</a> <a href="${pageContext.request.contextPath}/login">🚪
					Logout</a>
			</div>

			<!-- ===== MAIN CONTENT ===== -->
			<div class="col-md-10 p-4">

				<h4 class="mb-4">🧠 Quiz Management</h4>

				<!-- ================= CREATE QUIZ ================= -->
				<div class="card shadow mb-4">
					<div class="card-header bg-dark text-white">Create New Quiz</div>

					<div class="card-body">
						<form
							action="${pageContext.request.contextPath}/teacher/save-quiz"
							method="post">

							<div class="mb-3">
								<label class="form-label fw-bold">Quiz Title</label> <input
									type="text" name="title" class="form-control" required>
							</div>

							<div class="mb-3">
								<label class="form-label fw-bold">Total Marks</label> <input
									type="number" name="totalMarks" class="form-control" required>
							</div>

							<div class="mb-3">
								<label class="form-label fw-bold">Duration (Minutes)</label> <input
									type="number" name="duration" class="form-control" required>
							</div>

							<button type="submit" class="btn btn-success">💾 Save
								Quiz</button>
						</form>
					</div>
				</div>


				<!-- ================= QUIZ LIST ================= -->
				<div class="card shadow mb-4">
					<div class="card-header bg-primary text-white">📋 My Quizzes
					</div>

					<div class="card-body">
						<table class="table table-bordered">
							<thead class="table-light">
								<tr>
									<th>Title</th>
									<th>Total Marks</th>
									<th>Duration</th>
									<th width="200">Action</th>
								</tr>
							</thead>

							<tbody>
								<tr>
									<td>Java Basics Quiz</td>
									<td>50</td>
									<td>30 mins</td>
									<td><a
										href="${pageContext.request.contextPath}/teacher/quiz/1"
										class="btn btn-sm btn-info">Manage Questions</a>
										<button class="btn btn-sm btn-danger">Delete</button></td>
								</tr>
							</tbody>

						</table>
					</div>
				</div>


				<!-- ================= ADD QUESTION (Selected Quiz) ================= -->
				<div class="card shadow mb-4">
					<div class="card-header bg-secondary text-white">➕ Add
						Question (For Selected Quiz)</div>

					<div class="card-body">

						<form
							action="${pageContext.request.contextPath}/teacher/save-question"
							method="post">

							<!-- Hidden quizId -->
							<input type="hidden" name="quizId" value="1">

							<div class="mb-3">
								<label class="form-label fw-bold">Question</label>
								<textarea name="question" class="form-control" rows="3" required></textarea>
							</div>

							<div class="row">
								<div class="col-md-6 mb-3">
									<label>Option A</label> <input type="text" name="optionA"
										class="form-control" required>
								</div>

								<div class="col-md-6 mb-3">
									<label>Option B</label> <input type="text" name="optionB"
										class="form-control" required>
								</div>

								<div class="col-md-6 mb-3">
									<label>Option C</label> <input type="text" name="optionC"
										class="form-control" required>
								</div>

								<div class="col-md-6 mb-3">
									<label>Option D</label> <input type="text" name="optionD"
										class="form-control" required>
								</div>
							</div>

							<div class="mb-3">
								<label class="form-label fw-bold">Correct Answer</label> <select
									name="correctAnswer" class="form-select">
									<option value="A">Option A</option>
									<option value="B">Option B</option>
									<option value="C">Option C</option>
									<option value="D">Option D</option>
								</select>
							</div>

							<button type="submit" class="btn btn-success">➕ Add
								Question</button>
						</form>

					</div>
				</div>

			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>