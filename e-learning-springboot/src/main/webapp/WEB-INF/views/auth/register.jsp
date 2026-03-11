<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Register | E-Learn Platform</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet"/>
<style>
:root {
    --dark-1    : #0d0d1a;
    --dark-2    : #1a1a2e;
    --primary   : #4e73df;
    --success   : #1cc88a;
    --warning   : #f6c23e;
    --text      : #e8e8f0;
    --border    : rgba(255,255,255,0.08);
}

body {
    font-family: 'Inter', sans-serif;
    background: var(--dark-1);
    color: var(--text);
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 40px 16px;
}

/* Home Button Style */
.home-btn {
    position: fixed; top: 20px; right: 20px;
    background: rgba(255, 255, 255, 0.05);
    border: 1px solid var(--border);
    color: white; padding: 10px 18px;
    border-radius: 50px; font-size: 0.85rem;
    font-weight: 700; text-decoration: none;
    display: flex; align-items: center; gap: 8px;
    transition: 0.3s; z-index: 1000;
}
.home-btn:hover { background: var(--success); color: white; transform: translateX(-5px); }

.reg-wrapper {
    width: 100%; max-width: 1000px;
    display: grid; grid-template-columns: 1fr 1.2fr;
    border-radius: 24px; overflow: hidden;
    box-shadow: 0 30px 80px rgba(0,0,0,0.6);
    border: 1px solid var(--border);
}

@media (max-width: 991px) {
    .reg-wrapper { grid-template-columns: 1fr; }
    .reg-left { display: none; }
}

