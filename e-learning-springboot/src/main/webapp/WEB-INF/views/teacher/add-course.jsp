<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Launch New Course | E-Learn</title>
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

        body { background-color: var(--bg-dark); color: white; font-family: 'Plus Jakarta Sans', sans-serif; margin: 0; padding-bottom: 80px; }

        .portal-nav {
            background: rgba(9, 14, 26, 0.85); backdrop-filter: blur(12px);
            padding: 15px 40px; border-bottom: 1px solid var(--border);
            position: sticky; top: 0; z-index: 1000;
        }

        .form-container {
            max-width: 1000px; margin: 40px auto; background: var(--surface);
            border-radius: 32px; border: 1px solid var(--border); overflow: hidden;
            box-shadow: 0 40px 100px rgba(0,0,0,0.6);
        }

        .form-header {
            background: linear-gradient(135deg, #4e73df 0%, #1e3a8a 100%);
            padding: 50px; position: relative;
        }
        
        .form-header::after {
            content: ''; position: absolute; bottom: 0; left: 0; right: 0;
            height: 100px; background: linear-gradient(to top, var(--surface), transparent);
        }

        .form-body { padding: 50px; position: relative; z-index: 2; margin-top: -30px; }

        .custom-label { font-size: 0.7rem; font-weight: 800; color: var(--text-dim); margin-bottom: 12px; text-transform: uppercase; letter-spacing: 1.5px; display: block; }
        
        .custom-input, .custom-textarea, select.custom-input {
            width: 100%; background: rgba(255,255,255,0.02); border: 1px solid var(--border);
            border-radius: 16px; padding: 16px 20px; color: white; transition: 0.4s; outline: none;
        }
        .custom-input:focus, .custom-textarea:focus {
            border-color: var(--primary); background: rgba(78, 115, 223, 0.04);
            box-shadow: 0 0 25px rgba(78, 115, 223, 0.15);
        }

        /* Pricing Badge Style */
        .input-group-text-custom {
            background: rgba(255,255,255,0.05); border: 1px solid var(--border);
            border-radius: 16px 0 0 16px; color: var(--text-dim); font-weight: 700;
        }

        .upload-box {
            border: 2px dashed var(--border); border-radius: 24px;
            padding: 40px; text-align: center; cursor: pointer;
            transition: 0.3s; background: rgba(255,255,255,0.01);
            height: 200px; display: flex; flex-direction: column; align-items: center; justify-content: center;
        }
        .upload-box:hover { border-color: var(--primary); background: rgba(78, 115, 223, 0.05); }
        
        #previewThumb { border-radius: 20px; width: 100%; height: 100%; object-fit: cover; display: none; }

        .btn-submit {
            background: var(--emerald); color: white; border: none;
            padding: 18px 50px; border-radius: 18px; font-weight: 800;
            transition: 0.4s; box-shadow: 0 10px 30px rgba(16, 185, 129, 0.3);
        }
        .btn-submit:hover { transform: translateY(-4px) scale(1.02); box-shadow: 0 20px 40px rgba(16, 185, 129, 0.4); }
        .btn-submit:disabled { opacity: 0.6; cursor: not-allowed; transform: none; }

        .btn-back {
            background: rgba(255,255,255,0.03); color: var(--text-dim);
            border: 1px solid var(--border); padding: 16px 35px;
            border-radius: 18px; text-decoration: none; font-weight: 700; transition: 0.3s;
        }
        .btn-back:hover { background: rgba(255,255,255,0.08); color: white; }
    </style>
</head>
<body>

<nav class="portal-nav d-flex justify-content-between align-items-center">
    <div class="d-flex align-items-center gap-2" onclick="location.href='${pageContext.request.contextPath}/go-home'" style="cursor: pointer;">
        <div class="bg-primary p-2 rounded-3 text-white"><i class="fa-solid fa-graduation-cap"></i></div>
        <h4 class="m-0 fw-bold text-white">E-Learn</h4>
    </div>
    <div class="d-flex align-items-center gap-4">
        <div class="bg-warning rounded-circle text-dark fw-bold d-flex align-items-center justify-content-center" 
             style="width:38px; height:38px; cursor: pointer;">
            <c:out value="${teacher.fullName.substring(0,1).toUpperCase()}" default="R" />
        </div>
    </div>
</nav>

<div class="container">
    <div class="form-container">
        <div class="form-header text-center">
            <h1 class="fw-extrabold m-0 text-white">Launch New Course 🚀</h1>
            <p class="m-0 opacity-75 mt-2 text-white fs-5">Craft a world-class learning experience for your students.</p>
        </div>

        <div class="form-body">
            <form id="courseForm" action="${pageContext.request.contextPath}/teacher/courses/save" method="post" enctype="multipart/form-data">
                
                <div class="row g-4 mb-5">
                    <div class="col-md-8">
                        <label class="custom-label">Full Course Title</label>
                        <input type="text" name="title" class="custom-input" placeholder="e.g. Master Spring Boot 3.0 & Microservices" required>
                    </div>
                    <div class="col-md-4">
    <label class="custom-label">Category</label>
    <select name="categoryId" class="custom-input">
        <option value="" disabled selected style="color: white;">Select Category</option>
        <c:forEach var="cat" items="${categories}">
            <option value="${cat.id}" style="color: black;">${cat.name}</option>
        </c:forEach>
    </select>
</div>
                </div>

                <div class="mb-5">
                    <label class="custom-label">Course Description</label>
                    <textarea name="description" class="custom-textarea" rows="5" placeholder="What makes this course special? Write a compelling summary..."></textarea>
                </div>

                <div class="row g-4 mb-5">
                    <div class="col-md-4">
                        <label class="custom-label">Regular Price (INR)</label>
                        <input type="number" name="price" class="custom-input" placeholder="e.g. 2999" min="0">
                    </div>
                    <div class="col-md-4">
                        <label class="custom-label">Discount Price (INR)</label>
                        <input type="number" name="discountPrice" class="custom-input" placeholder="e.g. 499" min="0">
                    </div>
                    
                </div>

                <div class="mb-5">
                    <label class="custom-label">Learning Outcomes (Separated by commas)</label>
                    <textarea name="whatYoullLearn" class="custom-textarea" rows="3" placeholder="Students will build projects, Master OOPs, Understand APIs..."></textarea>
                    <small class="text-dim mt-2 d-block" style="font-size: 0.7rem;">Tip: Use commas to separate points; they will appear as bullet points for students.</small>
                </div>

                <div class="row g-4 mb-5">
                    <div class="col-md-6">
                        <label class="custom-label">Promotional Thumbnail</label>
                        <div class="upload-box" id="uploadTrigger">
                            <img src="" id="previewThumb" alt="preview">
                            <div id="uploadPlaceholder">
                                <i class="fa-solid fa-image fa-3x text-primary mb-3"></i>
                                <p class="small text-white fw-bold m-0">Drag or Click to Upload</p>
                                <p class="text-dim small mt-1">Recommended: 1280x720 (16:9)</p>
                            </div>
                            <input type="file" name="thumbnail" id="thumbInput" class="d-none" accept="image/*">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label class="custom-label">Preview/Intro Video URL</label>
                        <div class="position-relative">
                            <i class="fa-brands fa-youtube position-absolute top-50 start-0 translate-middle-y ms-3 text-danger fa-lg"></i>
                            <input type="text" name="previewVideoUrl" class="custom-input" style="padding-left: 55px;" placeholder="https://youtube.com/embed/your-video-id">
                        </div>
                        <p class="text-dim mt-2" style="font-size: 0.65rem;">Note: Provide the 'Embed' URL for best video playback experience.</p>
                    </div>
                </div>

                <div class="d-flex justify-content-between align-items-center pt-5 border-top border-secondary border-opacity-10">
                    <a href="${pageContext.request.contextPath}/teacher/dashboard" class="btn-back">Cancel</a>
                    <button type="submit" class="btn-submit" id="submitBtn">
                        Launch Course <i class="fa-solid fa-paper-plane ms-2"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    // 1. Image Preview Logic
    const uploadTrigger = document.getElementById('uploadTrigger');
    const thumbInput = document.getElementById('thumbInput');
    const previewThumb = document.getElementById('previewThumb');
    const uploadPlaceholder = document.getElementById('uploadPlaceholder');

    uploadTrigger.onclick = () => thumbInput.click();

    thumbInput.onchange = (e) => {
        const file = e.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = (event) => {
                previewThumb.src = event.target.result;
                previewThumb.style.display = 'block';
                uploadPlaceholder.style.display = 'none';
            };
            reader.readAsDataURL(file);
        }
    };

    // 2. Loading State Logic
    const form = document.getElementById('courseForm');
    const submitBtn = document.getElementById('submitBtn');

    form.onsubmit = function() {
        submitBtn.disabled = true;
        submitBtn.innerHTML = '<span class="spinner-border spinner-border-sm me-2"></span> Launching...';
        return true; 
    };
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
