<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>My Profile</title>
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
	transform: scale(1.02);
	transition: 0.3s;
}

.profile-card {
	border-radius: 15px;
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
				<h4 class="text-center text-white">🎓 Student Panel</h4>
				<hr class="text-white">
				<a href="${pageContext.request.contextPath}/student">🏠
					Dashboard</a> <a
					href="${pageContext.request.contextPath}/student/courses">📚 My
					Courses</a><a href="${pageContext.request.contextPath}/student/allcourses">📚 All Courses</a> <a
					href="${pageContext.request.contextPath}/student/assignments">📝
					Assignments</a> <a
					href="${pageContext.request.contextPath}/student/quiz">🧠 Quiz</a>
				<a href="${pageContext.request.contextPath}/student/progress">📊
					Progress</a> <a
					href="${pageContext.request.contextPath}/student/certificate">🎓
					Certificate</a> <a
					href="${pageContext.request.contextPath}/student/profile">👤
					Profile</a> <a href="${pageContext.request.contextPath}/login">🚪
					Logout</a>
			</div>

			<!-- Main Content -->
			<div class="col-md-10 p-4">

				<!-- Top Navbar -->
				<nav class="navbar navbar-light bg-white shadow-sm mb-4">
					<div class="container-fluid">
						<span class="navbar-brand mb-0 h5">👤 My Profile</span>
					</div>
				</nav>

				<!-- Profile Card -->
				<div class="card shadow profile-card p-4">

					<div class="row">

						<!-- Profile Image -->
						<div class="col-md-4 text-center">
							<!-- <img src="https://via.placeholder.com/150" 
								class="rounded-circle mb-3" width="150" height="150"> -->
							<h5>Rahul Kumar</h5>
							<p class="text-muted">Student</p>
						</div>

						<!-- Profile Form -->
						<div class="col-md-8">
							<form>
								<div class="mb-3">
									<label class="form-label">Full Name</label> <input type="text"
										class="form-control" value="Rahul Kumar">
								</div>

								<div class="mb-3">
									<label class="form-label">Email</label> <input type="email"
										class="form-control" value="rahul@email.com">
								</div>



								<div class="mb-3">
									<label class="form-label">Mobile Number</label>
									<div class="input-group">
										<span class="input-group-text">+91</span> <input type="tel"
											class="form-control" name="mobile" pattern="[0-9]{10}"
											maxlength="10" required>
									</div>
								</div>

								<button type="submit" class="btn btn-success btn-custom w-100">Update
									Profile</button>
							</form>
						</div>

					</div>

				</div>

			</div>
		</div>
	</div>

</body>
</html>