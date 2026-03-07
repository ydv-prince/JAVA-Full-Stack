<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Admin - Edit Quiz</title>
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
	background-color: #111827;
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
	background-color: #1f2937;
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
				<h4 class="text-center text-white">Admin Panel</h4>
				<hr class="text-white">
				<a href="admin">🏠 Dashboard</a> <a href="admin-manage-students">👨‍🎓
					Manage Students</a> <a href="admin-manage-teachers">👨‍🏫 Manage
					Teachers</a> <a href="admin-manage-courses">📚 Manage Courses</a> <a
					href="admin-manage-assignments">📝 Manage Assignments</a> <a
					href="admin-manage-quizzes" class="bg-primary">🧠 Manage
					Quizzes</a> <a href="admin-manage-payments">💰 Payments</a> <a
					href="admin-reports">📊 Reports</a> <a href="admin-settings">⚙
					Settings</a> <a href="login">🚪 Logout</a>
			</div>

			<!-- Main Content -->
			<div class="col-md-10 p-4">

				<nav class="navbar navbar-light bg-white shadow-sm mb-4">
					<div class="container-fluid">
						<span class="navbar-brand mb-0 h5">✏ Edit Quiz</span>
					</div>
				</nav>

				<!-- Edit Quiz Form -->
				<div class="card shadow p-4">

					<form action="update-quiz" method="post">

						<!-- Hidden ID -->
						<input type="hidden" name="id" value="${quiz.id}">

						<div class="mb-3">
							<label class="form-label">Quiz Title</label> <input type="text"
								name="title" class="form-control" value="${quiz.title}" required>
						</div>

						<div class="mb-3">
							<label class="form-label">Select Course</label> <select
								name="courseId" class="form-select" required>
								<c:forEach var="course" items="${courseList}">
									<option value="${course.id}"
										${course.id == quiz.courseId ? 'selected' : ''}>
										${course.name}</option>
								</c:forEach>
							</select>
						</div>

						<div class="mb-3">
							<label class="form-label">Total Questions</label> <input
								type="number" name="totalQuestions" class="form-control"
								value="${quiz.totalQuestions}" required>
						</div>

						<div class="mb-3">
							<label class="form-label">Total Marks</label> <input
								type="number" name="totalMarks" class="form-control"
								value="${quiz.totalMarks}" required>
						</div>

						<div class="mb-3">
							<label class="form-label">Duration (Minutes)</label> <input
								type="number" name="duration" class="form-control"
								value="${quiz.duration}" required>
						</div>

						<div class="mb-3">
							<label class="form-label">Status</label> <select name="status"
								class="form-select" required>
								<option value="active"
									${quiz.status == 'active' ? 'selected' : ''}>Active</option>
								<option value="inactive"
									${quiz.status == 'inactive' ? 'selected' : ''}>
									Inactive</option>
							</select>
						</div>

						<button type="submit" class="btn btn-primary btn-custom w-100">
							Update Quiz</button>

					</form>

				</div>

			</div>
		</div>
	</div>

</body>
</html>