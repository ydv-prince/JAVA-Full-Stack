<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Student Dashboard</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background-color: #f4f6f9;
}

.sidebar {
	height: 100vh;
	background-color: #212529;
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
	background-color: #0d6efd;
}

.card:hover {
	transform: scale(1.03);
	transition: 0.3s;
}

.stat-card {
	border-left: 5px solid #0d6efd;
}
</style>
</head>

<body>

	<div class="container-fluid">
		<div class="row">

			<!-- Sidebar -->
			<div class="col-md-2 sidebar">

				<h4 class="text-center text-white">🎓 Student Panel</h4>
				<hr class="text-white">

				<a href="student">🏠 Dashboard</a> <a href="student/courses">📚
					My Courses</a><a href="student/allcourses">📚 All Courses</a> <a href="student/assignments">📝 Assignments</a> <a
					href="student/quiz">🧠 Quiz</a> <a href="student/progress">📊
					Progress</a> <a href="student/certificate">🎓 Certificate</a> <a
					href="student/profile">👤 Profile</a> <a href="login">🚪 Logout</a>
			</div>

			<!-- Main Content -->
			<div class="col-md-10 p-4">

				<!-- Top Navbar -->
				<nav class="navbar navbar-light bg-white shadow-sm mb-4">
					<div class="container-fluid">
						<span class="navbar-brand mb-0 h5"> Welcome, Student 👋 </span>
					</div>
				</nav>

				<!-- Statistics Row -->
				<div class="row mb-4">

					<div class="col-md-4">
						<div class="card shadow stat-card">
							<div class="card-body">
								<h6>Total Courses</h6>
								<h3>3</h3>
							</div>
						</div>
					</div>


					<div class="col-md-4">
						<div class="card shadow stat-card">
							<div class="card-body">
								<h6>Assignments Pending</h6>
								<h3>2</h3>
							</div>
						</div>
					</div>

					<div class="col-md-4">
						<div class="card shadow stat-card">
							<div class="card-body">
								<h6>Overall Progress</h6>
								<h3>45%</h3>
							</div>
						</div>
					</div>

				</div>

				<h3 class="mb-4">📚 My Courses</h3>

				<div class="row">

					<!-- Course 1 -->
					<div class="col-md-4">
						<div class="card shadow">
							<img src="https://via.placeholder.com/300x150"
								class="card-img-top">
							<div class="card-body">
								<h5>Java Programming</h5>
								<p>Progress: 70%</p>
								<div class="progress mb-3">
									<div class="progress-bar bg-success" style="width: 70%"></div>
								</div>
								<a href="" class="btn btn-primary w-100">Continue</a>
							</div>
						</div>
					</div>

					<!-- Course 2 -->
					<div class="col-md-4">
						<div class="card shadow">
							<img src="https://via.placeholder.com/300x150"
								class="card-img-top">
							<div class="card-body">
								<h5>Web Development</h5>
								<p>Progress: 40%</p>
								<div class="progress mb-3">
									<div class="progress-bar bg-warning" style="width: 40%"></div>
								</div>
								<a href="" class="btn btn-primary w-100">Continue</a>
							</div>
						</div>
					</div>

					<!-- Course 3 -->
					<div class="col-md-4">
						<div class="card shadow">
							<img src="https://via.placeholder.com/300x150"
								class="card-img-top">
							<div class="card-body">
								<h5>Spring Framework</h5>
								<p>Progress: 20%</p>
								<div class="progress mb-3">
									<div class="progress-bar bg-danger" style="width: 20%"></div>
								</div>
								<a href="" class="btn btn-primary w-100">Continue</a>
							</div>
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>

</body>
</html>