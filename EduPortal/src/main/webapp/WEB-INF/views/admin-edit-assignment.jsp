<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>Admin - Edit Assignment</title>
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
						<span class="navbar-brand mb-0 h5">✏️ Edit Assignment</span>
					</div>
				</nav>

				<!-- Edit Assignment Form -->
				<div class="card shadow p-4">
					<form action="update-assignment" method="post">

						<!-- Hidden ID -->
						<input type="hidden" name="id" value="${assignment.id}">

						<div class="mb-3">
							<label class="form-label">Assignment Title</label> <input
								type="text" name="title" class="form-control"
								value="${assignment.title}" required>
						</div>

						<div class="mb-3">
							<label class="form-label">Course</label> <select name="course"
								class="form-select" required>
								<option value="">-- Select Course --</option>
								<c:forEach var="course" items="${courses}">
									<option value="${course.name}"
										<c:if test="${course.name == assignment.course}">
                                        selected
                                    </c:if>>
										${course.name}</option>
								</c:forEach>
							</select>
						</div>

						<div class="mb-3">
							<label class="form-label">Teacher</label> <select
								name="teacherId" class="form-select" required>
								<option value="">-- Select Teacher --</option>
								<c:forEach var="teacher" items="${teachers}">
									<option value="${teacher.id}"
										<c:if test="${teacher.id == assignment.teacherId}">
                                        selected
                                    </c:if>>
										${teacher.fullName}</option>
								</c:forEach>
							</select>
						</div>

						<div class="mb-3">
							<label class="form-label">Due Date</label> <input type="date"
								name="dueDate" class="form-control"
								value="${assignment.dueDate}" required>
						</div>

						<div class="mb-3">
							<label class="form-label">Description</label>
							<textarea name="description" class="form-control" rows="4">
${assignment.description}</textarea>
						</div>

						<div class="mb-3">
							<label class="form-label">Status</label> <select name="status"
								class="form-select" required>
								<option value="active"
									<c:if test="${assignment.status == 'active'}">
                                    selected
                                </c:if>>
									Active</option>
								<option value="inactive"
									<c:if test="${assignment.status == 'inactive'}">
                                    selected
                                </c:if>>
									Inactive</option>
							</select>
						</div>

						<button type="submit" class="btn btn-success btn-custom w-100">
							Update Assignment</button>

					</form>
				</div>

			</div>

		</div>
	</div>

</body>
</html>