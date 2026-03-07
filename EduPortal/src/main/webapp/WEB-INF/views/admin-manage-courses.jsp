<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Admin - Manage Courses</title>
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
					Teachers</a> <a href="admin-manage-courses" class="bg-primary">📚
					Manage Courses</a> <a href="admin-manage-assignments">📝 Manage
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
						<span class="navbar-brand mb-0 h5">📚 Manage Courses</span> <a
							href="admin-add-course" class="btn btn-primary btn-custom"> ➕
							Add Course </a>
					</div>
				</nav>

				<!-- Courses Table -->
				<div class="card shadow p-3">
					<table class="table table-hover align-middle">
						<thead class="table-dark">
							<tr>
								<th>ID</th>
								<th>Course Name</th>
								<th>Category</th>
								<th>Duration</th>
								<th>Fees</th>
								<th>Status</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>

							<tr>
								<td>1</td>
								<td>Java Programming</td>
								<td>Programming</td>
								<td>3 Months</td>
								<td>₹5000</td>
								<td><span class="badge bg-success">Active</span></td>
								<td><a href="#" class="btn btn-sm btn-warning btn-custom">✏
										Edit</a> <a href="#" class="btn btn-sm btn-danger btn-custom"
									onclick="return confirm('Are you sure?');">🗑 Delete</a></td>
							</tr>

							<tr>
								<td>2</td>
								<td>Web Development</td>
								<td>Development</td>
								<td>4 Months</td>
								<td>₹7000</td>
								<td><span class="badge bg-success">Active</span></td>
								<td><a href="#" class="btn btn-sm btn-warning btn-custom">✏
										Edit</a> <a href="#" class="btn btn-sm btn-danger btn-custom"
									onclick="return confirm('Are you sure?');">🗑 Delete</a></td>
							</tr>

							<tr>
								<td>3</td>
								<td>Spring Boot</td>
								<td>Backend</td>
								<td>2 Months</td>
								<td>₹6000</td>
								<td><span class="badge bg-secondary">Inactive</span></td>
								<td><a href="#" class="btn btn-sm btn-warning btn-custom">✏
										Edit</a> <a href="#" class="btn btn-sm btn-danger btn-custom"
									onclick="return confirm('Are you sure?');">🗑 Delete</a></td>
							</tr>

							<tr>
								<td>4</td>
								<td>Python Programming</td>
								<td>Programming</td>
								<td>3 Months</td>
								<td>₹5500</td>
								<td><span class="badge bg-success">Active</span></td>
								<td><a href="#" class="btn btn-sm btn-warning btn-custom">✏
										Edit</a> <a href="#" class="btn btn-sm btn-danger btn-custom"
									onclick="return confirm('Are you sure?');">🗑 Delete</a></td>
							</tr>

							<tr>
								<td>5</td>
								<td>Data Structures</td>
								<td>Computer Science</td>
								<td>2 Months</td>
								<td>₹4500</td>
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