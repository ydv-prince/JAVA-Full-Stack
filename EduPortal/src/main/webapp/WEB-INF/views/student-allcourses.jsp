<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>All Courses</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            background-color: #f4f6f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            overflow-x: hidden; /* prevent horizontal scroll */
        }

        /* Sidebar */
        .sidebar {
            height: 100vh;
            background-color: #212529;
            padding-top: 20px;
            position: fixed;
            width: 220px;
        }

        .sidebar h4 {
            text-align: center;
            color: white;
            margin-bottom: 15px;
        }

        .sidebar a {
            color: white;
            display: block;
            padding: 12px 20px;
            text-decoration: none;
            border-radius: 5px;
            margin: 5px 10px;
            transition: 0.3s;
        }

        .sidebar a:hover {
            background-color: #0d6efd;
        }

        /* Main content */
        .main-content {
            margin-left: 220px; /* match sidebar width */
            padding: 40px 20px;
            max-width: calc(100vw - 220px); /* prevent overflow */
        }

        /* Cards */
        .course-card {
            border-radius: 15px;
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s;
            background: white;
        }

        .course-card:hover {
            transform: scale(1.03);
            box-shadow: 0 15px 35px rgba(0,0,0,0.2);
        }

        .course-img {
            width: 100%;
            height: 180px;
            object-fit: cover;
        }

        .card-body h5 {
            font-weight: 600;
            margin-bottom: 10px;
        }

        .btn-enroll {
            width: 100%;
            font-weight: 600;
        }

        /* Badges */
        .badge-info {
            background-color: #0d6efd;
            margin-right: 5px;
        }

        .badge-fees {
            background-color: #1cc88a;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .sidebar {
                position: relative;
                width: 100%;
                height: auto;
            }
            .main-content {
                margin-left: 0;
                max-width: 100%;
                padding: 20px 10px;
            }
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
<div class="main-content">
    <h2 class="mb-5">📚 All Courses</h2>

    <div class="row g-4">
        <!-- Course 1 -->
        <div class="col-md-4">
            <div class="card course-card shadow">
                <!--  <img src="https://www.citypng.com/photo/26142/hd-java-logo-transparent-background" class="course-img" alt="Java Programming"> -->
                <div class="card-body text-center">
                    <h5>Java Programming</h5>
                    <div class="mb-2">
                        <span class="badge badge-info">Duration: 3 Months</span>
                        <span class="badge badge-fees">Fees: ₹ 15,000</span>
                    </div>
                    <a href="${pageContext.request.contextPath}/student/payment" class="btn btn-primary mt-2">Enroll Now</a>
                </div>
            </div>
        </div>

        <!-- Course 2 -->
        <div class="col-md-4">
            <div class="card course-card shadow">
               <!--   <img src="https://source.unsplash.com/400x180/?web,development" class="course-img" alt="Web Development"> -->
                <div class="card-body text-center">
                    <h5>Web Development</h5>
                    <div class="mb-2">
                        <span class="badge badge-info">Duration: 4 Months</span>
                        <span class="badge badge-fees">Fees: ₹ 18,000</span>
                    </div>
                    <a href="${pageContext.request.contextPath}/student/payment" class="btn btn-primary mt-2">Enroll Now</a>
                </div>
            </div>
        </div>

        <!-- Course 3 -->
        <div class="col-md-4">
            <div class="card course-card shadow">
               <!-- <img src="https://source.unsplash.com/400x180/?python,coding" class="course-img" alt="Python Programming"> -->
                <div class="card-body text-center">
                    <h5>Python Programming</h5>
                    <div class="mb-2">
                        <span class="badge badge-info">Duration: 2 Months</span>
                        <span class="badge badge-fees">Fees: ₹ 12,000</span>
                    </div>
                    <a href="${pageContext.request.contextPath}/student/payment" class="btn btn-primary mt-2">Enroll Now</a>
                </div>
            </div>
        </div>

        <!-- Course 4 -->
        <div class="col-md-4">
            <div class="card course-card shadow">
              <!--  <img src="https://source.unsplash.com/400x180/?springboot,coding" class="course-img" alt="Spring Boot"> -->
                <div class="card-body text-center">
                    <h5>Spring Boot</h5>
                    <div class="mb-2">
                        <span class="badge badge-info">Duration: 3 Months</span>
                        <span class="badge badge-fees">Fees: ₹ 16,000</span>
                    </div>
                    <a href="${pageContext.request.contextPath}/student/payment" class="btn btn-primary mt-2">Enroll Now</a>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>