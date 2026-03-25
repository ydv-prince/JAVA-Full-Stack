<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Curriculum Builder | E-Learn Instructor</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --bg-dark: #090e1a;
            --surface: #111827;
            --primary: #4e73df;
            --emerald: #10b981;
            --warning-alt: #f6c23e;
            --border: rgba(255, 255, 255, 0.08);
            --text-main: #f8fafc;
            --text-dim: #94a3b8;
            --danger: #ef4444;
        }
        
        body { background-color: var(--bg-dark); color: var(--text-main); font-family: 'Plus Jakarta Sans', sans-serif; margin: 0; }
        
        /* Navbar & Sidebar */
        .portal-nav { background: rgba(9, 14, 26, 0.8); backdrop-filter: blur(10px); padding: 15px 40px; border-bottom: 1px solid rgba(255,255,255,0.05); position: sticky; top: 0; z-index: 1000; }
        .sidebar { background: var(--surface); border-radius: 24px; padding: 24px; height: fit-content; border: 1px solid rgba(255,255,255,0.05); }
        
        .nav-item-link {
            display: flex; align-items: center; gap: 12px; padding: 12px 16px; border-radius: 12px;
            color: var(--text-dim); text-decoration: none; transition: 0.3s; margin-top: 8px;
        }
        .nav-item-link:hover, .nav-item-link.active { background: rgba(78, 115, 223, 0.1); color: var(--primary); }
        .nav-item-link.logout { color: var(--danger); margin-top: 30px; }

        /* Builder Header */
        .builder-header { background: var(--surface); padding: 25px 40px; border-radius: 20px; border: 1px solid var(--border); display: flex; justify-content: space-between; align-items: center; margin-bottom: 25px; }
        
        /* Module Cards */
        .module-card { background: var(--surface); border: 1px solid var(--border); border-radius: 20px; margin-bottom: 25px; overflow: hidden; transition: 0.3s; }
        .module-header { background: rgba(255, 255, 255, 0.02); padding: 20px 30px; border-bottom: 1px solid var(--border); display: flex; justify-content: space-between; align-items: center; }
        
        /* List Items (Lessons & Assignments) */
        .item-row { padding: 15px 30px; border-bottom: 1px solid var(--border); display: flex; align-items: center; gap: 15px; background: rgba(255, 255, 255, 0.01); transition: 0.2s; }
        .item-row:last-child { border-bottom: none; }
        .item-row:hover { background: rgba(255, 255, 255, 0.03); }
        
        /* Distinct Borders */
        .lesson-border { border-left: 4px solid var(--primary); }
        .assignment-border { border-left: 4px solid var(--warning-alt); background: rgba(246, 194, 62, 0.02); }

        /* Buttons */
        .btn-add-module { background: var(--primary); color: white; border: none; padding: 10px 20px; border-radius: 12px; font-weight: 700; }
        .btn-add-lesson { background: transparent; color: var(--emerald); border: 1px dashed var(--emerald); padding: 8px 16px; border-radius: 10px; font-size: 0.85rem; font-weight: 600; }
        .btn-add-lesson:hover { background: var(--emerald); color: white; }
        .btn-add-assignment { background: transparent; color: var(--warning-alt); border: 1px dashed var(--warning-alt); padding: 8px 16px; border-radius: 10px; font-size: 0.85rem; font-weight: 600; text-decoration: none; transition: 0.3s; }
        .btn-add-assignment:hover { background: var(--warning-alt); color: #000; }

        /* Modals & Inputs */
        .modal-content { background: var(--surface); color: white; border: 1px solid var(--border); border-radius: 24px; }
        .custom-input { background: rgba(255, 255, 255, 0.05); border: 1px solid var(--border); border-radius: 12px; color: white; padding: 12px; width: 100%; margin-bottom: 15px; }
        .custom-input:focus { border-color: var(--primary); outline: none; }
        
        .custom-label { font-size: 0.8rem; font-weight: 700; color: var(--text-dim); margin-bottom: 8px; display: block; text-transform: uppercase; letter-spacing: 0.5px; }
        
        /* File Upload Styles */
        .pdf-upload-box { border: 2px dashed var(--border); border-radius: 12px; padding: 20px; text-align: center; background: rgba(255,255,255,0.02); cursor: pointer; transition: 0.3s; margin-bottom: 15px; }
        .pdf-upload-box:hover { border-color: var(--primary); background: rgba(78, 115, 223, 0.05); }
        .upload-progress { height: 8px; border-radius: 10px; display: none; margin-bottom: 15px; background: rgba(255,255,255,0.1); }
        .nav-tabs .nav-link { color: var(--text-dim); border: none; font-weight: 600; padding: 10px 20px; border-radius: 10px 10px 0 0; }
        .nav-tabs .nav-link.active { background: rgba(255,255,255,0.05); color: var(--primary); border-bottom: 2px solid var(--primary); }
        .tab-content { padding-top: 15px; background: rgba(255,255,255,0.02); border-radius: 0 0 12px 12px; padding: 15px; margin-bottom: 15px; border: 1px solid var(--border); border-top: none; }
    </style>
</head>
<body>

<nav class="portal-nav d-flex justify-content-between align-items-center">
    <div class="d-flex align-items-center gap-2" onclick="location.href='${pageContext.request.contextPath}/go-home'" style="cursor: pointer;">
        <div class="bg-primary p-2 rounded-3 text-white"><i class="fa-solid fa-graduation-cap"></i></div>
        <h4 class="m-0 fw-bold text-white">E-Learn</h4>
    </div>
</nav>

<div class="container-fluid px-lg-5 px-3 mb-5">
    <div class="row g-4 mt-2">
        
        <%-- LEFT SIDEBAR --%>
        <div class="col-lg-3">
            <div class="sidebar shadow-sm">
                <div class="portal-label mb-3" style="font-size:0.65rem; color:var(--text-dim); font-weight:800;">MENU</div>
                <a href="${pageContext.request.contextPath}/teacher/dashboard" class="nav-item-link"><i class="fa-solid fa-house"></i> Overview</a>
                <a href="${pageContext.request.contextPath}/teacher/courses" class="nav-item-link active"><i class="fa-solid fa-book-open"></i> My Courses</a>
                <a href="${pageContext.request.contextPath}/teacher/courses/students" class="nav-item-link"><i class="fa-solid fa-users"></i> Student List</a>
                <a href="${pageContext.request.contextPath}/teacher/revenue" class="nav-item-link"><i class="fa-solid fa-chart-line"></i> Analytics</a>
                <a href="${pageContext.request.contextPath}/teacher/profile" class="nav-item-link"><i class="fa-solid fa-user-circle"></i> My Profile</a>
                
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
            
            <div class="builder-header">
                <div>
                    <h4 class="fw-bold m-0"><i class="fa-solid fa-screwdriver-wrench text-primary me-2"></i>Curriculum Builder</h4>
                    <p class="small text-dim m-0">Course: <span class="text-white fw-bold">${course.title}</span></p>
                </div>
                <div class="d-flex gap-3">
                    <a href="${pageContext.request.contextPath}/teacher/courses" class="btn btn-outline-secondary btn-sm rounded-pill px-4 pt-2">
                        <i class="fa-solid fa-arrow-left me-1"></i> Back
                    </a>
                    <button class="btn-add-module shadow" data-bs-toggle="modal" data-bs-target="#addModuleModal">
                        <i class="fa-solid fa-plus-circle me-1"></i> Add Module
                    </button>
                </div>
            </div>

            <c:if test="${not empty successMsg}">
                <div class="alert alert-success border-0 rounded-4 shadow-sm mb-4 bg-success bg-opacity-10 text-success">
                    <i class="fa-solid fa-circle-check me-2"></i> ${successMsg}
                </div>
            </c:if>

            <c:forEach var="module" items="${modules}">
                <div class="module-card shadow-sm">
                    <div class="module-header">
                        <div>
                            <span class="badge bg-primary bg-opacity-10 text-primary mb-1">Index: ${module.orderIndex}</span>
                            <h5 class="fw-bold m-0 text-white">${module.title}</h5>
                        </div>
                        <div class="d-flex gap-2 align-items-center">
                            <button class="btn-add-assignment" onclick="openAssignmentModal(${module.id}, '${module.title}')">
                                <i class="fa-solid fa-file-signature me-1"></i> Assignment
                            </button>
                            
                            <button class="btn-add-lesson" onclick="openLessonModal(${module.id})">
                                <i class="fa-solid fa-plus me-1"></i> Lesson
                            </button>

                            <button class="btn btn-sm btn-outline-light border-0 opacity-50"
                                    onclick="openEditModuleModal('${module.id}', '<c:out value="${module.title}"/>')">
                                <i class="fa-solid fa-pen"></i>
                            </button>
                            
                            <form action="${pageContext.request.contextPath}/teacher/modules/delete/${module.id}" method="post" onsubmit="return confirm('Delete module?')" style="display:inline;">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="hidden" name="courseId" value="${course.id}">
                                <button type="submit" class="btn btn-sm btn-outline-danger border-0 opacity-50"><i class="fa-solid fa-trash"></i></button>
                            </form>
                        </div>
                    </div>
                    
                    <div class="module-content">
                        <c:forEach var="lesson" items="${module.lessons}">
                            <div class="item-row lesson-border">
                                <div class="bg-primary bg-opacity-10 p-2 rounded-3 text-primary">
                                    <i class="fa-solid fa-play-circle"></i>
                                </div>
                                <div class="flex-grow-1">
                                    <div class="small fw-bold text-white">${lesson.title}</div>
                                    <div class="text-dim d-flex gap-3" style="font-size: 0.7rem;">
                                        <span><i class="fa-regular fa-clock me-1"></i>${lesson.durationMinutes} mins</span>
                                        <c:if test="${not empty lesson.videoUrl}"><span class="text-primary"><i class="fa-solid fa-video me-1"></i>Video</span></c:if>
                                        <c:if test="${not empty lesson.pdfUrl}"><span class="text-emerald"><i class="fa-solid fa-file-pdf me-1"></i>PDF Notes</span></c:if>
                                    </div>
                                </div>
                                <div class="actions">
                                    <button class="btn btn-sm btn-outline-light border-0 opacity-50"
                                            onclick="openEditLessonModal('${lesson.id}', '<c:out value="${lesson.title}"/>', '${lesson.durationMinutes}', '<c:out value="${lesson.videoUrl}"/>', '<c:out value="${lesson.content}"/>')">
                                        <i class="fa-solid fa-pen"></i>
                                    </button>
                                    <form action="${pageContext.request.contextPath}/teacher/lessons/delete/${lesson.id}" method="post" style="display:inline;">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <input type="hidden" name="courseId" value="${course.id}"/>
                                        <button type="submit" class="btn btn-sm text-danger opacity-50 border-0" 
                                                onclick="return confirm('Delete lesson?')">
                                            <i class="fa-solid fa-trash-can"></i>
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </c:forEach>

                        <c:forEach var="asm" items="${module.assignments}">
                            <div class="item-row assignment-border">
                                <div class="bg-warning bg-opacity-10 p-2 rounded-3 text-warning">
                                    <i class="fa-solid ${asm.type == 'QUIZ' ? 'fa-bolt' : 'fa-file-signature'}"></i>
                                </div>
                                <div class="flex-grow-1">
                                    <div class="small fw-bold text-white">${asm.title} 
                                        <span class="badge bg-dark text-warning ms-2" style="font-size: 0.6rem;">${asm.type}</span>
                                    </div>
                                    <div class="text-dim d-flex gap-3" style="font-size: 0.7rem;">
                                        <span><i class="fa-solid fa-star me-1"></i>${asm.maxMarks} Marks</span>
                                        <span><i class="fa-regular fa-calendar me-1"></i>Due: ${asm.dueDate}</span>
                                    </div>
                                </div>
                                <div class="actions d-flex gap-2">
                                    <a href="${pageContext.request.contextPath}/teacher/assignments/${asm.id}/view" class="btn btn-sm text-primary border-0" title="View Assessment">
                                        <i class="fa-solid fa-eye"></i>
                                    </a>
                                    <button type="button"
                                            class="btn btn-sm text-info border-0"
                                            title="Edit Assessment"
                                            data-assignment-id="${asm.id}"
                                            data-assignment-title="<c:out value='${asm.title}'/>"
                                            data-assignment-description="<c:out value='${asm.description}'/>"
                                            data-assignment-due-date="${asm.dueDate}"
                                            data-assignment-max-marks="${asm.maxMarks}"
                                            onclick="openEditAssignmentModal(this)">
                                        <i class="fa-solid fa-pen"></i>
                                    </button>
                                    <form action="${pageContext.request.contextPath}/teacher/assignments/delete/${asm.id}" method="post" onsubmit="return confirm('Delete this assignment?')">
                                         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                         <button type="submit" class="btn btn-sm text-danger opacity-50 border-0"><i class="fa-solid fa-trash-can"></i></button>
                                    </form>
                                </div>
                            </div>
                        </c:forEach>

                        <c:if test="${empty module.lessons && empty module.assignments}">
                            <div class="p-4 text-center text-dim small">No content added yet.</div>
                        </c:if>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<%-- Add Module Modal --%>
<div class="modal fade" id="addModuleModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body p-4">
                <h5 class="fw-bold mb-4">New Module</h5>
                <form action="${pageContext.request.contextPath}/teacher/courses/${course.id}/modules/add" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <label class="custom-label">Module Title</label>
                    <input type="text" name="title" class="custom-input" placeholder="e.g. Introduction to Variables" required>
                    <button type="submit" class="btn btn-primary w-100 py-2 fw-bold">Create Module</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="editModuleModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body p-4">
                <h5 class="fw-bold mb-4">Edit Module</h5>
                <form id="editModuleForm" action="" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="hidden" name="courseId" value="${course.id}">
                    <label class="custom-label">Module Title</label>
                    <input type="text" name="title" id="editModuleTitle" class="custom-input" required>
                    <button type="submit" class="btn btn-primary w-100 py-2 fw-bold">Update Module</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="editLessonModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-body p-4">
                <h5 class="fw-bold mb-4">Edit Lesson</h5>
                <form id="editLessonForm" action="" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="hidden" name="courseId" value="${course.id}">
                    <div class="row">
                        <div class="col-md-9">
                            <label class="custom-label">Lesson Title</label>
                            <input type="text" name="title" id="editLessonTitle" class="custom-input" required>
                        </div>
                        <div class="col-md-3">
                            <label class="custom-label">Duration (Mins)</label>
                            <input type="number" name="durationMinutes" id="editLessonDuration" class="custom-input" min="1" required>
                        </div>
                    </div>
                    <label class="custom-label">Video Link</label>
                    <input type="text" name="videoUrl" id="editLessonVideoUrl" class="custom-input" placeholder="Paste YouTube Link Here">
                    <label class="custom-label">Text Description</label>
                    <textarea name="content" id="editLessonContent" class="custom-input" style="height: 120px;"></textarea>
                    <button type="submit" class="btn btn-primary w-100 py-2 fw-bold">Update Lesson</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addLessonModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-body p-4">
                <h5 class="fw-bold mb-4">Add Lesson Content</h5>
                <form id="lessonForm" action="" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <div class="row">
                        <div class="col-md-9">
                            <label class="custom-label">Lesson Title</label>
                            <input type="text" name="title" class="custom-input" placeholder="e.g. Understanding Variables" required>
                        </div>
                        <div class="col-md-3">
                            <label class="custom-label">Duration (Mins)</label>
                            <input type="number" name="durationMinutes" class="custom-input" value="15" required>
                        </div>
                    </div>

                    <label class="custom-label mt-2">Video Content</label>
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item"><button class="nav-link active" data-bs-toggle="tab" data-bs-target="#videoLinkTab" type="button">Embed Link</button></li>
                        <li class="nav-item"><button class="nav-link" data-bs-toggle="tab" data-bs-target="#videoFileTab" type="button">Upload MP4</button></li>
                    </ul>
                    <div class="tab-content mb-3">
                        <div class="tab-pane fade show active" id="videoLinkTab">
                            <input type="text" name="videoUrl" class="custom-input mb-0" placeholder="Paste YouTube Link Here">
                        </div>
                        <div class="tab-pane fade" id="videoFileTab">
                            <input type="file" name="videoFile" class="custom-input mb-0" accept="video/mp4">
                        </div>
                    </div>

                    <label class="custom-label">PDF Notes</label>
                    <div class="pdf-upload-box" onclick="document.getElementById('pdfInput').click()">
                        <i class="fa-solid fa-file-pdf fa-2x text-emerald mb-2"></i>
                        <p class="m-0 small text-white fw-bold" id="pdfFileName">Click to Select PDF File</p>
                        <input type="file" name="pdfFile" id="pdfInput" class="d-none" accept=".pdf" onchange="updateFileName(this)">
                    </div>

                    <label class="custom-label">Text Description</label>
                    <textarea name="content" class="custom-input" style="height: 100px;"></textarea>
                    
                    <div class="progress upload-progress bg-dark">
                        <div id="progressBar" class="progress-bar progress-bar-striped progress-bar-animated bg-primary" style="width: 100%"></div>
                    </div>

                    <button type="submit" class="btn btn-success w-100 py-3 fw-bold" onclick="showProgress()">Publish Lesson</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addAssignmentModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-body p-4">
                <h5 class="fw-bold mb-2 text-white">Create Assessment</h5>
                <p class="small text-dim mb-4 pb-3 border-bottom border-secondary border-opacity-25">Adding to Module: <span id="targetModuleTitle" class="text-warning fw-bold"></span></p>
                
                <form action="${pageContext.request.contextPath}/teacher/assignments/save" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="hidden" name="moduleId" id="modalModuleId">
                    
                    <div class="row">
                        <div class="col-md-8">
                            <label class="custom-label">Assessment Title</label>
                            <input type="text" name="title" class="custom-input" placeholder="e.g. Final MCQ Exam" required>
                        </div>
                        <div class="col-md-4">
                            <label class="custom-label" style="color: white !important;">Assessment Type</label>
                            <select name="type" id="typeSelector" class="custom-input" style="color: black !important; background-color: white;" onchange="toggleAssignmentUI()" required>
                                <option value="TASK">Writing Task</option>
                                <option value="QUIZ">MCQ Quiz</option>
                            </select>
                        </div>
                    </div>

                    <div id="instructionArea">
                        <label class="custom-label mt-2">Instructions / Description</label>
                        <textarea name="description" class="custom-input" placeholder="Write instructions for the writing task..." style="height: 80px;"></textarea>
                    </div>

                    <div id="quizNotice" style="display: none;" class="p-3 rounded-4 mb-3 bg-primary bg-opacity-10 border border-primary border-opacity-25">
                        <p class="m-0 small text-primary fw-bold">
                            <i class="fa-solid fa-circle-info me-2"></i> 
                            For MCQ Quizzes, you will add the questions and options on the next page after clicking Publish.
                        </p>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <label class="custom-label">Maximum Marks</label>
                            <input type="number" name="maxMarks" class="custom-input" value="100" min="1" required>
                        </div>
                        <div class="col-md-6">
                            <label class="custom-label">Due Date</label>
                            <input type="date" name="dueDate" class="custom-input" required>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-warning w-100 py-3 fw-bold mt-3 text-dark">
                        <i class="fa-solid fa-paper-plane me-2"></i>Publish Assessment
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="editAssignmentModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-body p-4">
                <h5 class="fw-bold mb-4">Edit Assessment</h5>
                <form id="editAssignmentForm" action="" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <label class="custom-label">Assessment Title</label>
                    <input type="text" name="title" id="editAssignmentTitle" class="custom-input" required>
                    <div class="row">
                        <div class="col-md-6">
                            <label class="custom-label">Maximum Marks</label>
                            <input type="number" name="maxMarks" id="editAssignmentMaxMarks" class="custom-input" required>
                        </div>
                        <div class="col-md-6">
                            <label class="custom-label">Due Date</label>
                            <input type="date" name="dueDate" id="editAssignmentDueDate" class="custom-input" required>
                        </div>
                    </div>
                    <label class="custom-label">Instructions</label>
                    <textarea name="description" id="editAssignmentDescription" class="custom-input" style="height: 110px;"></textarea>
                    <button type="submit" class="btn btn-primary w-100 py-2 fw-bold">Update Assessment</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function toggleAssignmentUI() {
        const type = document.getElementById('typeSelector').value;
        const instructionArea = document.getElementById('instructionArea');
        const quizNotice = document.getElementById('quizNotice');
        
        if(type === 'QUIZ') {
            instructionArea.style.display = 'none';
            quizNotice.style.display = 'block';
        } else {
            instructionArea.style.display = 'block';
            quizNotice.style.display = 'none';
        }
    }

    function openAssignmentModal(moduleId, moduleTitle) {
        document.getElementById('modalModuleId').value = moduleId;
        document.getElementById('targetModuleTitle').innerText = moduleTitle;
        new bootstrap.Modal(document.getElementById('addAssignmentModal')).show();
    }
    
    function openLessonModal(moduleId) {
        document.getElementById('lessonForm').action = '${pageContext.request.contextPath}/teacher/modules/' + moduleId + '/lessons/add';
        new bootstrap.Modal(document.getElementById('addLessonModal')).show();
    }

    function openEditModuleModal(moduleId, title) {
        document.getElementById('editModuleForm').action = '${pageContext.request.contextPath}/teacher/modules/update/' + moduleId;
        document.getElementById('editModuleTitle').value = title;
        new bootstrap.Modal(document.getElementById('editModuleModal')).show();
    }

    function openEditLessonModal(id, title, duration, video, content) {
        document.getElementById('editLessonForm').action = '${pageContext.request.contextPath}/teacher/lessons/update/' + id;
        document.getElementById('editLessonTitle').value = title;
        document.getElementById('editLessonDuration').value = duration;
        document.getElementById('editLessonVideoUrl').value = (video === 'null' || video === undefined) ? '' : video;
        document.getElementById('editLessonContent').value = (content === 'null' || content === undefined) ? '' : content;
        new bootstrap.Modal(document.getElementById('editLessonModal')).show();
    }

    function openEditAssignmentModal(button) {
        document.getElementById('editAssignmentForm').action = '${pageContext.request.contextPath}/teacher/assignments/update/' + button.dataset.assignmentId;
        document.getElementById('editAssignmentTitle').value = button.dataset.assignmentTitle;
        document.getElementById('editAssignmentMaxMarks').value = button.dataset.assignmentMaxMarks;
        document.getElementById('editAssignmentDueDate').value = button.dataset.assignmentDueDate;
        document.getElementById('editAssignmentDescription').value = button.dataset.assignmentDescription;
        new bootstrap.Modal(document.getElementById('editAssignmentModal')).show();
    }
    
    function updateFileName(input) {
        document.getElementById('pdfFileName').innerText = input.files[0] ? input.files[0].name : "Click to Select PDF File";
    }

    function showProgress() {
        const videoInput = document.querySelector('input[name="videoFile"]');
        if(videoInput.value) { document.querySelector('.upload-progress').style.display = 'flex'; }
    }
</script>
</body>
</html>