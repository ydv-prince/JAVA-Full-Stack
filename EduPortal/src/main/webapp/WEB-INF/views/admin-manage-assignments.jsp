<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Admin - Manage Assignments</title>
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
	padding: 6px 20px;
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
					href="admin-manage-assignments" class="bg-primary">📝 Manage
					Assignments</a> <a href="admin-manage-quizzes">🧠 Manage Quizzes</a> <a
					href="admin-manage-payments">💰 Payments</a> <a
					href="admin-reports">📊 Reports</a> <a href="admin-settings">⚙
					Settings</a> <a href="login">🚪 Logout</a>
			</div>

			<!-- Main Content -->
			<div class="col-md-10 p-4">

				<!-- Top Navbar -->
				<nav class="navbar navbar-light bg-white shadow-sm mb-4">
					<div class="container-fluid">
						<span class="navbar-brand mb-0 h5">📝 Manage Assignments</span> <a
							href="admin-add-assignment" class="btn btn-primary btn-custom">
							➕ Add Assignment </a>
					</div>
				</nav>

				<!-- Assignment Table -->
				<div class="card shadow p-3">
					<table class="table table-hover align-middle">
						<thead class="table-dark">
							<tr>
								<th>ID</th>
								<th>Title</th>
								<th>Course</th>
								<th>Teacher</th>
								<th>Due Date</th>
								<th>Status</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>

							<tr>
								<td>1</td>
								<td>Java OOP Concepts</td>
								<td>Java Programming</td>
								<td>Rahul Sharma</td>
								<td>25 Feb 2026</td>
								<td><span class="badge bg-success">Active</span></td>
								<td><a href="#" class="btn btn-sm btn-warning btn-custom">✏
										Edit</a> <a href="#" class="btn btn-sm btn-danger btn-custom"
									onclick="return confirm('Are you sure?');">🗑 Delete</a></td>
							</tr>

							<tr>
								<td>2</td>
								<td>HTML & CSS Layout</td>
								<td>Web Development</td>
								<td>Anita Verma</td>
								<td>28 Feb 2026</td>
								<td><span class="badge bg-success">Active</span></td>
								<td><a href="#" class="btn btn-sm btn-warning btn-custom">✏
										Edit</a> <a href="#" class="btn btn-sm btn-danger btn-custom"
									onclick="return confirm('Are you sure?');">🗑 Delete</a></td>
							</tr>

							<tr>
								<td>3</td>
								<td>Spring Boot REST API</td>
								<td>Spring Framework</td>
								<td>Vikram Singh</td>
								<td>05 Mar 2026</td>
								<td><span class="badge bg-secondary">Inactive</span></td>
								<td><a href="#" class="btn btn-sm btn-warning btn-custom">✏
										Edit</a> <a href="#" class="btn btn-sm btn-danger btn-custom"
									onclick="return confirm('Are you sure?');">🗑 Delete</a></td>
							</tr>

							<tr>
								<td>4</td>
								<td>Python Functions</td>
								<td>Python Programming</td>
								<td>Sneha Patel</td>
								<td>10 Mar 2026</td>
								<td><span class="badge bg-success">Active</span></td>
								<td><a href="#" class="btn btn-sm btn-warning btn-custom">✏
										Edit</a> <a href="#" class="btn btn-sm btn-danger btn-custom"
									onclick="return confirm('Are you sure?');">🗑 Delete</a></td>
							</tr>

						</tbody>
					</table>
				</div>

			</div>

		</div>
	</div>

</body>
</html>