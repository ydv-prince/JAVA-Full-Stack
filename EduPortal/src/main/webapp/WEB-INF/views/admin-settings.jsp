<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Admin - Settings</title>
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

.section-title {
	font-weight: 600;
	margin-bottom: 15px;
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
					href="admin-manage-quizzes">🧠 Manage Quizzes</a> <a
					href="admin-manage-payments">💰 Payments</a> <a
					href="admin-reports">📊 Reports</a> <a href="admin-settings"
					class="bg-primary">⚙ Settings</a> <a href="login">🚪 Logout</a>
			</div>

			<!-- Main Content -->
			<div class="col-md-10 p-4">

				<nav class="navbar navbar-light bg-white shadow-sm mb-4">
					<div class="container-fluid">
						<span class="navbar-brand mb-0 h5">⚙ System Settings</span>
					</div>
				</nav>

				<!-- System Info Settings -->
				<div class="card shadow p-4 mb-4">
					<h5 class="section-title">🏫 Website Information</h5>

					<form action="update-settings" method="post">

						<div class="mb-3">
							<label class="form-label">Website Name</label> <input type="text"
								name="siteName" class="form-control"
								value="${settings.siteName}">
						</div>

						<div class="mb-3">
							<label class="form-label">Contact Email</label> <input
								type="email" name="contactEmail" class="form-control"
								value="${settings.contactEmail}">
						</div>

						<div class="mb-3">
							<label class="form-label">Contact Phone</label> <input
								type="text" name="contactPhone" class="form-control"
								value="${settings.contactPhone}">
						</div>

						<button type="submit" class="btn btn-primary btn-custom">
							Save Changes</button>

					</form>
				</div>

				<!-- Change Password Section -->
				<div class="card shadow p-4 mb-4">
					<h5 class="section-title">🔐 Change Admin Password</h5>

					<form action="change-password" method="post">

						<div class="mb-3">
							<label class="form-label">Current Password</label> <input
								type="password" name="currentPassword" class="form-control"
								required>
						</div>

						<div class="mb-3">
							<label class="form-label">New Password</label> <input
								type="password" name="newPassword" class="form-control" required>
						</div>

						<div class="mb-3">
							<label class="form-label">Confirm Password</label> <input
								type="password" name="confirmPassword" class="form-control"
								required>
						</div>

						<button type="submit" class="btn btn-danger btn-custom">
							Update Password</button>

					</form>
				</div>

				<!-- System Controls -->
				<div class="card shadow p-4">
					<h5 class="section-title">⚙ System Controls</h5>

					<div class="form-check form-switch mb-3">
						<input class="form-check-input" type="checkbox"
							name="registrationEnabled"
							${settings.registrationEnabled ? 'checked' : ''}> <label
							class="form-check-label"> Enable Student Registration </label>
					</div>

					<div class="form-check form-switch mb-3">
						<input class="form-check-input" type="checkbox" name="quizEnabled"
							${settings.quizEnabled ? 'checked' : ''}> <label
							class="form-check-label"> Enable Quizzes </label>
					</div>

					<button class="btn btn-success btn-custom">Save System
						Controls</button>

				</div>

			</div>
		</div>
	</div>

</body>
</html>