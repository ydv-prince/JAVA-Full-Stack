<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Instructor Portal | E-Learn</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        :root {
            --bg-dark: #090e1a;
            --surface: #111827;
            --primary: #4e73df;
            --text-main: #f8fafc;
            --text-dim: #94a3b8;
            --danger: #ef4444;
            --border: rgba(255, 255, 255, 0.08);
        }

        body { background-color: var(--bg-dark); color: var(--text-main); font-family: 'Plus Jakarta Sans', sans-serif; margin: 0; }

        /* ── Navbar ── */
        .portal-nav { background: rgba(9, 14, 26, 0.8); backdrop-filter: blur(10px); padding: 15px 40px; border-bottom: 1px solid rgba(255,255,255,0.05); position: sticky; top: 0; z-index: 1000; }
        
        /* ── Sidebar (Synced with Profile UI) ── */
        .sidebar { background: var(--surface); border-radius: 24px; padding: 24px; height: fit-content; border: 1px solid rgba(255,255,255,0.05); }
        .nav-item-link { display: flex; align-items: center; gap: 12px; padding: 12px 16px; border-radius: 12px; color: var(--text-dim); text-decoration: none; transition: 0.3s; margin-top: 8px; font-weight: 500;}
        .nav-item-link:hover, .nav-item-link.active { background: rgba(78, 115, 223, 0.1); color: var(--primary); }
        .nav-item-link.logout { color: var(--danger); margin-top: 30px; }
        .portal-label { font-size:0.65rem; color:var(--text-dim); font-weight:800; letter-spacing: 1px; margin-bottom: 12px; }

        /* ── Dashboard Content ── */
        .welcome-banner { background: linear-gradient(90deg, #4e73df 0%, #3b82f6 100%); border-radius: 24px; padding: 40px; position: relative; overflow: hidden; }
        .stat-card { background: var(--surface); border: 1px solid rgba(255,255,255,0.05); border-radius: 20px; padding: 24px; transition: 0.3s; height: 100%; }
        .stat-card:hover { transform: translateY(-5px); border-color: var(--primary); }
        
        .btn-create { background: var(--primary); color: white; border: none; padding: 10px 24px; border-radius: 12px; font-weight: 700; text-decoration: none; display: inline-flex; align-items: center; gap: 8px; transition: 0.3s; }
        .btn-create:hover { background: #3b5bdb; color: white; transform: scale(1.05); }

        .dashboard-floating-action {
            position: fixed;
            right: 32px;
            bottom: 32px;
            z-index: 1100;
            box-shadow: 0 14px 30px rgba(78, 115, 223, 0.35);
        }

        .course-section { background: var(--surface); border: 1px solid rgba(255,255,255,0.05); border-radius: 28px; padding: 28px; }
        .course-list-card { background: rgba(255,255,255,0.02); border: 1px solid rgba(255,255,255,0.07); border-radius: 24px; overflow: hidden; height: 100%; transition: 0.35s; }
        .course-list-card:hover { transform: translateY(-6px); border-color: rgba(78, 115, 223, 0.55); box-shadow: 0 24px 44px rgba(0,0,0,0.32); }

        .course-thumb-wrap { position: relative; height: 190px; overflow: hidden; background: rgba(255,255,255,0.03); }
        .course-thumb { width: 100%; height: 100%; object-fit: cover; transition: 0.5s; }
        .course-list-card:hover .course-thumb { transform: scale(1.08); }

        .course-thumb-placeholder { height: 100%; display: flex; align-items: center; justify-content: center; color: rgba(255,255,255,0.22); font-size: 3rem; }
        .course-card-body { padding: 22px; }
        .course-meta { display: flex; flex-wrap: wrap; gap: 10px; margin-top: 14px; color: var(--text-dim); font-size: 0.88rem; }

        .course-status-badge {
            position: absolute;
            top: 16px;
            right: 16px;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: rgba(16, 185, 129, 0.14);
            color: #6ee7b7;
            border: 1px solid rgba(16, 185, 129, 0.3);
            border-radius: 999px;
            padding: 7px 13px;
            font-size: 0.72rem;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        .course-badge {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: rgba(78, 115, 223, 0.12);
            color: #9db6ff;
            border: 1px solid rgba(78, 115, 223, 0.28);
            border-radius: 999px;
            padding: 6px 12px;
            font-size: 0.75rem;
            font-weight: 700;
            letter-spacing: 0.04em;
            text-transform: uppercase;
        }

        .btn-course-link { margin-top: 18px; width: 100%; justify-content: center; }
        .profile-trigger { cursor: pointer; transition: 0.3s; }
        .profile-trigger:hover { transform: scale(1.1); }
    </style>
</head>
<body>

<nav class="portal-nav d-flex justify-content-between align-items-center">
    <div class="d-flex align-items-center gap-2" onclick="location.href='${pageContext.request.contextPath}/teacher/dashboard'" style="cursor: pointer;">
        <div class="bg-primary p-2 rounded-3 text-white"><i class="fa-solid fa-graduation-cap"></i></div>
        <h4 class="m-0 fw-bold">E-Learn</h4>
    </div>
    <div class="d-flex align-items-center gap-4">
        <div class="bg-warning rounded-circle text-dark fw-bold d-flex align-items-center justify-content-center profile-trigger" 
             style="width:35px; height:35px" 
             onclick="location.href='${pageContext.request.contextPath}/teacher/profile'">
            <c:choose>
                <c:when test="${not empty teacher.fullName}">
                    <c:out value="${teacher.fullName.substring(0,1).toUpperCase()}" />
                </c:when>
                <c:otherwise>T</c:otherwise>
            </c:choose>
        </div>
    </div>
</nav>

<div class="container-fluid px-lg-5 px-3 mb-5">
    <div class="row g-4 mt-2">
        
        <%-- LEFT SIDEBAR --%>
        <div class="col-lg-3">
            <div class="sidebar shadow-sm">
                <div class="portal-label">MENU</div>
                
                <a href="${pageContext.request.contextPath}/teacher/dashboard" 
                   class="nav-item-link active">
                   <i class="fa-solid fa-house"></i> Overview
                </a>
                
                <a href="${pageContext.request.contextPath}/teacher/courses" 
                   class="nav-item-link">
                   <i class="fa-solid fa-book-open"></i> My Courses
                </a>
                
                <a href="${pageContext.request.contextPath}/teacher/courses/students" 
                   class="nav-item-link">
                   <i class="fa-solid fa-users"></i> Student List
                </a>
                
                <a href="${pageContext.request.contextPath}/teacher/revenue" 
                   class="nav-item-link">
                   <i class="fa-solid fa-chart-line"></i> Analytics
                </a>
                
                <a href="${pageContext.request.contextPath}/teacher/profile" 
                   class="nav-item-link">
                   <i class="fa-solid fa-user-circle"></i> My Profile
                </a>
                
                <form action="${pageContext.request.contextPath}/auth/logout" method="post" class="m-0">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <button type="submit" class="nav-item-link logout border-0 w-100 text-start bg-transparent" style="cursor: pointer;">
                        <i class="fa-solid fa-right-from-bracket"></i> Sign Out
                    </button>
                </form>
            </div>
        </div>

        <%-- RIGHT CONTENT AREA --%>
        <div class="col-lg-9">
            <div class="welcome-banner mb-4 shadow">
                <div class="d-flex align-items-center gap-3">
                    <div>
                        <h2 class="fw-bold m-0 text-white">Welcome Back, <c:out value="${teacher.fullName}" default="Instructor"/>! 👋</h2>
                        <p class="m-0 text-white opacity-75">Ready to manage your courses and students?</p>
                    </div>
                </div>
            </div>

            <div class="row g-4 mb-5">
                <div class="col-md-4">
                    <div class="stat-card">
                        <div class="d-flex justify-content-between align-items-start">
                            <div>
                                <div class="stat-lbl text-dim small fw-bold">ACTIVE COURSES</div>
                                <div class="stat-num h2 fw-800 mt-2"><c:out value="${totalCourses}" default="0"/></div>
                            </div>
                            <i class="fa-solid fa-layer-group text-primary fs-4 opacity-50"></i>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="stat-card">
                        <div class="d-flex justify-content-between align-items-start">
                            <div>
                                <div class="stat-lbl text-dim small fw-bold">TOTAL STUDENTS</div>
                                <div class="stat-num h2 fw-800 mt-2"><c:out value="${totalStudents}" default="0"/></div>
                            </div>
                            <i class="fa-solid fa-user-group text-primary fs-4 opacity-50"></i>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="stat-card">
                        <div class="d-flex justify-content-between align-items-start">
                            <div>
                                <div class="stat-lbl text-dim small fw-bold">EARNINGS</div>
                                <div class="stat-num h2 fw-800 mt-2">₹<c:out value="${earnings}" default="0"/></div>
                            </div>
                            <i class="fa-solid fa-wallet text-primary fs-4 opacity-50"></i>
                        </div>
                    </div>
                </div>
            </div>

            <div class="course-section">
                <div class="d-flex justify-content-between align-items-center flex-wrap gap-3 mb-4">
                    <div>
                        <h5 class="fw-bold mb-1">Courses</h5>
                        <p class="text-dim mb-0 small">Manage modules, lessons, and assignments for your active courses.</p>
                    </div>
                    <div class="course-badge">
                        <i class="fa-solid fa-layer-group"></i>
                        <span><c:out value="${totalCourses}" default="0"/> Active</span>
                    </div>
                </div>

                <c:choose>
                    <c:when test="${not empty activeCourses}">
                        <div class="row g-4">
                            <c:forEach var="course" items="${activeCourses}">
                                <div class="col-md-6">
                                    <div class="course-list-card">
                                        <div class="course-thumb-wrap">
                                            <c:choose>
                                                <c:when test="${not empty course.thumbnailUrl}">
                                                    <img src="${course.thumbnailUrl}" class="course-thumb" alt="thumbnail">
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="course-thumb-placeholder">
                                                        <i class="fa-solid fa-layer-group"></i>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                            <div class="course-status-badge">
                                                <i class="fa-solid fa-circle-check"></i>
                                                <span>Approved</span>
                                            </div>
                                        </div>

                                        <div class="course-card-body">
                                            <div class="course-badge">
                                                <i class="fa-solid fa-book-open"></i>
                                                <span><c:out value="${course.category.name}" default="General Course"/></span>
                                            </div>
                                            <h5 class="fw-bold mt-3 mb-2"><c:out value="${course.title}"/></h5>
                                            <div class="course-meta">
                                                <span><i class="fa-solid fa-users me-2 text-primary"></i><c:out value="${course.totalEnrollments}" default="0"/> Students</span>
                                                <span><i class="fa-solid fa-indian-rupee-sign me-2 text-primary"></i><c:out value="${course.price}" default="0.00"/></span>
                                            </div>
                                            <a href="${pageContext.request.contextPath}/teacher/courses/${course.id}/modules" class="btn-create btn-course-link">
                                                <span>Go to Course</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="text-center py-5 rounded-5" style="border: 2px dashed rgba(255,255,255,0.1)">
                            <img src="https://cdn-icons-png.flaticon.com/512/7486/7486744.png" width="60" class="mb-3 opacity-50">
                            <h5 class="fw-bold mb-2">No Active Courses</h5>
                            <p class="text-dim mb-0 small">Courses will appear here after they are approved by admin.</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>

<a href="${pageContext.request.contextPath}/teacher/courses/add" class="btn-create dashboard-floating-action shadow-lg">
    <i class="fa-solid fa-plus"></i>
    <span>New Course</span>
</a>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>