.reg-left {
    background: linear-gradient(160deg, #0f3460 0%, #16213e 100%);
    padding: 48px 40px;
    display: flex; flex-direction: column; justify-content: space-between;
}

.reg-logo { display: flex; align-items: center; gap: 12px; }
.reg-logo-icon {
    width: 42px; height: 42px; border-radius: 12px;
    background: linear-gradient(135deg, var(--success), #13a66e);
    display: flex; align-items: center; justify-content: center; color: white;
}

.reg-tagline { font-size: 1.8rem; font-weight: 800; line-height: 1.2; margin-top: 30px; }
.reg-tagline span { color: var(--success); }

.reg-right {
    background: rgba(10,10,24,0.98);
    padding: 40px;
}

.rfield-input {
    width: 100%; background: rgba(255,255,255,0.04);
    border: 1px solid var(--border); border-radius: 10px;
    padding: 12px 15px 12px 40px; color: white; font-size: 0.9rem;
    transition: 0.3s; outline: none;
}
.rfield-input:focus { border-color: var(--success); background: rgba(28,200,138,0.05); }

.role-cards { display: grid; grid-template-columns: 1fr 1fr; gap: 12px; margin-bottom: 20px; }
.role-card {
    border: 1px solid var(--border); border-radius: 12px; padding: 12px;
    text-align: center; cursor: pointer; transition: 0.3s; background: rgba(255,255,255,0.02);
}
.role-card.selected { border-color: var(--success); background: rgba(28,200,138,0.1); color: var(--success); }

.btn-reg {
    width: 100%; border: none; border-radius: 12px; padding: 14px;
    background: linear-gradient(135deg, var(--success), #13a66e);
    color: white; font-weight: 700; transition: 0.3s;
}
.btn-reg:hover { transform: translateY(-2px); box-shadow: 0 10px 25px rgba(28,200,138,0.4); }

.scroll-form { max-height: 600px; overflow-y: auto; padding-right: 10px; }
.scroll-form::-webkit-scrollbar { width: 5px; }
.scroll-form::-webkit-scrollbar-thumb { background: var(--border); border-radius: 10px; }
</style>
</head>
<body>

            <a href="${pageContext.request.contextPath}/go-home" class="home-btn">
    <i class="fa-solid fa-house"></i> Home
</a>

<div class="reg-wrapper">
    <div class="reg-left">
        <div>
            <div class="reg-logo">
                <div class="reg-logo-icon"><i class="fa-solid fa-graduation-cap"></i></div>
                <span class="fw-bold fs-5">E-<span style="color:var(--warning)">Learn</span></span>
            </div>
            <h2 class="reg-tagline">Start Your<br/><span>Learning Journey.</span></h2>
            
            <div class="mt-5">
                <div class="d-flex gap-3 mb-4">
                    <div style="width:30px; height:30px; border-radius:50%; background:rgba(28,200,138,0.2); color:var(--success); display:flex; align-items:center; justify-content:center; font-weight:800; flex-shrink:0;">1</div>
                    <div><div class="fw-bold small">Create Account</div><div class="text-white-50 small">Quick registration process</div></div>
                </div>
                <div class="d-flex gap-3 mb-4">
                    <div style="width:30px; height:30px; border-radius:50%; background:rgba(28,200,138,0.2); color:var(--success); display:flex; align-items:center; justify-content:center; font-weight:800; flex-shrink:0;">2</div>
                    <div><div class="fw-bold small">Upload Profile</div><div class="text-white-50 small">Tell us about yourself</div></div>
                </div>
            </div>
        </div>
        <div class="p-3 rounded-4" style="background: rgba(255,255,255,0.05); border: 1px solid var(--border);">
            <p class="small fst-italic text-white-50">"E-Learn transformed my career. Join our global community today!"</p>
            
        </div>
    </div>

    <div class="reg-right">
        <div class="mb-4">
            <h3 class="fw-bold">Create Account 🚀</h3>
            <p class="text-white-50 small">Already have an account? <a href="${pageContext.request.contextPath}/auth/login" class="text-decoration-none" style="color:var(--primary)">Login here</a></p>
        </div>

        <form action="${pageContext.request.contextPath}/auth/register" method="post" enctype="multipart/form-data" class="scroll-form">
            
            <label class="text-white-50 small fw-bold mb-2">I AM REGISTERING AS</label>
            <div class="role-cards">
                <div class="role-card selected" id="cardStudent" onclick="pickRole('STUDENT')">
                    <i class="fa-solid fa-user-graduate mb-1"></i>
                    <div class="small fw-bold">Student</div>
                    <input type="radio" name="role" value="STUDENT" id="roleStudent" checked class="d-none"/>
                </div>
                <div class="role-card" id="cardTeacher" onclick="pickRole('TEACHER')">
                    <i class="fa-solid fa-chalkboard-user mb-1"></i>
                    <div class="small fw-bold">Teacher</div>
                    <input type="radio" name="role" value="TEACHER" id="roleTeacher" class="d-none"/>
                </div>
            </div>

            <div class="mb-3">
                <label class="text-white-50 small fw-bold mb-1">FULL NAME</label>
                <div class="position-relative">
                    <i class="fa-solid fa-user position-absolute top-50 start-0 translate-middle-y ms-3 text-white-50"></i>
                    <input type="text" name="fullName" class="rfield-input" placeholder="Your full name" required/>
                </div>
            </div>

            <div class="mb-3">
                <label class="text-white-50 small fw-bold mb-1">EMAIL ADDRESS</label>
                <div class="position-relative">
                    <i class="fa-solid fa-envelope position-absolute top-50 start-0 translate-middle-y ms-3 text-white-50"></i>
                    <input type="email" name="email" class="rfield-input" placeholder="name@example.com" required/>
                </div>
            </div>

            <div class="row g-3 mb-3">
                <div class="col-6">
                    <label class="text-white-50 small fw-bold mb-1">PHONE NUMBER</label>
                    <div class="position-relative">
                        <i class="fa-solid fa-phone position-absolute top-50 start-0 translate-middle-y ms-3 text-white-50"></i>
                        <input type="text" name="phone" class="rfield-input" placeholder="+91..." />
                    </div>
                </div>
                <div class="col-6">
                    <label class="text-white-50 small fw-bold mb-1">PROFILE PICTURE</label>
                    <input type="file" name="profileImage" class="rfield-input" style="padding-left:15px; padding-top:8px; font-size:0.7rem;" />
                </div>
            </div>

            <div class="mb-3">
                <label class="text-white-50 small fw-bold mb-1">BIO / DESCRIPTION</label>
                <textarea name="bio" class="rfield-input" style="padding-left:15px; height:80px;" placeholder="Tell us about yourself..."></textarea>
            </div>

            <div class="row g-3 mb-4">
                <div class="col-6">
                    <label class="text-white-50 small fw-bold mb-1">PASSWORD</label>
                    <div class="position-relative">
                        <i class="fa-solid fa-lock position-absolute top-50 start-0 translate-middle-y ms-3 text-white-50"></i>
                        <input type="password" name="password" class="rfield-input" placeholder="Min 6 chars" required/>
                    </div>
                </div>
                <div class="col-6">
                    <label class="text-white-50 small fw-bold mb-1">CONFIRM</label>
                    <div class="position-relative">
                        <i class="fa-solid fa-shield position-absolute top-50 start-0 translate-middle-y ms-3 text-white-50"></i>
                        <input type="password" name="confirmPassword" class="rfield-input" placeholder="Repeat" required/>
                    </div>
                </div>
            </div>

            <button type="submit" class="btn-reg">Create Account</button>
        </form>
    </div>
</div>

<script>
function pickRole(role) {
    document.getElementById('roleStudent').checked = (role === 'STUDENT');
    document.getElementById('roleTeacher').checked = (role === 'TEACHER');
    document.getElementById('cardStudent').classList.toggle('selected', role === 'STUDENT');
    document.getElementById('cardTeacher').classList.toggle('selected', role === 'TEACHER');
}
</script>
</body>
</html>
