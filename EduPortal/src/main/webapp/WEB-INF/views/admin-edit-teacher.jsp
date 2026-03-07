<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Admin - Edit Teacher</title>
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
						<span class="navbar-brand mb-0 h5">✏️ Edit Teacher</span>
					</div>
				</nav>

				<!-- Edit Teacher Form -->
				<div class="card shadow p-4">
					<form action="update-teacher" method="post">

						<!-- Hidden ID -->
						<input type="hidden" name="id" value="${teacher.id}">

						<div class="mb-3">
							<label class="form-label">Full Name</label> <input type="text"
								name="fullName" class="form-control" value="${teacher.fullName}"
								required>
						</div>

						<div class="mb-3">
							<label class="form-label">Email</label> <input type="email"
								name="email" class="form-control" value="${teacher.email}"
								required>
						</div>

						<div class="mb-3">
							<label class="form-label">Phone</label> <input type="text"
								name="phone" class="form-control" value="${teacher.phone}"
								required>
						</div>

						<div class="mb-3">
							<label class="form-label">Subject</label> <select name="subject"
								class="form-select" required>
								<option value="">-- Select Subject --</option>
								<option value="Java Programming"
									<c:if test="${teacher.subject == 'Java Programming'}">selected</c:if>>
									Java Programming</option>
								<option value="Web Development"
									<c:if test="${teacher.subject == 'Web Development'}">selected</c:if>>
									Web Development</option>
								<option value="Spring Framework"
									<c:if test="${teacher.subject == 'Spring Framework'}">selected</c:if>>
									Spring Framework</option>
								<option value="Database Management"
									<c:if test="${teacher.subject == 'Database Management'}">selected</c:if>>
									Database Management</option>
							</select>
						</div>

						<div class="mb-3">
							<label class="form-label">Status</label> <select name="status"
								class="form-select" required>
								<option value="active"
									<c:if test="${teacher.status == 'active'}">selected</c:if>>
									Active</option>
								<option value="inactive"
									<c:if test="${teacher.status == 'inactive'}">selected</c:if>>
									Inactive</option>
							</select>
						</div>

						<button type="submit" class="btn btn-success btn-custom w-100">
							Update Teacher</button>

					</form>
				</div>

			</div>

		</div>
	</div>

</body>
</html>