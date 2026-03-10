<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Login | E-Learn</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet"/>
<style>
/* Existing Styles Unchanged */
*{box-sizing:border-box;margin:0;padding:0}
body{font-family:'Inter',sans-serif;background:#0a0a1a;min-height:100vh;display:flex;align-items:center;justify-content:center;padding:20px;}
body::before{content:'';position:fixed;width:600px;height:600px;border-radius:50%;background:radial-gradient(circle,rgba(78,115,223,0.12) 0%,transparent 65%);top:-200px;left:-200px;pointer-events:none;}
body::after{content:'';position:fixed;width:500px;height:500px;border-radius:50%;background:radial-gradient(circle,rgba(28,200,138,0.08) 0%,transparent 65%);bottom:-150px;right:-150px;pointer-events:none;}
.card{width:100%;max-width:920px;display:grid;grid-template-columns:1fr 1fr;min-height:580px;border-radius:22px;overflow:hidden;position:relative;z-index:1;box-shadow:0 30px 80px rgba(0,0,0,0.6);border:1px solid rgba(255,255,255,0.07);}
@media(max-width:768px){.card{grid-template-columns:1fr}.left{display:none}}
.left{background:linear-gradient(155deg,#0f3460 0%,#16213e 50%,#12122a 100%);padding:50px 44px;display:flex;flex-direction:column;justify-content:space-between;position:relative;overflow:hidden;}
.brand{display:flex;align-items:center;gap:12px;margin-bottom:44px;position:relative;z-index:1}
.brand-ico{width:46px;height:46px;border-radius:13px;background:linear-gradient(135deg,#4e73df,#224abe);display:flex;align-items:center;justify-content:center;color:white;font-size:1.1rem;box-shadow:0 6px 20px rgba(78,115,223,0.4);}
.brand-name{font-size:1.25rem;font-weight:800;color:white}
.brand-name .y{color:#f6c23e}
.lc{position:relative;z-index:1;flex:1;display:flex;flex-direction:column;justify-content:center}
.lh{font-size:1.7rem;font-weight:900;color:white;line-height:1.2;margin-bottom:14px}
.lh span{background:linear-gradient(135deg,#7b9ef0,#4dffc5);-webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text}
.ld{font-size:0.87rem;color:rgba(255,255,255,0.5);line-height:1.75;margin-bottom:32px}
.fi{display:flex;align-items:center;gap:12px;margin-bottom:14px}
.fd{width:34px;height:34px;border-radius:9px;display:flex;align-items:center;justify-content:center;font-size:0.8rem;flex-shrink:0}
.fb{background:rgba(78,115,223,0.2);color:#7b9ef0}
.fg{background:rgba(28,200,138,0.2);color:#4dffc5}
.fy{background:rgba(246,194,62,0.2);color:#ffe082}
.fr{background:rgba(231,74,59,0.2);color:#ff8a80}
.ft{font-size:0.83rem;color:rgba(255,255,255,0.6);font-weight:500}
.stats{display:grid;grid-template-columns:repeat(4,1fr);gap:10px;padding-top:24px;border-top:1px solid rgba(255,255,255,0.08);position:relative;z-index:1}
.sn{font-size:1.1rem;font-weight:900;color:white}
.sl{font-size:0.65rem;color:rgba(255,255,255,0.4);text-transform:uppercase;letter-spacing:.5px}
.right{background:rgba(8,8,22,0.98);display:flex;flex-direction:column}
.stripe{height:4px;background:linear-gradient(90deg,#4e73df 0%,#1cc88a 50%,#e74a3b 100%)}
.ri{padding:36px 40px 40px;flex:1;display:flex;flex-direction:column;justify-content:center}
.t1{font-size:1.35rem;font-weight:800;color:white;margin-bottom:4px}
.t2{font-size:0.82rem;color:rgba(255,255,255,0.4);margin-bottom:22px}
.rtabs{display:grid;grid-template-columns:repeat(3,1fr);gap:7px;background:rgba(255,255,255,0.03);border:1px solid rgba(255,255,255,0.07);border-radius:13px;padding:5px;margin-bottom:18px}
.rtab{border:2px solid transparent;border-radius:9px;background:transparent;padding:9px 4px;cursor:pointer;font-family:'Inter',sans-serif;display:flex;flex-direction:column;align-items:center;gap:4px;transition:all .2s;color:rgba(255,255,255,0.3)}
.rtab i{font-size:1.1rem}
.rtab span{font-size:.7rem;font-weight:700;text-transform:uppercase}
.on-s{background:rgba(78,115,223,.15);border-color:rgba(78,115,223,.4);color:#7b9ef0}
.on-t{background:rgba(28,200,138,.15);border-color:rgba(28,200,138,.4);color:#4dffc5}
.on-a{background:rgba(231,74,59,.15);border-color:rgba(231,74,59,.4);color:#ff8a80}
.strip{border-radius:9px;padding:9px 13px;font-size:.8rem;font-weight:600;margin-bottom:20px;display:flex;align-items:center;gap:7px}
.ss{background:rgba(78,115,223,.1);color:#7b9ef0;border:1px solid rgba(78,115,223,.2)}
.st{background:rgba(28,200,138,.1);color:#4dffc5;border:1px solid rgba(28,200,138,.2)}
.sa{background:rgba(231,74,59,.1);color:#ff8a80;border:1px solid rgba(231,74,59,.2)}
.ae{background:rgba(231,74,59,.12);color:#ff8a80;border-left:3px solid #e74a3b;border-radius:9px;padding:10px 13px;font-size:.82rem;display:flex;align-items:center;gap:8px;margin-bottom:16px}
.as{background:rgba(28,200,138,.12);color:#4dffc5;border-left:3px solid #1cc88a;border-radius:9px;padding:10px 13px;font-size:.82rem;display:flex;align-items:center;gap:8px;margin-bottom:16px}
.fw{margin-bottom:15px}
.fl{display:block;font-size:.72rem;font-weight:700;text-transform:uppercase;letter-spacing:.6px;color:rgba(255,255,255,.4);margin-bottom:7px}
.fg2{position:relative;display:flex;align-items:center}
.fi2{position:absolute;left:12px;color:rgba(255,255,255,.3);font-size:.82rem;pointer-events:none;z-index:1}
.finput{width:100%;background:rgba(255,255,255,.04);border:1.5px solid rgba(255,255,255,.09);border-radius:10px;padding:11px 38px;color:#e8e8f0;font-size:.88rem;font-family:'Inter',sans-serif;outline:none;transition:all .2s}
.finput:focus{border-color:rgba(78,115,223,.55);background:rgba(78,115,223,.06);box-shadow:0 0 0 4px rgba(78,115,223,.1);color:white}
.btnl{width:100%;border:none;border-radius:11px;padding:13px;font-size:.92rem;font-weight:800;font-family:'Inter',sans-serif;cursor:pointer;transition:all .25s;display:flex;align-items:center;justify-content:center;gap:8px;margin-bottom:20px}
.divdr{display:flex;align-items:center;gap:10px;color:rgba(255,255,255,.2);font-size:.72rem;margin-bottom:14px}
.demo{background:rgba(255,255,255,.02);border:1px dashed rgba(255,255,255,.1);border-radius:11px;padding:13px;margin-bottom:18px}
.dh{font-size:.67rem;font-weight:800;text-transform:uppercase;letter-spacing:.8px;color:rgba(255,255,255,.25);margin-bottom:9px;display:flex;align-items:center;gap:5px}
.dr{display:flex;align-items:center;justify-content:space-between;padding:7px 9px;border-radius:7px;cursor:pointer;transition:background .15s;margin-bottom:3px}
.dr:hover{background:rgba(255,255,255,.05)}
.dl{display:flex;align-items:center;gap:8px;font-size:.77rem;color:rgba(255,255,255,.5)}
.lf{text-align:center;font-size:.82rem;color:rgba(255,255,255,.4)}
.lf a{color:#7b9ef0;font-weight:700;text-decoration:none}
.lf a:hover{color:white}

/* New Home Button Style */
.home-btn {
    position: absolute;
    top: 20px;
    right: 20px;
    background: rgba(255, 255, 255, 0.05);
    border: 1px solid rgba(255, 255, 255, 0.1);
    color: white;
    padding: 8px 16px;
    border-radius: 50px;
    font-size: 0.8rem;
    font-weight: 700;
    text-decoration: none;
    display: flex;
    align-items: center;
    gap: 8px;
    transition: 0.3s;
    z-index: 100;
}
.home-btn:hover { background: var(--emerald); border-color: var(--emerald); color: white; transform: translateX(-5px); }
</style>
</head>
<body>

            <a href="${pageContext.request.contextPath}/go-home" class="home-btn">
    <i class="fa-solid fa-house"></i> Back to Home
</a>

<div class="card">
    <div class="left">
        <div>
            <div class="brand">
                <div class="brand-ico">
                    <i class="fa-solid fa-graduation-cap"></i>
                </div>
                <span class="brand-name">E-Learn<span class="y">.</span></span>
            </div>
            <div class="lc">
                <h2 class="lh">Learn Without<br/><span>Limits.</span></h2>
                <p class="ld">
                    Learn from top industry instructors. Build your career with real projects, verified certificates, and lifetime access.
                </p>
                <div class="fi">
                    <div class="fd fb"><i class="fa-solid fa-play"></i></div>
                    <span class="ft">1000+ HD Video Courses</span>
                </div>
                <div class="fi">
                    <div class="fd fg"><i class="fa-solid fa-certificate"></i></div>
                    <span class="ft">Verified Certificates</span>
                </div>
                <div class="fi">
                    <div class="fd fy"><i class="fa-solid fa-users"></i></div>
                    <span class="ft">50,000+ Active Learners</span>
                </div>
                <div class="fi">
                    <div class="fd fr"><i class="fa-solid fa-infinity"></i></div>
                    <span class="ft">Lifetime Access</span>
                </div>
            </div>
        </div>
        <div class="stats">
            <div><div class="sn">1K+</div><div class="sl">Courses</div></div>
            <div><div class="sn">50K+</div><div class="sl">Students</div></div>
            <div><div class="sn">200+</div><div class="sl">Teachers</div></div>
            <div><div class="sn" style="color:#f6c23e">4.9★</div><div class="sl">Rating</div></div>
        </div>
    </div>

    <div class="right">
        <div class="stripe"></div>
        <div class="ri">
            <div class="t1">Welcome Back 👋</div>
            <div class="t2">Select your role to sign in</div>

            <c:if test="${not empty errorMsg}">
                <div class="ae"><i class="fa-solid fa-circle-xmark"></i><span>${errorMsg}</span></div>
            </c:if>
            <c:if test="${not empty successMsg}">
                <div class="as"><i class="fa-solid fa-circle-check"></i><span>${successMsg}</span></div>
            </c:if>
            <c:if test="${param.error != null}">
                <div class="ae"><i class="fa-solid fa-circle-xmark"></i><span>Invalid email or password!</span></div>
            </c:if>

            <div class="rtabs">
                <button class="rtab on-s" id="rb-s" onclick="pick('s')"><i class="fa-solid fa-user-graduate"></i><span>Student</span></button>
                <button class="rtab" id="rb-t" onclick="pick('t')"><i class="fa-solid fa-chalkboard-user"></i><span>Teacher</span></button>
                <button class="rtab" id="rb-a" onclick="pick('a')"><i class="fa-solid fa-shield-halved"></i><span>Admin</span></button>
            </div>

            <div class="strip ss" id="strip">
                <i class="fa-solid fa-circle-info"></i>
                <span id="stxt">Student portal — Access your courses</span>
            </div>

            <form action="${pageContext.request.contextPath}/perform_login" method="post">
                <div class="fw">
                    <label class="fl">Email Address</label>
                    <div class="fg2">
                        <i class="fa-solid fa-envelope fi2"></i>
                        <input type="email" name="email" id="eml" class="finput" placeholder="your@email.com" required/>
                    </div>
                </div>

                <div class="fw">
                    <label class="fl">Password</label>
                    <div class="fg2">
                        <i class="fa-solid fa-lock fi2"></i>
                        <input type="password" name="password" id="pwd" class="finput" placeholder="••••••••" required/>
                        <button type="button" class="eyebtn" onclick="toggleEye()"><i class="fa-solid fa-eye" id="eyeI"></i></button>
                    </div>
                </div>

               

                <button type="submit" class="btnl bl-s" id="lbtn">
                    <i class="fa-solid fa-right-to-bracket" id="lico"></i>
                    <span id="ltxt">Sign in as Student</span>
                </button>
            </form>

            

            <p class="lf">Don't have an account?&nbsp;<a href="${pageContext.request.contextPath}/auth/register">Create Account</a></p>
        </div>
    </div>
</div>

<script>
var R={
    s:{on:'on-s',st:'ss',txt:'Student portal — Access your courses',btn:'bl-s',lbl:'Sign in as Student',ico:'fa-user-graduate'},
    t:{on:'on-t',st:'st',txt:'Teacher portal — Manage your courses',btn:'bl-t',lbl:'Sign in as Teacher',ico:'fa-chalkboard-user'},
    a:{on:'on-a',st:'sa',txt:'Admin portal — Complete platform control',btn:'bl-a',lbl:'Sign in as Admin',ico:'fa-shield-halved'}
};
var cur='s';
function pick(r){
    cur=r;var c=R[r];
    ['s','t','a'].forEach(function(x){
        var b=document.getElementById('rb-'+x);
        b.className='rtab'+(x===r?' '+c.on:'');
    });
    var s=document.getElementById('strip');
    s.className='strip '+c.st;
    document.getElementById('stxt').textContent=c.txt;
    var btn=document.getElementById('lbtn');
    btn.className='btnl '+c.btn;
    document.getElementById('ltxt').textContent=c.lbl;
    document.getElementById('lico').className='fa-solid '+c.ico;
}
function toggleEye(){
    var i=document.getElementById('pwd');
    var e=document.getElementById('eyeI');
    if(i.type==='password'){i.type='text';e.className='fa-solid fa-eye-slash';}
    else{i.type='password';e.className='fa-solid fa-eye';}
}
function fill(email,pwd,role){
    document.getElementById('eml').value=email;
    document.getElementById('pwd').value=pwd;
    pick(role);
}
</script>
</body>
</html>
