<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Library | E-Learn Instructor</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
    :root {
        --bg-dark: #090e1a;
        --surface: #111827;
        --primary: #4e73df;
        --emerald: #10b981;
        --border: rgba(255, 255, 255, 0.08);
        --text-main: #f8fafc;
        --text-dim: #94a3b8;
        --danger: #ef4444;
    }

    body {
        background-color: var(--bg-dark);
        color: var(--text-main);
        font-family: 'Plus Jakarta Sans', sans-serif;
        margin: 0;
    }

    /* ── Navbar ── */
    .portal-nav {
        background: rgba(9, 14, 26, 0.8);
        backdrop-filter: blur(10px);
        padding: 15px 40px;
        border-bottom: 1px solid rgba(255,255,255,0.05);
        position: sticky;
        top: 0;
        z-index: 1000;
    }

    /* ── Sidebar (Perfect Sync with Profile.jsp) ── */
    .sidebar {
        background: var(--surface);
        border-radius: 24px;
        padding: 24px;
        height: fit-content;
        border: 1px solid rgba(255,255,255,0.05);
    }

    .nav-item-link {
        display: flex;
        align-items: center;
        gap: 12px;
        padding: 12px 16px;
        border-radius: 12px;
        color: var(--text-dim);
        text-decoration: none;
        transition: all 0.3s ease;
        margin-top: 8px;
        font-weight: 500;
    }

    /* 🔥 EXACT SAME HOVER + ACTIVE FEEL */
    .nav-item-link:hover,
    .nav-item-link.active {
        background: rgba(78, 115, 223, 0.1);
        color: var(--primary);
        transform: translateX(4px);
    }

    .nav-item-link i {
        transition: 0.3s;
    }

    .nav-item-link:hover i {
        transform: scale(1.1);
    }

    .nav-item-link.logout {
        color: var(--danger);
        margin-top: 30px;
    }

    .nav-item-link.logout:hover {
        background: rgba(239, 68, 68, 0.1);
        color: #ef4444;
    }

    .portal-label {
        font-size: 0.65rem;
        color: var(--text-dim);
        font-weight: 800;
        letter-spacing: 1px;
        margin-bottom: 12px;
    }

    /* ── Main Content ── */
    .search-box {
        background: var(--surface);
        border: 1px solid var(--border);
        border-radius: 14px;
        padding: 10px 20px;
        display: flex;
        align-items: center;
        gap: 12px;
        width: 350px;
    }

    .search-box input {
        background: transparent;
        border: none;
        color: white;
        outline: none;
        width: 100%;
        font-size: 0.9rem;
    }

    .course-card {
        background: var(--surface);
        border: 1px solid var(--border);
        border-radius: 24px;
        overflow: hidden;
        transition: 0.4s cubic-bezier(0.4, 0, 0.2, 1);
        height: 100%;
        display: flex;
        flex-direction: column;
        position: relative;
    }

    .course-card:hover {
        transform: translateY(-10px);
        border-color: var(--primary);
        box-shadow: 0 30px 60px rgba(0,0,0,0.5);
    }

    .thumb-container {
        position: relative;
        height: 190px;
        overflow: hidden;
    }

    .course-thumb {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: 0.6s;
    }

    .course-card:hover .course-thumb {
        transform: scale(1.05);
    }

    .status-badge {
        position: absolute;
        top: 15px;
        right: 15px;
        padding: 6px 14px;
        border-radius: 50px;
        font-size: 0.65rem;
        font-weight: 800;
        text-transform: uppercase;
        z-index: 2;
    }

    .bg-live { background: #064e3b; color: #34d399; border: 1px solid #059669; }
    .bg-draft { background: #451a03; color: #fbbf24; border: 1px solid #d97706; }

    .card-body-content {
        padding: 25px;
        flex-grow: 1;
    }

    .course-title {
        font-size: 1.15rem;
        font-weight: 700;
        margin-bottom: 15px;
        color: white;
        line-height: 1.4;
        min-height: 50px;
    }

    .card-footer-actions {
        padding: 15px 25px 25px;
        display: flex;
        gap: 12px;
        align-items: center;
    }

    .btn-action {
        flex: 1;
        padding: 12px;
        border-radius: 12px;
        font-size: 0.85rem;
        font-weight: 700;
        text-decoration: none;
        text-align: center;
        transition: 0.3s;
    }

    .btn-edit {
        background: rgba(78, 115, 223, 0.1);
        color: var(--primary);
        border: 1px solid var(--primary);
    }

    .btn-edit:hover {
        background: var(--primary);
        color: white;
    }

    .btn-delete {
        color: #ef4444;
        background: rgba(239, 68, 68, 0.05);
        border: 1px solid rgba(239, 68, 68, 0.2);
        width: 45px;
        height: 45px;
        border-radius: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
        transition: 0.3s;
        cursor: pointer;
    }

    .btn-delete:hover {
        background: #ef4444;
        color: white;
    }

    .btn-add-new {
        background: linear-gradient(135deg, var(--primary) 0%, #3b82f6 100%);
        color: white;
        padding: 14px 28px;
        border-radius: 16px;
        font-weight: 800;
        text-decoration: none;
        box-shadow: 0 10px 25px rgba(59, 130, 246, 0.3);
        transition: 0.3s;
    }

    .btn-add-new:hover {
        transform: translateY(-2px);
        box-shadow: 0 15px 30px rgba(59, 130, 246, 0.4);
    }

    .profile-trigger {
        cursor: pointer;
        transition: 0.3s;
    }

    .profile-trigger:hover {
        transform: scale(1.1);
    }
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

<div class="container-fluid px-lg-5 px-3 mb-5">
    <div class="row g-4 mt-2">
        
        <div class="col-lg-3">
            <div class="sidebar shadow-sm">
                <div class="portal-label">MENU</div>
                <a href="${pageContext.request.contextPath}/teacher/dashboard" class="nav-item-link"><i class="fa-solid fa-house"></i> Overview</a>
                <a href="${pageContext.request.contextPath}/teacher/courses" class="nav-item-link active"><i class="fa-solid fa-book-open"></i> My Courses</a>
                <a href="${pageContext.request.contextPath}/teacher/courses/students" class="nav-item-link"><i class="fa-solid fa-users"></i> Student List</a>
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
            <div class="main-content">
                <%-- Success Feedback --%>
                <c:if test="${not empty successMsg}">
                    <div class="alert alert-success border-0 rounded-4 mb-4 shadow-sm bg-success bg-opacity-10 text-success">
                        <i class="fa-solid fa-circle-check me-2"></i> ${successMsg}
                    </div>
                </c:if>

                <%-- Error Feedback (Critical for debugging why delete fails) --%>
                <c:if test="${not empty errorMsg}">
                    <div class="alert alert-danger border-0 rounded-4 mb-4 shadow-sm bg-danger bg-opacity-10 text-danger">
                        <i class="fa-solid fa-circle-xmark me-2"></i> ${errorMsg}
                    </div>
                </c:if>

                <div class="header-section d-flex justify-content-between align-items-end flex-wrap gap-4 mb-4">
                    <div>
                        <h2 class="fw-bold m-0 text-white mb-2">My Course Library 📚</h2>
                        <p class="text-dim m-0">Manage and curriculum settings.</p>
                    </div>
                    <div class="d-flex gap-3 align-items-center">
                        <div class="search-box d-none d-md-flex">
                            <i class="fa-solid fa-magnifying-glass text-dim"></i>
                            <input type="text" id="courseSearch" placeholder="Search courses..." onkeyup="filterCourses()">
                        </div>
                        <a href="${pageContext.request.contextPath}/teacher/courses/add" class="btn-add-new">
                            <i class="fa-solid fa-plus me-2"></i>New Course
                        </a>
                    </div>
                </div>

                <div class="row g-4" id="courseContainer">
                    <c:forEach var="course" items="${courses}">
                        <div class="col-xl-4 col-md-6 course-item-wrapper">
                            <div class="course-card">
                                <div class="thumb-container">
                                    <img src="${course.thumbnailUrl}" class="course-thumb" onerror="this.src='https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=800'">
                                    <span class="status-badge ${course.published ? 'bg-live' : 'bg-draft'}">
                                        ${course.published ? 'Published' : 'Draft'}
                                    </span>
                                </div>
                                <div class="card-body-content">
                                    <div class="text-primary small fw-800 text-uppercase mb-2">${course.category.name}</div>
                                    <h5 class="course-title">${course.title}</h5>
                                    <div class="d-flex justify-content-between pt-3 border-top border-white border-opacity-10">
                                        <div class="small text-dim"><i class="fa-solid fa-users me-1"></i> ${course.totalEnrollments}</div>
                                        <div class="small text-white fw-bold">₹${course.price}</div>
                                    </div>
                                </div>
                                <div class="card-footer-actions">
                                    <a href="${pageContext.request.contextPath}/teacher/courses/edit/${course.id}" class="btn-action btn-edit">Edit</a>
                                    <a href="${pageContext.request.contextPath}/teacher/courses/${course.id}/modules" class="btn-action btn-edit border-success text-success bg-transparent">Curriculum</a>
                                    
                                    <%-- Delete Logic remains identical to your paste but confirmed functional --%>
                                    <form action="${pageContext.request.contextPath}/teacher/courses/delete/${course.id}" method="post" class="m-0">
                                         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                         <button type="submit" class="btn-delete border-0" onclick="return confirm('Attention: All course data will be deleted permanently. Continue?')">
                                            <i class="fa-solid fa-trash-can"></i>
                                         </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div> 
    </div>
</div>

<script>
    function filterCourses() {
        let input = document.getElementById('courseSearch').value.toLowerCase();
        let items = document.getElementsByClassName('course-item-wrapper');
        for (let i = 0; i < items.length; i++) {
            let title = items[i].querySelector('.course-title').innerText.toLowerCase();
            items[i].style.display = title.includes(input) ? "" : "none";
        }
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>