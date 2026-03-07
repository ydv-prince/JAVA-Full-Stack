<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin - Manage Students</title>
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

.card:hover {
	transform: scale(1.02);
	transition: 0.3s;
}

.action-btn {
	margin-right: 5px;
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
				<a href="admin">🏠 Dashboard</a> <a href="admin-manage-students"
					class="bg-primary">👨‍🎓 Manage Students</a> <a
					href="admin-manage-teachers">👨‍🏫 Manage Teachers</a> <a
					href="admin-manage-courses">📚 Manage Courses</a> <a
					href="admin-manage-assignments">📝 Manage Assignments</a> <a
					href="admin-manage-quizzes">🧠 Manage Quizzes</a> <a
					href="admin-manage-payments">💰 Payments</a> <a
					href="admin-reports">📊 Reports</a> <a href="admin-settings">⚙
					Settings</a> <a href="login">🚪 Logout</a>
			</div>

			<!-- Main Content -->
			<div class="col-md-10 p-4">

				<!-- Top Navbar -->
				<nav class="navbar navbar-light bg-white shadow-sm mb-4">
					<div class="container-fluid">
						<span class="navbar-brand mb-0 h5">👨‍🎓 Manage Students</span>
					</div>
				</nav>

				<!-- Page Header -->
				<div class="d-flex justify-content-between align-items-center mb-3">
					<h4>Student List</h4>
					<a href="admin-add-student" class="btn btn-success">+ Add New
						Student</a>
				</div>

				<!-- Students Table -->
				<div class="card shadow">
					<div class="card-body">
						<table class="table table-bordered table-hover">
							<thead class="table-light">
								<tr>
									<th>#</th>
									<th>Name</th>
									<th>Email</th>
									<th>Phone</th>
									<th>Course</th>
									<th>Status</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>Rahul Sharma</td>
									<td>rahul@email.com</td>
									<td>9876543210</td>
									<td>Java Programming</td>
									<td><span class="badge bg-success">Active</span></td>
									<td><a href="admin-edit-student?id=1"
										class="btn btn-sm btn-primary action-btn">Edit</a>
										<button class="btn btn-sm btn-danger action-btn">Delete</button>
									</td>
								</tr>

								<tr>
									<td>2</td>
									<td>Anita Verma</td>
									<td>anita@email.com</td>
									<td>9876541230</td>
									<td>Web Development</td>
									<td><span class="badge bg-warning text-dark">Pending</span></td>
									<td><a href="admin-edit-student?id=2"
										class="btn btn-sm btn-primary action-btn">Edit</a>
										<button class="btn btn-sm btn-success action-btn">Approve</button>
										<button class="btn btn-sm btn-danger action-btn">Delete</button>
									</td>
								</tr>

								<tr>
									<td>3</td>
									<td>Rohit Singh</td>
									<td>rohit@email.com</td>
									<td>9876549876</td>
									<td>Spring Framework</td>
									<td><span class="badge bg-success">Active</span></td>
									<td><a href="admin-edit-student?id=3"
										class="btn btn-sm btn-primary action-btn">Edit</a>
										<button class="btn btn-sm btn-danger action-btn">Delete</button>
									</td>
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