<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Teacher Dashboard</title>

<!-- Bootstrap CSS -->
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
	font-size: 15px;
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

.card:hover {
	transform: scale(1.02);
	transition: 0.3s;
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

				<a href="teacher" class="active">🏠 Dashboard</a> <a
					href="teacher/courses">📚 My Courses</a> <a
					href="teacher/add-course">➕ Add Course</a> <a
					href="teacher/students">👥 Students</a> <a
					href="teacher/assignments">📝 Assignments</a> <a
					href="teacher/quizzes">🧠 Quizzes</a> <a href="teacher/profile">👤
					Profile</a> <a href="login">🚪 Logout</a>
			</div>

			<!-- ✅ Main Content -->
			<div class="col-md-10 p-4">

				<!-- Welcome Bar -->
				<div class="mb-4">
					<h4>Welcome, Teacher 👋</h4>
					<p class="text-muted">Here is your teaching overview</p>
				</div>

				<!-- ✅ Stats Cards -->
				<div class="row mb-4">

					<div class="col-md-3">
						<div class="card bg-primary text-white shadow p-3">
							<h6>Total Courses</h6>
							<h3>5</h3>
						</div>
					</div>

					<div class="col-md-3">
						<div class="card bg-success text-white shadow p-3">
							<h6>Total Students</h6>
							<h3>120</h3>
						</div>
					</div>

					<div class="col-md-3">
						<div class="card bg-warning text-dark shadow p-3">
							<h6>Assignments</h6>
							<h3>8</h3>
						</div>
					</div>

					<div class="col-md-3">
						<div class="card bg-info text-white shadow p-3">
							<h6>Quizzes</h6>
							<h3>4</h3>
						</div>
					</div>

				</div>

				<!-- ✅ Quick Actions -->
				<div class="row mb-4">

					<div class="col-md-4">
						<div class="card shadow p-3 text-center">
							<h5>Add New Course</h5>
							<a href="teacher/add-course" class="btn btn-success mt-2">Create</a>
						</div>
					</div>

					<div class="col-md-4">
						<div class="card shadow p-3 text-center">
							<h5>Create Assignment</h5>
							<a href="teacher/assignments" class="btn btn-warning mt-2">Manage</a>
						</div>
					</div>

					<div class="col-md-4">
						<div class="card shadow p-3 text-center">
							<h5>Create Quiz</h5>
							<a href="teacher/quizzes" class="btn btn-info mt-2">Manage</a>
						</div>
					</div>

				</div>

				<!-- ✅ Course Table -->
				<div class="card shadow">
					<div class="card-header bg-dark text-white">My Courses</div>

					<div class="card-body">

						<table class="table table-bordered table-hover">
							<thead class="table-light">
								<tr>
									<th>Course Name</th>
									<th>Students</th>
									<th>Status</th>
									<th width="150">Action</th>
								</tr>
							</thead>

							<tbody>
								<tr>
									<td>Java Programming</td>
									<td>50</td>
									<td><span class="badge bg-success">Active</span></td>
									<td>
										<button class="btn btn-sm btn-primary">Edit</button>
										<button class="btn btn-sm btn-danger">Delete</button>
									</td>
								</tr>

								<tr>
									<td>Web Development</td>
									<td>40</td>
									<td><span class="badge bg-success">Active</span></td>
									<td>
										<button class="btn btn-sm btn-primary">Edit</button>
										<button class="btn btn-sm btn-danger">Delete</button>
									</td>
								</tr>

								<tr>
									<td>Spring Boot</td>
									<td>30</td>
									<td><span class="badge bg-warning text-dark">Draft</span></td>
									<td>
										<button class="btn btn-sm btn-primary">Edit</button>
										<button class="btn btn-sm btn-danger">Delete</button>
									</td>
								</tr>
							</tbody>

						</table>

					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>