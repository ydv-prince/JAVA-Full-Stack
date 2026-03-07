<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Admin - Edit Student</title>
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
	transition: 0.3s;
}

.sidebar a:hover {
	background-color: #2563eb;
}

.active-link {
	background-color: #2563eb;
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

				<a href="${pageContext.request.contextPath}/admin">🏠 Dashboard</a>

				<a href="${pageContext.request.contextPath}/admin/manage-students"
					class="active-link">👨‍🎓 Manage Students</a> <a
					href="${pageContext.request.contextPath}/admin/manage-teachers">
					👨‍🏫 Manage Teachers </a> <a
					href="${pageContext.request.contextPath}/admin/manage-courses">
					📚 Manage Courses </a> <a
					href="${pageContext.request.contextPath}/admin/manage-assignments">
					📝 Manage Assignments </a> <a
					href="${pageContext.request.contextPath}/admin/manage-quizzes">
					🧠 Manage Quizzes </a> <a
					href="${pageContext.request.contextPath}/admin/manage-payments">
					💰 Payments </a> <a
					href="${pageContext.request.contextPath}/admin/reports"> 📊
					Reports </a> <a
					href="${pageContext.request.contextPath}/admin/settings"> ⚙
					Settings </a> <a href="${pageContext.request.contextPath}/login">
					🚪 Logout </a>
			</div>

			<!-- Main Content -->
			<div class="col-md-10 p-4">

				<!-- Top Navbar -->
				<nav class="navbar navbar-light bg-white shadow-sm mb-4">
					<div class="container-fluid">
						<span class="navbar-brand mb-0 h5">✏️ Edit Student</span>
					</div>
				</nav>

				<!-- Edit Student Form -->
				<div class="card shadow p-4">
					<form action="${pageContext.request.contextPath}/update-student"
						method="post">

						<input type="hidden" name="id" value="${student.id}">

						<div class="mb-3">
							<label class="form-label">Full Name</label> <input type="text"
								name="fullName" class="form-control" value="${student.fullName}"
								required>
						</div>

						<div class="mb-3">
							<label class="form-label">Email</label> <input type="email"
								name="email" class="form-control" value="${student.email}"
								required>
						</div>

						<div class="mb-3">
							<label class="form-label">Phone</label> <input type="text"
								name="phone" class="form-control" value="${student.phone}"
								required>
						</div>

						<div class="mb-3">
							<label class="form-label">Course Enrolled</label> <select
								name="course" class="form-select" required>
								<option value="">-- Select Course --</option>

								<option value="Java Programming"
									<c:if test="${student.course == 'Java Programming'}">selected</c:if>>
									Java Programming</option>

								<option value="Web Development"
									<c:if test="${student.course == 'Web Development'}">selected</c:if>>
									Web Development</option>

								<option value="Spring Framework"
									<c:if test="${student.course == 'Spring Framework'}">selected</c:if>>
									Spring Framework</option>
							</select>
						</div>

						<div class="mb-3">
							<label class="form-label">Status</label> <select name="status"
								class="form-select" required>

								<option value="active"
									<c:if test="${student.status == 'active'}">selected</c:if>>
									Active</option>

								<option value="pending"
									<c:if test="${student.status == 'pending'}">selected</c:if>>
									Pending</option>

							</select>
						</div>

						<button type="submit" class="btn btn-success btn-custom w-100">
							Update Student</button>

					</form>
				</div>

			</div>
		</div>
	</div>
</body>
</html>