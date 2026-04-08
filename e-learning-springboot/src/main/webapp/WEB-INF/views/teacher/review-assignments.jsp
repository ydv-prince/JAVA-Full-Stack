<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Review Submissions | Instructor Hub</title>
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
        }

        body { background-color: var(--bg-dark); color: white; font-family: 'Plus Jakarta Sans', sans-serif; margin: 0; }
        
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

        .review-container { padding: 30px 40px; }
        
        /* ── Submission Card ── */
        .sub-card {
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: 20px;
            padding: 20px;
            margin-bottom: 15px;
            transition: 0.3s;
        }
        .sub-card:hover { border-color: var(--primary); transform: translateX(5px); }
        .sub-card.graded { border-left: 4px solid var(--emerald); }
        .sub-card.pending { border-left: 4px solid #f6c23e; }

        /* ── Grading Section ── */
        .grade-box {
            background: var(--surface);
            border-radius: 24px;
            padding: 30px;
            border: 1px solid var(--border);
            position: sticky;
            top: 100px;
        }

        .f-input {
            width: 100%; background: rgba(255, 255, 255, 0.03);
            border: 1px solid var(--border); border-radius: 12px;
            padding: 12px; color: white; outline: none; margin-bottom: 15px;
        }
        .f-input:focus { border-color: var(--primary); background: rgba(78, 115, 223, 0.05); }

        .btn-download {
            background: rgba(16, 185, 129, 0.1); color: var(--emerald);
            border: 1px solid rgba(16, 185, 129, 0.2);
            padding: 8px 16px; border-radius: 10px; text-decoration: none;
            display: inline-flex; align-items: center; gap: 8px; font-size: 0.85rem; font-weight: 600;
        }
        .btn-download:hover { background: var(--emerald); color: white; }
    </style>
</head>
<body>

<nav class="portal-nav d-flex justify-content-between align-items-center">
<div class="d-flex align-items-center gap-2" onclick="location.href='${pageContext.request.contextPath}/go-home'" style="cursor: pointer;">
        <div class="bg-primary p-2 rounded-3 text-white"><i class="fa-solid fa-graduation-cap"></i></div>
        <h4 class="m-0 fw-bold">E-Learn</h4>
    </div>
    <div class="d-flex align-items-center gap-4">
        <div class="bg-warning rounded-circle text-dark fw-bold d-flex align-items-center justify-content-center" 
             style="width:35px; height:35px; cursor: pointer;" 
             onclick="location.href='${pageContext.request.contextPath}/teacher/profile'">
             <%-- Teacher Null Safety Check --%>
             <c:choose>
                 <c:when test="${not empty teacher.fullName}">
                     <c:out value="${teacher.fullName.substring(0,1).toUpperCase()}" />
                 </c:when>
                 <c:otherwise>T</c:otherwise>
             </c:choose>
        </div>
    </div>
</nav>

<div class="container-fluid px-lg-5 px-3">
    <div class="row g-4 mt-2">
        

<div class="container-fluid review-container">
    
    <c:if test="${not empty successMsg}">
        <div class="alert alert-success border-0 rounded-4 mb-4 shadow-sm">
            <i class="fa-solid fa-circle-check me-2"></i> ${successMsg}
        </div>
    </c:if>

    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h3 class="fw-bold m-0">Review Submissions</h3>
            <p class="text-dim m-0 small">Evaluate responses for <span class="text-white">${assignment.title}</span></p>
        </div>
        <a href="${pageContext.request.contextPath}/teacher/assignments/${assignment.id}/view" class="btn btn-outline-secondary btn-sm rounded-pill px-4">
            <i class="fa-solid fa-arrow-left me-1"></i> Assessment View
        </a>
    </div>

    <div class="row g-4">
        <div class="col-lg-7">
            <c:if test="${empty submissions}">
                <div class="text-center py-5 opacity-25" style="background: var(--surface); border-radius: 24px; border: 2px dashed var(--border);">
                    <i class="fa-solid fa-inbox fa-3x mb-3"></i>
                    <h5>No assignments submitted yet.</h5>
                </div>
            </c:if>

            <c:forEach var="sub" items="${submissions}">
                <div class="sub-card ${sub.graded ? 'graded' : 'pending'} d-flex justify-content-between align-items-center shadow-sm">
                    <div class="d-flex align-items-center gap-3">
                        <div class="rounded-circle bg-primary bg-opacity-10 d-flex align-items-center justify-content-center" style="width:50px; height:50px; border: 1px solid rgba(78, 115, 223, 0.2);">
                            <%-- Student Null Safety Check --%>
                            <span class="fw-bold text-primary">
                                <c:choose>
                                    <c:when test="${not empty sub.student.fullName}">
                                        <c:out value="${sub.student.fullName.substring(0,1).toUpperCase()}" />
                                    </c:when>
                                    <c:otherwise>S</c:otherwise>
                                </c:choose>
                            </span>
                        </div>
                        <div>
                            <div class="fw-bold text-white"><c:out value="${sub.student.fullName}" default="Unknown Student"/></div>
                        <div class="small text-dim">Assignment: <span class="text-white opacity-75"><c:out value="${sub.assignment.title}"/></span></div>
                        <c:if test="${not empty sub.submissionText}">
                            <div class="small text-dim mt-2">Answer:</div>
                            <div class="small text-white opacity-75 mt-1" style="max-width: 440px; white-space: pre-wrap;"><c:out value="${sub.submissionText}"/></div>
                        </c:if>
                        <c:if test="${sub.graded}">
                            <div class="badge bg-success bg-opacity-10 text-success mt-1" style="font-size: 0.65rem;">
                                    GRADED: ${sub.marksObtained} / ${sub.assignment.maxMarks}
                            </div>
                        </c:if>
                        </div>
                    </div>
                    
                    <div class="text-end d-flex align-items-center gap-2">
                        <c:if test="${not empty sub.fileName}">
                            <a href="${pageContext.request.contextPath}/teacher/submissions/${sub.id}/download" class="btn-download">
                                <i class="fa-solid fa-file-pdf"></i> View
                            </a>
                        </c:if>
                        <button class="btn ${sub.graded ? 'btn-outline-primary' : 'btn-primary'} btn-sm rounded-pill px-3 fw-bold" 
                                onclick="setupGradeForm(${sub.id}, '<c:out value="${sub.student.fullName}" escapeXml="true"/>', ${sub.assignment.maxMarks}, '<c:out value="${sub.feedback}" escapeXml="true"/>', '${sub.marksObtained}')">
                            ${sub.graded ? 'Update' : 'Grade'}
                        </button>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="col-lg-5">
            <div class="grade-box shadow-lg">
                <h5 class="fw-bold mb-4 d-flex align-items-center gap-2">
                    <i class="fa-solid fa-pen-nib text-primary"></i> Grading Panel
                </h5>
                
                <div id="noSelection" class="text-center py-5 text-dim">
                    <img src="https://cdn-icons-png.flaticon.com/512/7486/7486744.png" width="60" class="mb-3 opacity-25">
                    <p class="small">Click on a student's <b>Grade</b> button to start evaluation.</p>
                </div>

                <form id="gradeForm" action="${pageContext.request.contextPath}/teacher/assignments/grade/" method="post" style="display: none;">
                    <div class="mb-4 p-3 rounded-4" style="background: rgba(78, 115, 223, 0.05); border: 1px solid rgba(78, 115, 223, 0.1);">
                        <div class="small text-dim fw-bold text-uppercase" style="letter-spacing: 1px; font-size: 0.65rem;">Evaluating Student:</div>
                        <div id="gradeStudentName" class="fw-bold text-white fs-5"></div>
                    </div>

                    <label class="small fw-bold text-dim mb-1">SCORE (Maximum: <span id="maxMarks" class="text-white">100</span>)</label>
                    <input type="number" id="marksInput" name="marks" class="f-input" placeholder="Enter obtained marks" required min="0">

                    <label class="small fw-bold text-dim mb-1">INSTRUCTOR FEEDBACK</label>
                    <textarea id="feedbackInput" name="feedback" class="f-input" rows="4" placeholder="Write constructive feedback for the student..."></textarea>

                    <button type="submit" class="btn btn-success w-100 py-3 fw-bold rounded-4 mt-2 shadow">
                        Confirm & Save Grade
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function setupGradeForm(subId, name, max, existingFeedback, existingMarks) {
        document.getElementById('noSelection').style.display = 'none';
        const form = document.getElementById('gradeForm');
        form.style.display = 'block';
        
        // Form Action Update
        form.action = '${pageContext.request.contextPath}/teacher/assignments/grade/' + subId;
        
        // Field Updates
        document.getElementById('gradeStudentName').innerText = name;
        document.getElementById('maxMarks').innerText = max;
        document.getElementById('marksInput').max = max;
        
        // Populate existing data if any (for editing)
        document.getElementById('marksInput').value = existingMarks !== 'null' ? existingMarks : '';
        document.getElementById('feedbackInput').value = existingFeedback !== 'null' ? existingFeedback : '';
        
        // Scroll slightly for better mobile experience
        if(window.innerWidth < 992) {
            form.scrollIntoView({ behavior: 'smooth' });
        }
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
