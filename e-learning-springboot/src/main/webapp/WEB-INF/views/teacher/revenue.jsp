<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Revenue Analytics | Instructor Hub</title>
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
            background: rgba(9, 14, 26, 0.8);
            backdrop-filter: blur(10px);
            padding: 15px 40px;
            border-bottom: 1px solid rgba(255,255,255,0.05);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        /* Sidebar Styling */
        .sidebar { background: var(--surface); border-radius: 24px; padding: 24px; height: fit-content; border: 1px solid rgba(255,255,255,0.05); }
        .nav-item-link { display: flex; align-items: center; gap: 12px; padding: 12px 16px; border-radius: 12px; color: var(--text-dim); text-decoration: none; transition: 0.3s; margin-top: 8px; font-weight: 500;}
        .nav-item-link:hover, .nav-item-link.active { background: rgba(78, 115, 223, 0.1); color: var(--primary); }
        .nav-item-link.logout { color: var(--danger); margin-top: 30px; }

        /* ── Main Content Area ── */
        .main-content { padding: 0; }

        /* ── Revenue Header Card ── */
        .revenue-hero {
            background: linear-gradient(135deg, #4e73df 0%, #1e3a8a 100%);
            border-radius: 28px;
            padding: 40px;
            margin-top: 30px;
            margin-bottom: 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            overflow: hidden;
            position: relative;
        }
        .revenue-hero::before {
            content: ''; position: absolute; top: -50px; right: -50px; width: 200px; height: 200px;
            background: rgba(255,255,255,0.05); border-radius: 50%;
        }

        .balance-label { font-size: 0.9rem; font-weight: 600; opacity: 0.8; letter-spacing: 1px; }
        .balance-amount { font-size: 3rem; font-weight: 800; margin: 10px 0; }

        .btn-withdraw {
            background: white; color: var(--primary); border: none;
            padding: 12px 30px; border-radius: 14px; font-weight: 800;
            transition: 0.3s;
        }
        .btn-withdraw:hover { transform: scale(1.05); box-shadow: 0 10px 20px rgba(0,0,0,0.2); }

        /* ── Transaction Table ── */
        .history-card {
            background: var(--surface);
            border-radius: 24px;
            border: 1px solid var(--border);
            padding: 30px;
        }

        .table-modern { color: white; border-collapse: separate; border-spacing: 0 10px; margin-bottom: 0;}
        .table-modern thead th { border: none; color: var(--text-dim); font-size: 0.75rem; text-transform: uppercase; padding: 15px; }
        .table-modern tbody tr { background: rgba(255,255,255,0.02); transition: 0.3s; border-radius: 15px; }
        .table-modern tbody tr:hover { background: rgba(255,255,255,0.05); transform: scale(1.01); }
        .table-modern td { border: none; padding: 20px 15px; vertical-align: middle; }
        .table-modern td:first-child { border-radius: 15px 0 0 15px; }
        .table-modern td:last-child { border-radius: 0 15px 15px 0; }

        .status-dot { width: 8px; height: 8px; border-radius: 50%; display: inline-block; margin-right: 8px; }
        .dot-success { background: var(--emerald); box-shadow: 0 0 10px var(--emerald); }

        .course-mini-img { width: 45px; height: 45px; border-radius: 10px; object-fit: cover; background: #1e293b; }
    </style>
</head>
<body>

<nav class="portal-nav d-flex justify-content-between align-items-center">
<div class="d-flex align-items-center gap-2" onclick="location.href='${pageContext.request.contextPath}/go-home'" style="cursor: pointer;">
        <div class="bg-primary p-2 rounded-3 text-white"><i class="fa-solid fa-graduation-cap"></i></div>
        <h4 class="m-0 fw-bold">E-Learn</h4>
    </div>
    <div class="d-flex align-items-center gap-4">
        <span class="text-dim small d-none d-md-block">Teacher Mode</span>
        <div class="bg-warning rounded-circle text-dark fw-bold d-flex align-items-center justify-content-center" 
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
        
        <%-- LEFT SIDEBAR --%>
        <div class="col-lg-3">
            <div class="sidebar shadow-sm">
                <div class="portal-label mb-3" style="font-size:0.65rem; color:var(--text-dim); font-weight:800;">MENU</div>
                <a href="${pageContext.request.contextPath}/teacher/dashboard" class="nav-item-link"><i class="fa-solid fa-house"></i> Overview</a>
                <a href="${pageContext.request.contextPath}/teacher/courses" class="nav-item-link"><i class="fa-solid fa-book-open"></i> My Courses</a>
                <a href="${pageContext.request.contextPath}/teacher/courses/students" class="nav-item-link"><i class="fa-solid fa-users"></i> Student List</a>
                <a href="${pageContext.request.contextPath}/teacher/revenue" class="nav-item-link active"><i class="fa-solid fa-chart-line"></i> Analytics</a>
                <a href="${pageContext.request.contextPath}/teacher/profile" class="nav-item-link"><i class="fa-solid fa-user-circle"></i> My Profile</a>
                
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
                        <h3 class="fw-bold m-0 text-white"><i class="fa-solid fa-chart-line text-primary me-2"></i>Revenue Analytics</h3>
                        <nav aria-label="breadcrumb">
                          <ol class="breadcrumb mb-0" style="font-size: 0.85rem;">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/teacher/dashboard" class="text-dim text-decoration-none">Dashboard</a></li>
                            <li class="breadcrumb-item active text-white" aria-current="page">Revenue</li>
                          </ol>
                        </nav>
                    </div>
                    <button class="btn btn-outline-light btn-sm rounded-pill px-3" onclick="window.print()">
                        <i class="fa-solid fa-download me-1"></i> Report
                    </button>
                </div>

                <div class="revenue-hero shadow-lg">
                    <div>
                        <div class="balance-label text-white">TOTAL EARNINGS (NET)</div>
                        <div class="balance-amount text-white">₹<c:out value="${totalEarnings}" default="0.00" /></div>
                        <div class="d-flex gap-3 small text-white opacity-75">
                            <span><i class="fa-solid fa-arrow-up me-1 text-emerald"></i> Growth tracking active</span>
                            <span><i class="fa-solid fa-circle-check me-1"></i> Verified Payouts</span>
                        </div>
                    </div>
                    
                </div>

                <div class="history-card">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h5 class="fw-bold m-0 text-white">Recent Sales History</h5>
                        <div class="dropdown">
                            
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-modern">
                            <thead>
                                <tr>
                                    <th>Course Details</th>
                                    <th>Student Email</th>
                                    <th>Date & Time</th>
                                    <th>Amount</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="pay" items="${transactions}">
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-center gap-3">
                                                <c:choose>
                                                    <c:when test="${not empty pay.course.thumbnailUrl}">
                                                        <img src="${pay.course.thumbnailUrl}" class="course-mini-img">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="course-mini-img d-flex align-items-center justify-content-center bg-primary bg-opacity-10 text-primary">
                                                            <i class="fa-solid fa-book"></i>
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                                <div class="fw-bold">${pay.course.title}</div>
                                            </div>
                                        </td>
                                        <td class="text-dim small">${pay.user.email}</td>
                                        <td>
                                            <div class="small fw-bold">${pay.paidAt.toLocalDate()}</div>
                                            <div class="small fw-bold">${pay.paidAt.toLocalTime().toString().substring(0,8)}</div>
                                            <div class="small text-dim" style="font-size: 0.7rem;">TXN: ${pay.transactionId}</div>
                                        </td>
                                        <td class="fw-bold text-success">+ ₹${pay.amount}</td>
                                        <td>
                                            <span class="status-dot dot-success"></span>
                                            <span class="small fw-bold text-emerald">Settled</span>
                                        </td>
                                    </tr>
                                </c:forEach>
                                
                                <c:if test="${empty transactions}">
                                    <tr>
                                        <td colspan="5" class="text-center py-5">
                                            <div class="opacity-25 mb-3 text-white"><i class="fa-solid fa-receipt fa-4x"></i></div>
                                            <h6 class="text-dim">No sales transactions found yet.</h6>
                                            <p class="small text-muted">Your sales will appear here once students enroll.</p>
                                        </td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div> <%-- End Main Content --%>
        </div> <%-- End Col-9 --%>
        
    </div> <%-- End Row --%>
</div> <%-- End Container --%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
