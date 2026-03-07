<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>
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
	transition: 0.3s;
}

.sidebar a:hover {
	background-color: #2563eb;
}

.card:hover {
	transform: scale(1.02);
	transition: 0.3s;
}

.stat-card {
	border-left: 5px solid white;
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

				<a href="${pageContext.request.contextPath}/admin">🏠 Dashboard</a>
				<a href="${pageContext.request.contextPath}/admin-manage-students">👨‍🎓
					Manage Students</a> <a
					href="${pageContext.request.contextPath}/admin-manage-teachers">👨‍🏫
					Manage Teachers</a> <a
					href="${pageContext.request.contextPath}/admin-manage-courses">📚
					Manage Courses</a> <a
					href="${pageContext.request.contextPath}/admin-manage-assignments">📝
					Manage Assignments</a> <a
					href="${pageContext.request.contextPath}/admin-manage-quizzes">🧠
					Manage Quizzes</a> <a
					href="${pageContext.request.contextPath}/admin-manage-payments">💰
					Payments</a> <a href="${pageContext.request.contextPath}/admin-reports">📊
					Reports</a> <a href="${pageContext.request.contextPath}/admin-settings">⚙
					Settings</a> <a href="${pageContext.request.contextPath}/login">🚪
					Logout</a>
			</div>

			<!-- Main Content -->
			<div class="col-md-10 p-4">

				<!-- Top Navbar -->
				<nav class="navbar navbar-light bg-white shadow-sm mb-4">
					<div class="container-fluid">
						<span class="navbar-brand mb-0 h5">Welcome, Admin 👑</span>
					</div>
				</nav>

				<!-- Statistics Row -->
				<div class="row mb-4">
					<div class="col-md-3">
						<div class="card shadow p-3 bg-primary text-white stat-card">
							<h6>Total Students</h6>
							<h3>500</h3>
						</div>
					</div>
					<div class="col-md-3">
						<div class="card shadow p-3 bg-success text-white stat-card">
							<h6>Total Teachers</h6>
							<h3>50</h3>
						</div>
					</div>
					<div class="col-md-3">
						<div class="card shadow p-3 bg-warning text-dark stat-card">
							<h6>Total Courses</h6>
							<h3>30</h3>
						</div>
					</div>
					<div class="col-md-3">
						<div class="card shadow p-3 bg-danger text-white stat-card">
							<h6>Active Users</h6>
							<h3>420</h3>
						</div>
					</div>
				</div>

				<!-- Quick Access Cards -->
				<div class="row mb-4">
					<div class="col-md-3">
						<div class="card shadow text-center p-3">
							<h6>Manage Students</h6>
							<a
								href="${pageContext.request.contextPath}/admin-manage-students"
								class="btn btn-primary w-100">Go</a>
						</div>
					</div>

					<div class="col-md-3">
						<div class="card shadow text-center p-3">
							<h6>Manage Teachers</h6>
							<a
								href="${pageContext.request.contextPath}/admin-manage-teachers"
								class="btn btn-success w-100">Go</a>
						</div>
					</div>

					<div class="col-md-3">
						<div class="card shadow text-center p-3">
							<h6>Manage Courses</h6>
							<a href="${pageContext.request.contextPath}/admin-manage-courses"
								class="btn btn-warning w-100">Go</a>
						</div>
					</div>

					<div class="col-md-3">
						<div class="card shadow text-center p-3">
							<h6>Payments</h6>
							<a
								href="${pageContext.request.contextPath}/admin-manage-payments"
								class="btn btn-danger w-100">Go</a>
						</div>
					</div>
				</div>

				<!-- Recent Users Table -->
				<div class="card shadow mb-4">
					<div class="card-header bg-dark text-white">Recent
						Registrations</div>
					<div class="card-body">
						<table class="table table-bordered table-hover">
							<thead class="table-light">
								<tr>
									<th>Name</th>
									<th>Email</th>
									<th>Role</th>
									<th>Status</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Rahul Sharma</td>
									<td>rahul@email.com</td>
									<td>Student</td>
									<td><span class="badge bg-success">Active</span></td>
									<td><button class="btn btn-sm btn-danger">Delete</button></td>
								</tr>
								<tr>
									<td>Anita Verma</td>
									<td>anita@email.com</td>
									<td>Teacher</td>
									<td><span class="badge bg-warning text-dark">Pending</span></td>
									<td><button class="btn btn-sm btn-success">Approve</button></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>