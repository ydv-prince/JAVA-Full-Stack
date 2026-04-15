<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile | Instructor Portal</title>
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
            --text-dim: #94a3b8;
            --danger: #ef4444;
        }

        body {
            background-color: var(--bg-dark);
            color: white;
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

        /* ── Sidebar ── */
        .sidebar { background: var(--surface); border-radius: 24px; padding: 24px; height: fit-content; border: 1px solid rgba(255,255,255,0.05); }
        .nav-item-link { display: flex; align-items: center; gap: 12px; padding: 12px 16px; border-radius: 12px; color: var(--text-dim); text-decoration: none; transition: 0.3s; margin-top: 8px; font-weight: 500;}
        .nav-item-link:hover, .nav-item-link.active { background: rgba(78, 115, 223, 0.1); color: var(--primary); }
        .nav-item-link.logout { color: var(--danger); margin-top: 30px; }

        /* ── Profile Card & Form ── */
        .profile-card { background: var(--surface); border: 1px solid var(--border); border-radius: 24px; padding: 40px; box-shadow: 0 20px 50px rgba(0,0,0,0.3); }

        .avatar-wrapper { position: relative; width: 120px; height: 120px; margin: 0 auto 30px; }
        .profile-img { width: 100%; height: 100%; border-radius: 30px; object-fit: cover; border: 3px solid var(--primary); background: #1e293b; }
        .edit-badge { position: absolute; bottom: -5px; right: -5px; background: var(--primary); width: 35px; height: 35px; border-radius: 10px; display: flex; align-items: center; justify-content: center; cursor: pointer; border: 3px solid var(--surface); }

        .input-group-custom { margin-bottom: 25px; }
        .label-custom { display: block; font-size: 0.75rem; font-weight: 700; color: var(--text-dim); text-transform: uppercase; letter-spacing: 1px; margin-bottom: 8px; }
        .f-input { width: 100%; background: rgba(255, 255, 255, 0.03); border: 1px solid var(--border); border-radius: 12px; padding: 12px 15px; color: white; outline: none; transition: 0.3s; }
        .f-input:focus { border-color: var(--primary); background: rgba(78, 115, 223, 0.05); }

        .btn-update { background: var(--primary); color: white; border: none; padding: 15px; border-radius: 15px; width: 100%; font-weight: 700; transition: 0.3s; margin-top: 20px; }
        .btn-update:hover { transform: translateY(-3px); box-shadow: 0 10px 20px rgba(78, 115, 223, 0.3); }
        
        .custom-alert { border-radius: 15px; border: none; font-weight: 600; font-size: 0.9rem; }
    </style>
</head>
<body>

<%-- TOP NAVBAR --%>
<nav class="portal-nav d-flex justify-content-between align-items-center">
<div class="d-flex align-items-center gap-2" onclick="location.href='${pageContext.request.contextPath}/go-home'" style="cursor: pointer;">
        <div class="bg-primary p-2 rounded-3 text-white"><i class="fa-solid fa-graduation-cap"></i></div>
        <h4 class="m-0 fw-bold">E-Learn</h4>
    </div>
    <div class="d-flex align-items-center gap-4">
        <span class="text-dim small d-none d-md-block">Teacher Mode</span>
        <div class="bg-warning rounded-circle text-dark fw-bold d-flex align-items-center justify-content-center" 
             style="width:35px; height:35px; cursor: pointer;">
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
                <div class="portal-label mb-3" style="font-size:0.65rem; color:var(--text-dim); font-weight:800;">MENU</div>
                <a href="${pageContext.request.contextPath}/teacher/dashboard" class="nav-item-link"><i class="fa-solid fa-house"></i> Overview</a>
                <a href="${pageContext.request.contextPath}/teacher/courses" class="nav-item-link"><i class="fa-solid fa-book-open"></i> My Courses</a>
                <a href="${pageContext.request.contextPath}/teacher/courses/students" class="nav-item-link"><i class="fa-solid fa-users"></i> Student List</a>
                <a href="${pageContext.request.contextPath}/teacher/revenue" class="nav-item-link"><i class="fa-solid fa-chart-line"></i> Analytics</a>
                <a href="${pageContext.request.contextPath}/teacher/profile" class="nav-item-link active"><i class="fa-solid fa-user-circle"></i> My Profile</a>
                
              <a href="${pageContext.request.contextPath}/auth/logout" class="nav-item-link logout">
    <i class="fa-solid fa-right-from-bracket"></i> Sign Out
</a>  
            </div>
        </div>

        <%-- RIGHT CONTENT AREA --%>
        <div class="col-lg-9">
            <div class="main-content">
                
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <div>
                        <h3 class="fw-bold m-0 text-white"><i class="fa-solid fa-user-gear text-primary me-2"></i>Account Settings</h3>
                        <p class="text-dim small m-0">Manage your profile and preferences.</p>
                    </div>
                </div>

                <c:if test="${not empty successMsg}">
                    <div class="alert alert-success custom-alert shadow-sm mb-4 bg-success bg-opacity-10 text-success">
                        <i class="fa-solid fa-circle-check me-2"></i> ${successMsg}
                    </div>
                </c:if>
                <c:if test="${not empty errorMsg}">
                    <div class="alert alert-danger custom-alert shadow-sm mb-4 bg-danger bg-opacity-10 text-danger">
                        <i class="fa-solid fa-circle-exclamation me-2"></i> ${errorMsg}
                    </div>
                </c:if>

                <div class="profile-card mx-auto" style="max-width: 850px;">
                    <form action="${pageContext.request.contextPath}/teacher/profile/update" method="post" enctype="multipart/form-data">
                        
                        <%-- Profile Image Box --%>
                        <div class="avatar-wrapper">
                            <c:choose>
                                <c:when test="${not empty teacher.profilePicture}">
                                    <img src="<c:out value='${teacher.profilePicture}'/>" id="preview" class="profile-img">
                                </c:when>
                                <c:otherwise>
                                    <img src="https://ui-avatars.com/api/?name=<c:out value='${teacher.fullName}'/>&background=4e73df&color=fff&size=128" id="preview" class="profile-img">
                                </c:otherwise>
                            </c:choose>
                            <label for="fileInput" class="edit-badge shadow">
                                <i class="fa-solid fa-camera text-white small"></i>
                            </label>
                            <input type="file" id="fileInput" name="profileImage" class="d-none" onchange="previewImg(this)" accept="image/*">
                        </div>

                        <%-- Form Fields --%>
                        <div class="row">
                            <div class="col-md-6 input-group-custom">
                                <label class="label-custom">Full Name</label>
                                <input type="text" name="fullName" class="f-input" value="<c:out value='${teacher.fullName}'/>" required>
                            </div>
                            <div class="col-md-6 input-group-custom">
                                <label class="label-custom">Email Address</label>
                                <input type="email" class="f-input" value="<c:out value='${teacher.email}'/>" disabled style="opacity: 0.5; cursor: not-allowed;">
                            </div>
                        </div>

                        <div class="input-group-custom">
                            <label class="label-custom">Phone Number</label>
                            <input type="text" name="phone" class="f-input" value="<c:out value='${teacher.phone}'/>" placeholder="+91 00000 00000">
                        </div>

                        <div class="input-group-custom">
                            <label class="label-custom">Professional Bio</label>
                            <textarea name="bio" class="f-input" rows="4" placeholder="Tell students about your expertise..."><c:out value='${teacher.bio}'/></textarea>
                        </div>

                        <div class="p-3 rounded-4 mb-4" style="background: rgba(16, 185, 129, 0.05); border: 1px solid rgba(16, 185, 129, 0.1);">
                            <div class="d-flex align-items-center gap-2 text-success small fw-bold">
                                <i class="fa-solid fa-shield-check"></i>
                                Verified Instructor Account
                            </div>
                        </div>

                        <button type="submit" class="btn-update">Save Profile Changes</button>
                    </form>
                </div>
                
            </div> <%-- End Main Content --%>
        </div> <%-- End Col-9 --%>
        
    </div> <%-- End Row --%>
</div> <%-- End Container --%>

<script>
    function previewImg(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById('preview').src = e.target.result;
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
