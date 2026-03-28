<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Builder | Instructor Hub</title>
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

        body { background-color: var(--bg-dark); color: white; font-family: 'Plus Jakarta Sans', sans-serif; margin: 0; }
        
        /* ── Navbar ── */
        .portal-nav {
            background: rgba(9, 14, 26, 0.8); backdrop-filter: blur(10px);
            padding: 15px 40px; border-bottom: 1px solid rgba(255,255,255,0.05);
            position: sticky; top: 0; z-index: 1000;
        }

        /* ── Sidebar (Synced with Profile) ── */
        .sidebar { background: var(--surface); border-radius: 24px; padding: 24px; height: fit-content; border: 1px solid rgba(255,255,255,0.05); }
        .nav-item-link { display: flex; align-items: center; gap: 12px; padding: 12px 16px; border-radius: 12px; color: var(--text-dim); text-decoration: none; transition: 0.3s; margin-top: 8px; font-weight: 500;}
        .nav-item-link:hover, .nav-item-link.active { background: rgba(78, 115, 223, 0.1); color: var(--primary); }
        .nav-item-link.logout { color: var(--danger); margin-top: 30px; }
        .portal-label { font-size:0.65rem; color:var(--text-dim); font-weight:800; letter-spacing: 1px; margin-bottom: 12px; }

        /* ── Panels ── */
        .panel-box {
            background: var(--surface); border-radius: 24px;
            padding: 30px; border: 1px solid var(--border);
            height: 100%;
        }

        .f-label { font-size: 0.75rem; font-weight: 700; color: var(--text-dim); text-transform: uppercase; letter-spacing: 1px; margin-bottom: 8px; display: block; }
        .f-input { width: 100%; background: rgba(255, 255, 255, 0.03); border: 1px solid var(--border); border-radius: 12px; padding: 12px 15px; color: white; outline: none; margin-bottom: 20px; transition: 0.3s; }
        .f-input:focus { border-color: var(--primary); background: rgba(78, 115, 223, 0.05); }

        .f-select { background-color: #1e293b; color: white; border: 1px solid var(--border); }

        /* ── Question Card ── */
        .q-card {
            background: rgba(255,255,255,0.02); border: 1px solid var(--border);
            border-radius: 16px; padding: 20px; margin-bottom: 15px;
            transition: 0.3s;
        }
        .q-card:hover { border-color: rgba(78, 115, 223, 0.5); }
        
        .opt-row { display: grid; grid-template-columns: 1fr 1fr; gap: 10px; margin-top: 15px; }
        .opt-badge {
            background: rgba(255,255,255,0.05); padding: 8px 12px;
            border-radius: 8px; font-size: 0.85rem; border: 1px solid var(--border);
        }
        .opt-badge.correct { background: rgba(16, 185, 129, 0.1); border-color: var(--emerald); color: var(--emerald); font-weight: 600; }
        
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
             style="width:35px; height:35px; cursor: pointer;" 
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
        
        <%-- SYNCED SIDEBAR --%>
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

        <%-- RIGHT CONTENT AREA --%>
        <div class="col-lg-9">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h3 class="fw-bold m-0 text-white"><i class="fa-solid fa-bolt text-warning me-2"></i>Quiz Builder</h3>
                    <p class="text-dim small m-0">Editing: <span class="text-white fw-bold">${assignment.title}</span></p>
                </div>
                <a href="${pageContext.request.contextPath}/teacher/courses/${assignment.module.course.id}/modules" class="btn btn-outline-secondary btn-sm rounded-pill px-4 pt-2">
                    <i class="fa-solid fa-arrow-left me-1"></i> Back to Curriculum
                </a>
            </div>

            <c:if test="${not empty successMsg}">
                <div class="alert alert-success border-0 rounded-4 mb-4 shadow-sm bg-success bg-opacity-10 text-success">
                    <i class="fa-solid fa-circle-check me-2"></i> ${successMsg}
                </div>
            </c:if>

            <div class="row g-4">
                <%-- ADD QUESTION FORM --%>
                <div class="col-lg-5">
                    <div class="panel-box shadow-lg">
                        <h5 class="fw-bold mb-4">Add New MCQ</h5>
                        <form action="${pageContext.request.contextPath}/teacher/assignments/${assignment.id}/questions/add" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            
                            <label class="f-label">Question Text</label>
                            <textarea name="questionText" class="f-input" rows="3" placeholder="Enter your question here..." required></textarea>

                            <div class="row g-3">
                                <div class="col-6"><label class="f-label">Option A</label><input type="text" name="optionA" class="f-input mb-0" required></div>
                                <div class="col-6"><label class="f-label">Option B</label><input type="text" name="optionB" class="f-input mb-0" required></div>
                                <div class="col-6"><label class="f-label mt-3">Option C</label><input type="text" name="optionC" class="f-input mb-0" required></div>
                                <div class="col-6"><label class="f-label mt-3">Option D</label><input type="text" name="optionD" class="f-input mb-0" required></div>
                            </div>

                            <div class="row mt-4">
                                <div class="col-8">
                                    <label class="f-label">Correct Answer</label>
                                    <select name="correctOption" class="f-input f-select" style="background-color: white; color: black !important;" required>
                                        <option value="" disabled selected>-- Select Correct Option --</option>
                                        <option value="A">Option A</option>
                                        <option value="B">Option B</option>
                                        <option value="C">Option C</option>
                                        <option value="D">Option D</option>
                                    </select>
                                </div>
                                <div class="col-4">
                                    <label class="f-label">Marks</label>
                                    <input type="number" name="marks" class="f-input" value="1" min="1" required>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary w-100 rounded-3 py-3 fw-bold mt-2 shadow">
                                <i class="fa-solid fa-plus-circle me-1"></i> Save Question
                            </button>
                        </form>
                    </div>
                </div>

                <%-- QUESTIONS LIST --%>
                <div class="col-lg-7">
                    <div class="panel-box shadow-sm" style="background: transparent; border: none; padding: 0;">
                        <div class="d-flex justify-content-between align-items-center mb-4 px-2">
                            <h5 class="fw-bold m-0">Added Questions (${questions.size()})</h5>
                            <span class="badge bg-primary bg-opacity-10 text-primary px-3 py-2">Max Marks: ${assignment.maxMarks}</span>
                        </div>

                        <div class="questions-list">
                            <c:forEach var="q" items="${questions}" varStatus="loop">
                                <div class="q-card">
                                    <div class="d-flex justify-content-between align-items-start">
                                        <h6 class="fw-bold text-white m-0 lh-base">
                                            <span class="text-primary me-1">Q${loop.index + 1}.</span> <c:out value="${q.questionText}"/>
                                        </h6>
                                        <div class="d-flex gap-2 align-items-center">
                                            <span class="badge bg-secondary bg-opacity-25 text-dim">${q.marks} Marks</span>
                                            <button type="button" class="btn btn-sm text-info border-0 p-0 ms-2" title="Edit"
                                                    data-question-id="${q.id}" data-question-text="${q.questionText}"
                                                    data-option-a="${q.optionA}" data-option-b="${q.optionB}"
                                                    data-option-c="${q.optionC}" data-option-d="${q.optionD}"
                                                    data-correct-option="${q.correctOption}" data-marks="${q.marks}"
                                                    onclick="openEditQuestionModal(this)">
                                                <i class="fa-solid fa-pen"></i>
                                            </button>
                                            <form action="${pageContext.request.contextPath}/teacher/assignments/${assignment.id}/questions/delete/${q.id}" method="post" class="m-0">
                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                <button type="submit" class="btn btn-sm text-danger border-0 p-0 ms-2" onclick="return confirm('Delete this question?')">
                                                    <i class="fa-solid fa-trash"></i>
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="opt-row">
                                        <div class="opt-badge ${q.correctOption == 'A' ? 'correct' : ''}">A. ${q.optionA}</div>
                                        <div class="opt-badge ${q.correctOption == 'B' ? 'correct' : ''}">B. ${q.optionB}</div>
                                        <div class="opt-badge ${q.correctOption == 'C' ? 'correct' : ''}">C. ${q.optionC}</div>
                                        <div class="opt-badge ${q.correctOption == 'D' ? 'correct' : ''}">D. ${q.optionD}</div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%-- EDIT QUESTION MODAL --%>
<div class="modal fade" id="editQuestionModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content" style="background: var(--surface); color: white; border: 1px solid var(--border); border-radius: 24px;">
            <div class="modal-body p-4">
                <h5 class="fw-bold mb-4">Edit Question</h5>
                <form id="editQuestionForm" action="" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <label class="f-label">Question Text</label>
                    <textarea name="questionText" id="editQuestionText" class="f-input" rows="3" required></textarea>

                    <div class="row g-3">
                        <div class="col-6"><label class="f-label">Option A</label><input type="text" name="optionA" id="editOptionA" class="f-input mb-0" required></div>
                        <div class="col-6"><label class="f-label">Option B</label><input type="text" name="optionB" id="editOptionB" class="f-input mb-0" required></div>
                        <div class="col-6"><label class="f-label mt-3">Option C</label><input type="text" name="optionC" id="editOptionC" class="f-input mb-0" required></div>
                        <div class="col-6"><label class="f-label mt-3">Option D</label><input type="text" name="optionD" id="editOptionD" class="f-input mb-0" required></div>
                    </div>

                    <div class="row mt-4">
                        <div class="col-8">
                            <label class="f-label">Correct Answer</label>
                            <select name="correctOption" id="editCorrectOption" class="f-input f-select" style="background-color: white; color: black !important;" required>
                                <option value="A">Option A</option>
                                <option value="B">Option B</option>
                                <option value="C">Option C</option>
                                <option value="D">Option D</option>
                            </select>
                        </div>
                        <div class="col-4"><label class="f-label">Marks</label><input type="number" name="marks" id="editMarks" class="f-input" required></div>
                    </div>

                    <button type="submit" class="btn btn-primary w-100 rounded-3 py-3 fw-bold mt-2">Update Question</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function openEditQuestionModal(button) {
        const assignmentId = '${assignment.id}';
        document.getElementById('editQuestionForm').action = '${pageContext.request.contextPath}/teacher/assignments/' + assignmentId + '/questions/update/' + button.dataset.questionId;
        document.getElementById('editQuestionText').value = button.dataset.questionText;
        document.getElementById('editOptionA').value = button.dataset.optionA;
        document.getElementById('editOptionB').value = button.dataset.optionB;
        document.getElementById('editOptionC').value = button.dataset.optionC;
        document.getElementById('editOptionD').value = button.dataset.optionD;
        document.getElementById('editCorrectOption').value = button.dataset.correctOption;
        document.getElementById('editMarks').value = button.dataset.marks;
        new bootstrap.Modal(document.getElementById('editQuestionModal')).show();
    }
</script>
</body>
</html>