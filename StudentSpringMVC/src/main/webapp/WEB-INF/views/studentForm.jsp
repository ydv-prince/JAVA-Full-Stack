<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert Student</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #1a73e8, #0d47a1);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .card {
            background: #fff;
            width: 100%;
            max-width: 480px;
            border-radius: 12px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.2);
            overflow: hidden;
        }

        .card-header {
            background: linear-gradient(135deg, #1a73e8, #0d47a1);
            color: white;
            padding: 24px 32px;
            text-align: center;
        }

        .card-header h2 {
            font-size: 22px;
            font-weight: 700;
            letter-spacing: 0.5px;
        }

        .card-header p {
            font-size: 13px;
            opacity: 0.85;
            margin-top: 4px;
        }

        .card-body {
            padding: 28px 32px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        label {
            display: block;
            font-size: 13px;
            font-weight: 600;
            color: #444;
            margin-bottom: 6px;
        }

        input {
            width: 100%;
            padding: 11px 14px;
            border: 1.5px solid #ddd;
            border-radius: 8px;
            font-size: 14px;
            color: #333;
            transition: border-color 0.2s, box-shadow 0.2s;
            outline: none;
        }

        input:focus {
            border-color: #1a73e8;
            box-shadow: 0 0 0 3px rgba(26,115,232,0.15);
        }

        .btn-submit {
            width: 100%;
            padding: 13px;
            background: linear-gradient(135deg, #1a73e8, #0d47a1);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            margin-top: 6px;
            transition: opacity 0.2s;
        }

        .btn-submit:hover { opacity: 0.9; }

        .card-footer {
            text-align: center;
            padding: 14px 32px 22px;
            border-top: 1px solid #f0f0f0;
        }

        .card-footer a {
            color: #1a73e8;
            text-decoration: none;
            font-size: 13px;
            font-weight: 500;
        }

        .card-footer a:hover { text-decoration: underline; }
    </style>
</head>
<body>
<div class="card">
    <div class="card-header">
        <h2>Student Registration</h2>
        <p>Fill in the details to add a new student</p>
    </div>

    <div class="card-body">
        <form:form action="saveStudent" method="post" modelAttribute="student">

            <div class="form-group">
                <label>Full Name</label>
                <form:input path="name" placeholder="Enter full name" />
            </div>

            <div class="form-group">
                <label>Email Address</label>
                <form:input path="email" placeholder="Enter email address" />
            </div>

            <div class="form-group">
                <label>Course</label>
                <form:input path="course" placeholder="Enter course name" />
            </div>

            <button type="submit" class="btn-submit">Save Student</button>
        </form:form>
    </div>

    <div class="card-footer">
        <a href="students">&#8594; View All Students</a>
    </div>
</div>
</body>
</html>