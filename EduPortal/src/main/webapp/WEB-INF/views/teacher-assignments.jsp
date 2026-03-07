<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Assignments | Teacher Panel</title>

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

	<!-- ✅ Top Navbar -->
	<nav class="navbar navbar-dark bg-dark">
		<div class="container-fluid">
			<span class="navbar-brand">👨‍🏫 Teacher Dashboard</span>

		</div>
	</nav>

	<div class="container-fluid">
		<div class="row">

			<!-- ✅ Sidebar -->
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
					href="${pageContext.request.contextPath}/teacher/assignments"
					class="active">📝 Assignments</a> <a
					href="${pageContext.request.contextPath}/teacher/quizzes">🧠
					Quizzes</a> <a
					href="${pageContext.request.contextPath}/teacher/profile">👤
					Profile</a> <a href="${pageContext.request.contextPath}/login">🚪
					Logout</a>
			</div>

			<!-- ✅ Main Content -->
			<div class="col-md-10 p-4">

				<!-- 🔥 Create Assignment -->
				<div class="card shadow mb-4">
					<div class="card-header bg-dark text-white">📝 Create New
						Assignment</div>

					<div class="card-body">
						<form
							action="${pageContext.request.contextPath}/teacher/save-assignment"
							method="post">

							<div class="mb-3">
								<label class="form-label fw-bold">Assignment Title</label> <input
									type="text" name="title" class="form-control" required>
							</div>

							<div class="mb-3">
								<label class="form-label fw-bold">Description</label>
								<textarea name="description" class="form-control" rows="3"
									required></textarea>
							</div>

							<div class="mb-3">
								<label class="form-label fw-bold">Due Date</label> <input
									type="date" name="dueDate" class="form-control" required>
							</div>

							<button type="submit" class="btn btn-warning">💾 Save
								Assignment</button>
						</form>
					</div>
				</div>


				<!-- 🔥 Assignment List -->
				<div class="card shadow mb-4">
					<div class="card-header bg-primary text-white">📋 Assignment
						List</div>

					<div class="card-body">
						<table class="table table-bordered table-hover">
							<thead class="table-light">
								<tr>
									<th>Title</th>
									<th>Due Date</th>
									<th>Status</th>
									<th width="180">Action</th>
								</tr>
							</thead>

							<tbody>
								<tr>
									<td>Java OOPS Assignment</td>
									<td>20 Feb 2026</td>
									<td><span class="badge bg-success">Active</span></td>
									<td>
										<button class="btn btn-sm btn-primary">Edit</button>
										<button class="btn btn-sm btn-danger">Delete</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>


				<!-- 🔥 Student Submissions (Teacher View Only) -->
				<div class="card shadow">
					<div class="card-header bg-success text-white">📥 Student
						Submissions</div>

					<div class="card-body">

						<table class="table table-bordered">
							<thead class="table-light">
								<tr>
									<th>Student Name</th>
									<th>Assignment</th>
									<th>File</th>
									<th>Submitted Date</th>
									<th>Marks</th>
									<th width="180">Action</th>
								</tr>
							</thead>

							<tbody>
								<tr>
									<td>Rahul Sharma</td>
									<td>Java OOPS Assignment</td>
									<td>rahul_oops.pdf</td>
									<td>15 Feb 2026</td>
									<td><input type="number"
										class="form-control form-control-sm" style="width: 80px;"
										placeholder="Marks"></td>
									<td><a href="#" class="btn btn-sm btn-primary">Download</a>
										<button class="btn btn-sm btn-success">Save Marks</button></td>
								</tr>
							</tbody>

						</table>

					</div>
				</div>

			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>