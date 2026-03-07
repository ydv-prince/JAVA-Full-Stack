<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Admin - Manage Teachers</title>
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
					Manage Students</a> <a href="admin-manage-teachers" class="bg-primary">👨‍🏫
					Manage Teachers</a> <a href="admin-manage-courses">📚 Manage
					Courses</a> <a href="admin-manage-assignments">📝 Manage
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
						<span class="navbar-brand mb-0 h5">👨‍🏫 Manage Teachers</span> <a
							href="admin-add-teacher" class="btn btn-primary btn-custom">
							➕ Add Teacher </a>
					</div>
				</nav>

				<!-- Teachers Table -->
				<div class="card shadow p-3">
					<table class="table table-hover align-middle">
						<thead class="table-dark">
							<tr>
								<th>ID</th>
								<th>Full Name</th>
								<th>Email</th>
								<th>Phone</th>
								<th>Subject</th>
								<th>Status</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>

							<tr>
								<td>1</td>
								<td>Rahul Sharma</td>
								<td>rahul@gmail.com</td>
								<td>9876543210</td>
								<td>Java Programming</td>
								<td><span class="badge bg-success">Active</span></td>
								<td><a href="#" class="btn btn-sm btn-warning btn-custom">✏
										Edit</a> <a href="#" class="btn btn-sm btn-danger btn-custom"
									onclick="return confirm('Are you sure?');">🗑 Delete</a></td>
							</tr>

							<tr>
								<td>2</td>
								<td>Anita Verma</td>
								<td>anita@gmail.com</td>
								<td>9123456780</td>
								<td>Web Development</td>
								<td><span class="badge bg-success">Active</span></td>
								<td><a href="#" class="btn btn-sm btn-warning btn-custom">✏
										Edit</a> <a href="#" class="btn btn-sm btn-danger btn-custom"
									onclick="return confirm('Are you sure?');">🗑 Delete</a></td>
							</tr>

							<tr>
								<td>3</td>
								<td>Vikram Singh</td>
								<td>vikram@gmail.com</td>
								<td>9988776655</td>
								<td>Spring Framework</td>
								<td><span class="badge bg-warning text-dark">Inactive</span></td>
								<td><a href="#" class="btn btn-sm btn-warning btn-custom">✏
										Edit</a> <a href="#" class="btn btn-sm btn-danger btn-custom"
									onclick="return confirm('Are you sure?');">🗑 Delete</a></td>
							</tr>

							<tr>
								<td>4</td>
								<td>Sneha Patel</td>
								<td>sneha@gmail.com</td>
								<td>9012345678</td>
								<td>Python Programming</td>
								<td><span class="badge bg-success">Active</span></td>
								<td><a href="#" class="btn btn-sm btn-warning btn-custom">✏
										Edit</a> <a href="#" class="btn btn-sm btn-danger btn-custom"
									onclick="return confirm('Are you sure?');">🗑 Delete</a></td>
							</tr>

							<tr>
								<td>5</td>
								<td>Amit Kumar</td>
								<td>amit@gmail.com</td>
								<td>9090909090</td>
								<td>Data Structures</td>
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