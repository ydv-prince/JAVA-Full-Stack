<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enrolled Students | Instructor Hub</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        :root {
            --bg-dark: #090e1a;
            --surface: #111827;
            --primary: #4e73df;
            --accent: #3b82f6;
            --border: rgba(255, 255, 255, 0.08);
            --text-main: #f8fafc;
            --text-dim: #94a3b8;
            --danger: #ef4444;
        }

        body { background-color: var(--bg-dark); color: var(--text-main); font-family: 'Plus Jakarta Sans', sans-serif; margin: 0; overflow-x: hidden; }

        .portal-nav {
            background: rgba(9, 14, 26, 0.8);
            backdrop-filter: blur(10px);
            padding: 15px 40px;
            border-bottom: 1px solid rgba(255,255,255,0.05);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .sidebar { background: var(--surface); border-radius: 24px; padding: 24px; height: fit-content; border: 1px solid rgba(255,255,255,0.05); }
        .nav-item-link { display: flex; align-items: center; gap: 12px; padding: 12px 16px; border-radius: 12px; color: var(--text-dim); text-decoration: none; transition: 0.3s; margin-top: 8px; font-weight: 500;}
        .nav-item-link:hover, .nav-item-link.active { background: rgba(78, 115, 223, 0.1); color: var(--primary); }
        .nav-item-link.logout { color: var(--danger); margin-top: 30px; }
        .portal-label { font-size:0.65rem; color:var(--text-dim); font-weight:800; letter-spacing: 1px; margin-bottom: 12px; }

        .table-container {
            background: var(--surface);
            border-radius: 24px;
            border: 1px solid var(--border);
            padding: 25px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.3);
        }

        .custom-table { color: white; margin-bottom: 0; }
        .custom-table thead th {
            background: transparent;
            color: var(--text-dim);
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            font-weight: 800;
            border-bottom: 1px solid var(--border);
            padding: 15px;
        }

        .custom-table tbody tr { transition: 0.3s; border-bottom: 1px solid rgba(255,255,255,0.02); }
        .custom-table tbody tr:hover { background: rgba(255,255,255,0.03); }
        .custom-table tbody td { padding: 20px 15px; vertical-align: middle; }

        .student-avatar {
            width: 45px; height: 45px; border-radius: 14px;
            background: linear-gradient(135deg, var(--primary), #1d4ed8);
            display: flex; align-items: center; justify-content: center;
            font-weight: 800; color: white;
        }

        .progress-custom { height: 6px; background: rgba(255,255,255,0.05); border-radius: 10px; overflow: hidden; margin-top: 8px; }
        .progress-fill { height: 100%; background: linear-gradient(90deg, var(--primary), #34d399); border-radius: 10px; }

        .search-wrap { position: relative; max-width: 400px; width: 100%; }
        .search-wrap i { position: absolute; left: 18px; top: 50%; transform: translateY(-50%); color: var(--text-dim); }
        .search-input {
            width: 100%; background: rgba(255, 255, 255, 0.03);
            border: 1px solid var(--border); border-radius: 14px;
            padding: 12px 15px 12px 48px; color: white; outline: none; transition: 0.3s;
        }
        .search-input:focus { border-color: var(--primary); background: rgba(78, 115, 223, 0.05); }

        .profile-trigger { cursor: pointer; transition: 0.3s; }
        .profile-trigger:hover { transform: scale(1.1); }
    </style>
</head>
<body>

<nav class="portal-nav d-flex justify-content-between align-items-center">
    <div class="d-flex align-items-center gap-2" onclick="location.href='${pageContext.request.contextPath}/teacher/dashboard'" style="cursor: pointer;">
        <div class="bg-primary p-2 rounded-3 text-white"><i class="fa-solid fa-graduation-cap"></i></div>
        <h4 class="m-0 fw-bold text-white">E-Learn</h4>
    </div>
    <div class="bg-warning rounded-circle text-dark fw-bold d-flex align-items-center justify-content-center profile-trigger" 
         style="width:35px; height:35px" onclick="location.href='${pageContext.request.contextPath}/teacher/profile'">
        <c:out value="${teacher.fullName.substring(0,1).toUpperCase()}" default="T" />
    </div>
</nav>

<div class="container-fluid px-lg-5 px-3 py-4">
    <div class="row g-4">
        <div class="col-lg-3">
            <div class="sidebar shadow-sm">
                <div class="portal-label">MENU</div>
                <a href="${pageContext.request.contextPath}/teacher/dashboard" class="nav-item-link"><i class="fa-solid fa-house"></i> Overview</a>
                <a href="${pageContext.request.contextPath}/teacher/courses" class="nav-item-link"><i class="fa-solid fa-book-open"></i> My Courses</a>
                <a href="${pageContext.request.contextPath}/teacher/courses/students" class="nav-item-link active"><i class="fa-solid fa-users"></i> Student List</a>
                <a href="${pageContext.request.contextPath}/teacher/revenue" class="nav-item-link"><i class="fa-solid fa-chart-line"></i> Analytics</a>
                <a href="${pageContext.request.contextPath}/teacher/profile" class="nav-item-link"><i class="fa-solid fa-user-circle"></i> My Profile</a>
                <form action="${pageContext.request.contextPath}/auth/logout" method="post" class="m-0">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <button type="submit" class="nav-item-link logout border-0 w-100 text-start bg-transparent">
                        <i class="fa-solid fa-right-from-bracket"></i> Sign Out
                    </button>
                </form>
            </div>
        </div>

        <div class="col-lg-9">
            <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3 mb-4">
                <div>
                    <h3 class="fw-bold m-0 text-white">Students Directory</h3>
                    <p class="small text-dim m-0">Tracking active learners across your curriculum</p>
                </div>
                <div class="search-wrap">
                    <i class="fa-solid fa-magnifying-glass"></i>
                    <input type="text" id="studentSearch" placeholder="Search by name or course..." class="search-input">
                </div>
            </div>

            <div class="table-container shadow-lg">
                <div class="table-responsive">
                    <table class="table custom-table" id="studentTable">
                        <thead>
                            <tr>
                                <th>Student Details</th>
                                <th>Enrolled Course</th>
                                <th>Learning Progress</th>
                                <th style="white-space: nowrap;">Join Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="enroll" items="${enrollments}">
                                <tr class="student-row">
                                    <td>
                                        <div class="d-flex align-items-center gap-3">
                                            <div class="student-avatar">
                                                ${enroll.student.fullName.substring(0,1).toUpperCase()}
                                            </div>
                                            <div>
                                                <div class="fw-bold" style="color: black !important; white-space: nowrap;">${enroll.student.fullName}</div>
                                                <div class="small" style="color: black !important;">${enroll.student.email}</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="fw-bold" style="font-size: 0.85rem; color: black !important;">${enroll.course.title}</div>
                                        <span class="badge bg-primary bg-opacity-10 mt-1" style="font-size: 0.6rem; color: black !important;">${enroll.course.category.name}</span>
                                    </td>
                                    <td>
                                        <%-- Reduced width from 140px to 110px --%>
                                        <div style="width: 110px;">
                                            <div class="d-flex justify-content-between mb-1">
                                                <span style="font-size: 0.65rem; color: black !important;">Completed</span>
                                                <span class="fw-bold" style="font-size: 0.7rem; color: black !important;">${enroll.progressPercent}%</span>
                                            </div>
                                            <div class="progress-custom">
                                                <div class="progress-fill" style="width: ${enroll.progressPercent}%"></div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <%-- Added white-space: nowrap --%>
                                        <div class="fw-bold" style="font-size: 0.85rem; color: black !important; white-space: nowrap;">
                                            ${enroll.enrolledAt.toLocalDate()}
                                        </div>
                                        <div class="small" style="color: black !important; white-space: nowrap;">
                                            ${enroll.enrolledAt.toLocalTime().toString().substring(0,8)}
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    document.getElementById('studentSearch').addEventListener('keyup', function() {
        let filter = this.value.toLowerCase();
        let rows = document.querySelectorAll('.student-row');
        rows.forEach(row => {
            let text = row.innerText.toLowerCase();
            row.style.display = text.includes(filter) ? "" : "none";
        });
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>