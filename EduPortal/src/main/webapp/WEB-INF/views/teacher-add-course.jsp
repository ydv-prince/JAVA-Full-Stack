<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Course | Teacher Panel</title>

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

	<!-- ===== NAVBAR (Professional Header) ===== -->
	<nav class="navbar navbar-dark bg-dark">
		<div class="container-fluid">
			<span class="navbar-brand">👨‍🏫 Teacher Dashboard</span> <span
				class="text-white">Welcome, ${teacherName}</span>
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
					href="${pageContext.request.contextPath}/teacher/add-course"
					class="active">➕ Add Course</a> <a
					href="${pageContext.request.contextPath}/teacher/students">👥
					Students</a> <a
					href="${pageContext.request.contextPath}/teacher/assignments">📝
					Assignments</a> <a
					href="${pageContext.request.contextPath}/teacher/quizzes">🧠
					Quizzes</a> <a
					href="${pageContext.request.contextPath}/teacher/profile">👤
					Profile</a> <a href="${pageContext.request.contextPath}/login">🚪
					Logout</a>
			</div>

			<!-- ===== MAIN CONTENT ===== -->
			<div class="col-md-10 p-4">

				<div class="row justify-content-center">
					<div class="col-md-8">

						<div class="card shadow-lg">
							<div class="card-header bg-dark text-white">
								<h4 class="mb-0">➕ Add New Course</h4>
							</div>

							<div class="card-body">

								<form
									action="${pageContext.request.contextPath}/teacher/save-course"
									method="post">

									<!-- Course Name -->
									<div class="mb-3">
										<label class="form-label fw-bold">Course Name</label> <input
											type="text" name="courseName" class="form-control"
											placeholder="Enter course name" required>
									</div>

									<!-- Description -->
									<div class="mb-3">
										<label class="form-label fw-bold">Course Description</label>
										<textarea name="description" class="form-control" rows="4"
											placeholder="Enter course description" required></textarea>
									</div>

									<!-- Duration -->
									<div class="mb-3">
										<label class="form-label fw-bold">Duration (Weeks)</label> <input
											type="number" name="duration" class="form-control"
											placeholder="Enter duration in weeks" required>
									</div>

									<!-- Price -->
									<div class="mb-3">
										<label class="form-label fw-bold">Course Price (₹)</label> <input
											type="number" name="price" class="form-control"
											placeholder="Enter course price" required>
									</div>

									<!-- Status -->
									<div class="mb-4">
										<label class="form-label fw-bold">Course Status</label> <select
											name="status" class="form-select">
											<option value="ACTIVE">Active</option>
											<option value="DRAFT">Draft</option>
										</select>
									</div>

									<!-- Buttons -->
									<div class="d-flex justify-content-between">
										<a href="${pageContext.request.contextPath}/teacher/courses"
											class="btn btn-secondary"> ⬅ Back </a>

										<button type="submit" class="btn btn-success">💾 Save
											Course</button>
									</div>

								</form>

							</div>
						</div>

					</div>
				</div>

			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>