<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Admin - Manage Quizzes</title>
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

.table th {
	background-color: #111827;
	color: white;
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

				<!-- Top Bar -->
				<nav class="navbar navbar-light bg-white shadow-sm mb-4">
					<div class="container-fluid">
						<span class="navbar-brand mb-0 h5">🧠 Manage Quizzes</span> <a
							href="admin-add-quiz" class="btn btn-success btn-custom"> ➕
							Add New Quiz </a>
					</div>
				</nav>

				<!-- Quiz Table -->
				<div class="card shadow p-4">

					<table class="table table-bordered table-hover text-center">
						<thead>
							<tr>
								<th>ID</th>
								<th>Quiz Title</th>
								<th>Course</th>
								<th>Total Questions</th>
								<th>Total Marks</th>
								<th>Status</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>

							<tr>
								<td>1</td>
								<td>Java Basics Quiz</td>
								<td>Java Programming</td>
								<td>20</td>
								<td>100</td>
								<td><span class="badge bg-success">Active</span></td>
								<td><a href="#" class="btn btn-primary btn-sm">Edit</a> <a
									href="#" class="btn btn-danger btn-sm"
									onclick="return confirm('Are you sure?')">Delete</a></td>
							</tr>

							<tr>
								<td>2</td>
								<td>HTML & CSS Test</td>
								<td>Web Development</td>
								<td>15</td>
								<td>75</td>
								<td><span class="badge bg-success">Active</span></td>
								<td><a href="#" class="btn btn-primary btn-sm">Edit</a> <a
									href="#" class="btn btn-danger btn-sm"
									onclick="return confirm('Are you sure?')">Delete</a></td>
							</tr>

							<tr>
								<td>3</td>
								<td>Spring Boot MCQ</td>
								<td>Spring Framework</td>
								<td>25</td>
								<td>125</td>
								<td><span class="badge bg-danger">Inactive</span></td>
								<td><a href="#" class="btn btn-primary btn-sm">Edit</a> <a
									href="#" class="btn btn-danger btn-sm"
									onclick="return confirm('Are you sure?')">Delete</a></td>
							</tr>

							<tr>
								<td>4</td>
								<td>Python Advanced Quiz</td>
								<td>Python Programming</td>
								<td>30</td>
								<td>150</td>
								<td><span class="badge bg-success">Active</span></td>
								<td><a href="#" class="btn btn-primary btn-sm">Edit</a> <a
									href="#" class="btn btn-danger btn-sm"
									onclick="return confirm('Are you sure?')">Delete</a></td>
							</tr>

							<tr>
								<td>5</td>
								<td>Data Structures Test</td>
								<td>Computer Science</td>
								<td>20</td>
								<td>100</td>
								<td><span class="badge bg-danger">Inactive</span></td>
								<td><a href="#" class="btn btn-primary btn-sm">Edit</a> <a
									href="#" class="btn btn-danger btn-sm"
									onclick="return confirm('Are you sure?')">Delete</a></td>
							</tr>

						</tbody>
					</table>

				</div>

			</div>
		</div>
	</div>

</body>
</html>