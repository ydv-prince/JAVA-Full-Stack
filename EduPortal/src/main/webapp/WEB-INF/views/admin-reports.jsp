<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Admin - Reports</title>
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

.card-box {
	border-radius: 15px;
	padding: 25px;
	color: white;
}

.bg1 {
	background: linear-gradient(45deg, #4e73df, #224abe);
}

.bg2 {
	background: linear-gradient(45deg, #1cc88a, #17a673);
}

.bg3 {
	background: linear-gradient(45deg, #f6c23e, #dda20a);
}

.bg4 {
	background: linear-gradient(45deg, #e74a3b, #c0392b);
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
					href="admin-reports" class="bg-primary">📊 Reports</a> <a
					href="admin-settings">⚙ Settings</a> <a href="login">🚪 Logout</a>
			</div>

			<!-- Main Content -->
			<div class="col-md-10 p-4">

				<nav class="navbar navbar-light bg-white shadow-sm mb-4">
					<div class="container-fluid">
						<span class="navbar-brand mb-0 h5">📊 System Reports</span>
					</div>
				</nav>

				<div class="row g-4">

					<!-- Total Students -->
					<div class="col-md-3">
						<div class="card-box bg1 shadow text-center">
							<h5>Total Students</h5>
							<h2>120</h2>
							<!-- Total Students -->
						</div>
					</div>

					<!-- Total Teachers -->
					<div class="col-md-3">
						<div class="card-box bg2 shadow text-center">
							<h5>Total Teachers</h5>
							<h2>15</h2>
							<!-- Total Teachers -->
						</div>
					</div>

					<!-- Total Courses -->
					<div class="col-md-3">
						<div class="card-box bg3 shadow text-center">
							<h5>Total Courses</h5>
							<h2>8</h2>
							<!-- Total Courses -->
						</div>
					</div>

					<!-- Total Revenue -->
					<div class="col-md-3">
						<div class="card-box bg4 shadow text-center">
							<h5>Total Revenue</h5>
							<h2>₹ 3,25,000</h2>
							<!-- Total Revenue -->
						</div>
					</div>

				</div>

				<!-- Additional Report Section -->
				<div class="card shadow mt-5 p-4">
					<h5 class="mb-3">📈 Quick Summary</h5>
					<ul class="list-group">
						<li class="list-group-item">Active Quizzes: <strong>6</strong>
							<!-- Active Quizzes -->
						</li>
						<li class="list-group-item">Pending Payments: <strong>12</strong>
							<!-- Pending Payments -->
						</li>
						<li class="list-group-item">Assignments Submitted: <strong>85</strong>
							<!-- Assignments Submitted -->
						</li>
					</ul>
				</div>

			</div>
		</div>
	</div>

</body>
</html>