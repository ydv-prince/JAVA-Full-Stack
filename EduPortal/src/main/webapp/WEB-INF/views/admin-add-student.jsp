<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin - Add Student</title>
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

.btn-custom {
	border-radius: 50px;
	padding: 8px 25px;
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
						<span class="navbar-brand mb-0 h5">👨‍🎓 Add New Student</span>
					</div>
				</nav>

				<div class="card shadow p-4">
					<form action="save-student" method="post">

						<div class="mb-3">
							<label class="form-label">Full Name</label> <input type="text"
								name="fullName" class="form-control"
								placeholder="Enter full name" required>
						</div>

						<div class="mb-3">
							<label class="form-label">Email</label> <input type="email"
								name="email" class="form-control" placeholder="Enter email"
								required>
						</div>

						<div class="mb-3">
							<label class="form-label">Phone</label> <input type="text"
								name="phone" class="form-control"
								placeholder="Enter phone number" required>
						</div>

						<div class="mb-3">
							<label class="form-label">Course Enrolled</label> <select
								name="course" class="form-select" required>
								<option value="">-- Select Course --</option>
								<option value="Java Programming">Java Programming</option>
								<option value="Web Development">Web Development</option>
								<option value="Spring Framework">Spring Framework</option>
							</select>
						</div>

						<div class="mb-3">
							<label class="form-label">Status</label> <select name="status"
								class="form-select" required>
								<option value="active">Active</option>
								<option value="pending">Pending</option>
							</select>
						</div>

						<button type="submit" class="btn btn-success btn-custom w-100">Add
							Student</button>

					</form>
				</div>

			</div>

		</div>
	</div>
</body>
</html>