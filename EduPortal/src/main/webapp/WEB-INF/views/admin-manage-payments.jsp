<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Admin - Manage Payments</title>
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

.table th {
	background-color: #111827;
	color: white;
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
					Manage Students</a> <a href="admin-manage-teachers">👨‍🏫 Manage
					Teachers</a> <a href="admin-manage-courses">📚 Manage Courses</a> <a
					href="admin-manage-assignments">📝 Manage Assignments</a> <a
					href="admin-manage-quizzes">🧠 Manage Quizzes</a> <a
					href="admin-manage-payments" class="bg-primary">💰 Payments</a> <a
					href="admin-reports">📊 Reports</a> <a href="admin-settings">⚙
					Settings</a> <a href="login">🚪 Logout</a>
			</div>

			<!-- Main Content -->
			<div class="col-md-10 p-4">

				<!-- Top Bar -->
				<nav class="navbar navbar-light bg-white shadow-sm mb-4">
					<div class="container-fluid">
						<span class="navbar-brand mb-0 h5">💰 Manage Payments</span>
					</div>
				</nav>

				<!-- Payment Table -->
				<div class="card shadow p-4">

					<table class="table table-bordered table-hover text-center">
						<thead>
							<tr>
								<th>ID</th>
								<th>Student Name</th>
								<th>Course</th>
								<th>Amount</th>
								<th>Payment Date</th>
								<th>Status</th>
								<th>Method</th>
							</tr>
						</thead>
						<tbody>

							<tr>
								<td>1</td>
								<td>Rahul Kumar Yadav</td>
								<td>Java Programming</td>
								<td>₹ 5000</td>
								<td>15 Feb 2026</td>
								<td><span class="badge bg-success">Paid</span></td>
								<td>UPI</td>
							</tr>

							<tr>
								<td>2</td>
								<td>Raj Vardhan Singh</td>
								<td>Web Development</td>
								<td>₹ 7000</td>
								<td>16 Feb 2026</td>
								<td><span class="badge bg-success">Paid</span></td>
								<td>Credit Card</td>
							</tr>

							<tr>
								<td>3</td>
								<td>Prince Yadav</td>
								<td>Spring Boot</td>
								<td>₹ 6000</td>
								<td>17 Feb 2026</td>
								<td><span class="badge bg-warning text-dark">Pending</span></td>
								<td>Net Banking</td>
							</tr>

							<tr>
								<td>4</td>
								<td>Sneha Patel</td>
								<td>Python Programming</td>
								<td>₹ 5500</td>
								<td>18 Feb 2026</td>
								<td><span class="badge bg-success">Paid</span></td>
								<td>Debit Card</td>
							</tr>

							<tr>
								<td>5</td>
								<td>Amit Verma</td>
								<td>Data Structures</td>
								<td>₹ 4500</td>
								<td>19 Feb 2026</td>
								<td><span class="badge bg-warning text-dark">Pending</span></td>
								<td>Cash</td>
							</tr>

						</tbody>
					</table>

				</div>

			</div>
		</div>
	</div>

</body>
</html>