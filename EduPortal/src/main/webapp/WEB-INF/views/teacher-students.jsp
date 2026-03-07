<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Manage Students | Teacher Panel</title>

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
					href="${pageContext.request.contextPath}/teacher/assignments">📝
					Assignments</a> <a
					href="${pageContext.request.contextPath}/teacher/quizzes">🧠
					Quizzes</a> <a
					href="${pageContext.request.contextPath}/teacher/profile"
					class="active">👤 Profile</a> <a
					href="${pageContext.request.contextPath}/login">🚪 Logout</a>
			</div>

			<!-- ✅ Main Content -->
			<div class="col-md-10 p-4">

				<!-- Page Header -->
				<div class="mb-4">
					<h4>👥 Manage Students</h4>
					<p class="text-muted">View students enrolled in your courses</p>
				</div>

				<!-- Search Bar -->
				<div class="card shadow mb-4">
					<div class="card-body">
						<div class="row">
							<div class="col-md-8">
								<input type="text" class="form-control"
									placeholder="Search by student name or email">
							</div>
							<div class="col-md-4">
								<button class="btn btn-primary w-100">🔍 Search</button>
							</div>
						</div>
					</div>
				</div>

				<!-- Students Table -->
				<div class="card shadow">
					<div class="card-header bg-primary text-white">Student List</div>

					<div class="card-body">

						<table class="table table-bordered table-hover">
							<thead class="table-light">
								<tr>
									<th>Name</th>
									<th>Email</th>
									<th>Course</th>
									<th>Progress</th>
									<th width="170">Action</th>
								</tr>
							</thead>

							<tbody>
								<tr>
									<td>Aman Sharma</td>
									<td>aman@gmail.com</td>
									<td>Java Programming</td>
									<td>
										<div class="progress">
											<div class="progress-bar bg-success" style="width: 70%;">70%</div>
										</div>
									</td>
									<td>
										<button class="btn btn-sm btn-info">View</button>
										<button class="btn btn-sm btn-danger">Remove</button>
									</td>
								</tr>

								<tr>
									<td>Priya Verma</td>
									<td>priya@gmail.com</td>
									<td>Web Development</td>
									<td>
										<div class="progress">
											<div class="progress-bar bg-warning" style="width: 45%;">45%</div>
										</div>
									</td>
									<td>
										<button class="btn btn-sm btn-info">View</button>
										<button class="btn btn-sm btn-danger">Remove</button>
									</td>
								</tr>

								<tr>
									<td>Rahul Singh</td>
									<td>rahul@gmail.com</td>
									<td>Spring Boot</td>
									<td>
										<div class="progress">
											<div class="progress-bar bg-primary" style="width: 85%;">85%</div>
										</div>
									</td>
									<td>
										<button class="btn btn-sm btn-info">View</button>
										<button class="btn btn-sm btn-danger">Remove</button>
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