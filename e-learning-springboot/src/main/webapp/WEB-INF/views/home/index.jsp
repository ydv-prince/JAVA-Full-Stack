<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Learn | Master Your Future</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        :root {
            --bg-dark: #050505;
            --surface: #0f172a; 
            --emerald: #10b981;
            --indigo: #6366f1;
            --text-main: #f8fafc;
            --text-dim: #94a3b8;
            --nav-height: 80px;
        }

        body {
            background-color: var(--bg-dark);
            color: var(--text-main);
            font-family: 'Plus Jakarta Sans', sans-serif;
            margin: 0;
            overflow-x: hidden;
        }

        /* ── Navbar (Same as Browse Page) ── */
        .modern-nav {
            background: rgba(5, 5, 5, 0.9);
            backdrop-filter: blur(15px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.08);
            height: var(--nav-height);
            display: flex;
            align-items: center;
            z-index: 1000;
        }

        .brand-link { text-decoration: none; display: flex; align-items: center; gap: 12px; }
        .brand-icon {
            background: var(--indigo); color: white;
            width: 38px; height: 38px; border-radius: 10px;
            display: flex; align-items: center; justify-content: center;
            box-shadow: 0 0 20px rgba(99, 102, 241, 0.3);
        }
        .brand-name { font-weight: 800; font-size: 1.5rem; color: white; letter-spacing: -0.5px; }

        /* ── Search Bar in Nav ── */
        .nav-search-wrap { position: relative; flex: 1; max-width: 450px; margin: 0 30px; }
        .search-icon { position: absolute; left: 18px; top: 12px; color: var(--text-dim); }
        .search-input {
            width: 100%; background: var(--surface); border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 50px; padding: 10px 20px 10px 50px; color: white; outline: none; transition: 0.3s;
        }
        .search-input:focus { border-color: var(--indigo); background: #161616; }

        .nav-actions { display: flex; align-items: center; gap: 20px; }
        .login-link { color: var(--text-main); text-decoration: none; font-weight: 600; font-size: 0.9rem; }
        .btn-join {
            background: var(--indigo); color: white; padding: 10px 24px;
            border-radius: 50px; font-weight: 700; text-decoration: none; transition: 0.3s;
            box-shadow: 0 0 20px rgba(99, 102, 241, 0.3);
        }
        .btn-join:hover { background: #4f46e5; transform: translateY(-2px); color: white; }

        /* ── Hero Section ── */
        .hero-v2 { padding: 100px 0; min-height: 85vh; display: flex; align-items: center; }
        .hero-title { font-size: 4.5rem; font-weight: 800; line-height: 1.1; letter-spacing: -2px; margin-bottom: 25px; }
        .text-gradient { background: linear-gradient(to right, #10b981, #6366f1); -webkit-background-clip: text; -webkit-text-fill-color: transparent; }
        
        .hero-visual { position: relative; animation: float 6s ease-in-out infinite; }
        @keyframes float { 0%, 100% { transform: translateY(0); } 50% { transform: translateY(-20px); } }
        
        .main-img {
            width: 100%; border-radius: 40px; border: 1px solid rgba(255,255,255,0.1);
            box-shadow: 0 40px 80px rgba(0,0,0,0.6);
        }

        /* ── Category Cards ── */
        .cat-card-dark {
            background: var(--surface); border: 1px solid rgba(255, 255, 255, 0.05);
            padding: 35px 25px; border-radius: 24px; transition: 0.3s; text-decoration: none;
            display: block; text-align: center; height: 100%;
        }
        .cat-card-dark:hover { transform: translateY(-10px); border-color: var(--indigo); background: rgba(255, 255, 255, 0.03); }
        .cat-icon-wrap {
            width: 60px; height: 60px; background: rgba(99, 102, 241, 0.1);
            color: var(--indigo); border-radius: 15px; display: flex; align-items: center; justify-content: center;
            margin: 0 auto 20px; font-size: 1.5rem;
        }

        @media (max-width: 991px) {
            .nav-search-wrap { display: none; }
            .hero-title { font-size: 3rem; }
        }
    </style>
</head>
<body>

<nav class="modern-nav sticky-top">
    <div class="container d-flex justify-content-between align-items-center">
        <a href="${pageContext.request.contextPath}/" class="brand-link">
            <div class="brand-icon"><i class="fa-solid fa-graduation-cap"></i></div>
            <span class="brand-name">E-Learn</span>
        </a>

        <div class="nav-search-wrap">
            <form action="${pageContext.request.contextPath}/courses" method="get">
                <i class="fa-solid fa-magnifying-glass search-icon"></i>
                <input type="text" name="keyword" placeholder="Search for courses..." class="search-input">
            </form>
        </div>

        <div class="nav-actions">
            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    <a href="${pageContext.request.contextPath}/profile" class="text-white text-decoration-none fw-600 me-3">
                        <i class="fa-regular fa-compass me-1"></i> Explore
                    </a>
                    <a href="${pageContext.request.contextPath}/profile" class="btn-join">Dashboard</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/auth/login" class="login-link">Login</a>
                    <a href="${pageContext.request.contextPath}/auth/register" class="btn-join">Join Free</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</nav>

<section class="hero-v2">
    <div class="container">
        <div class="row align-items-center g-5">
            <div class="col-lg-7">
                <div class="mb-3">
                    <span class="badge rounded-pill px-3 py-2" style="background: rgba(16, 185, 129, 0.1); color: #10b981; font-weight: 700;">
                        🚀 20% OFF ALL COURSES THIS WEEK
                    </span>
                </div>
                <h1 class="hero-title">
                    Build skills that <br/>
                    <span class="text-gradient">matter most.</span>
                </h1>
                <p class="text-dim fs-5 mb-5" style="max-width: 550px;">
                    Join 50k+ students learning Java, Python, and AI from industry experts. Your future starts here.
                </p>
                
                <div class="d-flex align-items-center gap-4">
                    <a href="${pageContext.request.contextPath}/courses" class="btn-join px-5 py-3 fs-5">Explore All Courses</a>
                    <a href="#" class="text-white text-decoration-none fw-bold small">
                        <i class="fa-solid fa-circle-play fs-4 align-middle me-2 text-emerald"></i> Learn how it works
                    </a>
                </div>
            </div>

            <div class="col-lg-5">
                <div class="hero-visual">
                    <div class="position-absolute translate-middle" style="top: 10%; left: 0%; z-index: 2;">
                        <div class="bg-dark p-3 rounded-4 border border-secondary shadow-lg">
                            <i class="fa-solid fa-star text-warning me-2"></i> 4.9 Student Rating
                        </div>
                    </div>
                    <img src="https://images.unsplash.com/photo-1522202176988-66273c2fd55f?q=80&w=1200" alt="Learning" class="main-img">
                    <div class="position-absolute translate-middle" style="bottom: 0%; right: 0%; z-index: 2;">
                        <div class="bg-dark p-3 rounded-4 border border-success shadow-lg text-emerald">
                            <i class="fa-solid fa-circle-check me-2"></i> Verified Certificates
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="py-5 mb-5">
    <div class="container text-center">
        <h2 class="fw-800 mb-5">Top <span class="text-gradient">Categories</span></h2>
        <div class="row g-4 text-start">
            <div class="col-lg-3 col-md-6">
                <a href="${pageContext.request.contextPath}/courses?categoryId=1" class="cat-card-dark">
                    <div class="cat-icon-wrap"><i class="fa-solid fa-code"></i></div>
                    <h5 class="text-white fw-bold">Development</h5>
                    <p class="text-muted small m-0">Java, Python, Web</p>
                </a>
            </div>
            <div class="col-lg-3 col-md-6">
                <a href="${pageContext.request.contextPath}/courses?categoryId=2" class="cat-card-dark">
                    <div class="cat-icon-wrap" style="color: #f59e0b; background: rgba(245, 158, 11, 0.1);"><i class="fa-solid fa-palette"></i></div>
                    <h5 class="text-white fw-bold">Design</h5>
                    <p class="text-muted small m-0">UI/UX, Photoshop</p>
                </a>
            </div>
            <div class="col-lg-3 col-md-6">
                <a href="${pageContext.request.contextPath}/courses?categoryId=3" class="cat-card-dark">
                    <div class="cat-icon-wrap" style="color: #10b981; background: rgba(16, 185, 129, 0.1);"><i class="fa-solid fa-robot"></i></div>
                    <h5 class="text-white fw-bold">AI & Data</h5>
                    <p class="text-muted small m-0">ML, Data Science</p>
                </a>
            </div>
            <div class="col-lg-3 col-md-6">
                <a href="${pageContext.request.contextPath}/courses?categoryId=4" class="cat-card-dark">
                    <div class="cat-icon-wrap" style="color: #ec4899; background: rgba(236, 72, 153, 0.1);"><i class="fa-solid fa-bullhorn"></i></div>
                    <h5 class="text-white fw-bold">Marketing</h5>
                    <p class="text-muted small m-0">SEO, Social Media</p>
                </a>
            </div>
        </div>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>