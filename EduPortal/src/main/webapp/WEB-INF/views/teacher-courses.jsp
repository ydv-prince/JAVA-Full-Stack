<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Courses | Teacher Panel</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body { background-color: #f4f6f9; }

        .sidebar {
            height: 100vh;
            background-color: #1e1e2f;
            padding-top: 20px;
        }

        .sidebar a {
            color: white;
            display: block;
            padding: 12px 20px;
            text-decoration: none;
        }

        .sidebar a:hover { background-color: #2e2e3e; }

        .sidebar .active { background-color: #343a40; }

        .card { border-radius: 12px; }
    </style>
</head>

<body>

<!-- ===== NAVBAR ===== -->
<nav class="navbar navbar-dark bg-dark">
    <div class="container-fluid">
        <span class="navbar-brand">👨‍🏫 Teacher Dashboard</span>
        
    </div>
</nav>

<div class="container-fluid">
<div class="row">

    <!-- ===== SIDEBAR ===== -->
    <div class="col-md-2 sidebar">
        <h5 class="text-center text-white">Menu</h5>
        <hr class="text-white">

        <a href="${pageContext.request.contextPath}/teacher">🏠 Dashboard</a>
        <a href="${pageContext.request.contextPath}/teacher/courses" class="active">📚 My Courses</a>
        <a href="${pageContext.request.contextPath}/teacher/add-course">➕ Add Course</a>
        <a href="${pageContext.request.contextPath}/teacher/students">👥 Students</a>
        <a href="${pageContext.request.contextPath}/teacher/assignments">📝 Assignments</a>
        <a href="${pageContext.request.contextPath}/teacher/quizzes">🧠 Quizzes</a>
        <a href="${pageContext.request.contextPath}/teacher/profile">👤 Profile</a>
        <a href="${pageContext.request.contextPath}/login">🚪 Logout</a>
    </div>

    <!-- ===== MAIN CONTENT ===== -->
    <div class="col-md-10 p-4">

        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3>📚 My Courses</h3>
            <a href="${pageContext.request.contextPath}/teacher/add-course"
               class="btn btn-success">
                ➕ Add New Course
            </a>
        </div>

        <!-- ===== COURSE TABLE ===== -->
        <div class="card shadow">
            <div class="card-body">

                <table class="table table-bordered table-hover align-middle">
                    <thead class="table-dark">
                        <tr>
                            <th>Course Name</th>
                            <th>Description</th>
                            <th>Students</th>
                            <th>Status</th>
                            <th width="280">Action</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>Java Programming</td>
                            <td>Core + Advanced Java</td>
                            <td>50</td>
                            <td><span class="badge bg-success">Active</span></td>
                            <td>
                                <a href="#" class="btn btn-sm btn-info">Manage</a>
                                <button class="btn btn-sm btn-primary">Edit</button>
                                <button class="btn btn-sm btn-danger">Delete</button>
                            </td>
                        </tr>

                        <tr>
                            <td>Web Development</td>
                            <td>HTML, CSS, JS, Bootstrap</td>
                            <td>40</td>
                            <td><span class="badge bg-success">Active</span></td>
                            <td>
                                <a href="#" class="btn btn-sm btn-info">Manage</a>
                                <button class="btn btn-sm btn-primary">Edit</button>
                                <button class="btn btn-sm btn-danger">Delete</button>
                            </td>
                        </tr>

                        <tr>
                            <td>Spring Boot</td>
                            <td>Spring MVC + REST API</td>
                            <td>30</td>
                            <td><span class="badge bg-warning text-dark">Draft</span></td>
                            <td>
                                <a href="#" class="btn btn-sm btn-info">Manage</a>
                                <button class="btn btn-sm btn-primary">Edit</button>
                                <button class="btn btn-sm btn-danger">Delete</button>
                            </td>
                        </tr>
                    </tbody>

                </table>

            </div>
        </div>

    </div>
</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>