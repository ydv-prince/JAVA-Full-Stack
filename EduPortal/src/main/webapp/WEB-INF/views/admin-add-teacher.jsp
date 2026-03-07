<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Admin - Add Teacher</title>
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
						<span class="navbar-brand mb-0 h5">➕ Add New Teacher</span>
					</div>
				</nav>

				<!-- Add Teacher Form -->
				<div class="card shadow p-4">
					<form action="save-teacher" method="post">

						<div class="mb-3">
							<label class="form-label">Full Name</label> <input type="text"
								name="fullName" class="form-control"
								placeholder="Enter full name" required>
						</div>

						<div class="mb-3">
							<label class="form-label">Email</label> <input type="email"
								name="email" class="form-control"
								placeholder="Enter email address" required>
						</div>

						<div class="mb-3">
							<label class="form-label">Phone</label> <input type="text"
								name="phone" class="form-control"
								placeholder="Enter phone number" required>
						</div>

						<div class="mb-3">
							<label class="form-label">Subject</label> <select name="subject"
								class="form-select" required>
								<option value="">-- Select Subject --</option>
								<option value="Java Programming">Java Programming</option>
								<option value="Web Development">Web Development</option>
								<option value="Spring Framework">Spring Framework</option>
								<option value="Database Management">Database Management</option>
							</select>
						</div>

						<div class="mb-3">
							<label class="form-label">Status</label> <select name="status"
								class="form-select" required>
								<option value="active">Active</option>
								<option value="inactive">Inactive</option>
							</select>
						</div>

						<button type="submit" class="btn btn-success btn-custom w-100">
							Save Teacher</button>

					</form>
				</div>

			</div>

		</div>
	</div>

</body>
</html>