<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Admin - Edit Course</title>
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
						<span class="navbar-brand mb-0 h5">✏ Edit Course</span>
					</div>
				</nav>

				<!-- Edit Course Form -->
				<div class="card shadow p-4">

					<form action="update-course" method="post">

						<!-- Hidden ID -->
						<input type="hidden" name="id" value="${course.id}">

						<div class="mb-3">
							<label class="form-label">Course Name</label> <input type="text"
								name="name" class="form-control" value="${course.name}" required>
						</div>

						<div class="mb-3">
							<label class="form-label">Category</label> <select
								name="category" class="form-select" required>
								<option value="Programming"
									${course.category == 'Programming' ? 'selected' : ''}>
									Programming</option>
								<option value="Web Development"
									${course.category == 'Web Development' ? 'selected' : ''}>
									Web Development</option>
								<option value="Framework"
									${course.category == 'Framework' ? 'selected' : ''}>
									Framework</option>
								<option value="Database"
									${course.category == 'Database' ? 'selected' : ''}>
									Database</option>
								<option value="Design"
									${course.category == 'Design' ? 'selected' : ''}>
									Design</option>
							</select>
						</div>

						<div class="mb-3">
							<label class="form-label">Duration</label> <input type="text"
								name="duration" class="form-control" value="${course.duration}"
								required>
						</div>

						<div class="mb-3">
							<label class="form-label">Fees</label> <input type="number"
								name="fees" class="form-control" value="${course.fees}" required>
						</div>

						<div class="mb-3">
							<label class="form-label">Description</label>
							<textarea name="description" class="form-control" rows="4">
${course.description}
                        </textarea>
						</div>

						<div class="mb-3">
							<label class="form-label">Status</label> <select name="status"
								class="form-select" required>
								<option value="active"
									${course.status == 'active' ? 'selected' : ''}>Active
								</option>
								<option value="inactive"
									${course.status == 'inactive' ? 'selected' : ''}>
									Inactive</option>
							</select>
						</div>

						<button type="submit" class="btn btn-primary btn-custom w-100">
							Update Course</button>

					</form>

				</div>

			</div>

		</div>
	</div>

</body>
</html>