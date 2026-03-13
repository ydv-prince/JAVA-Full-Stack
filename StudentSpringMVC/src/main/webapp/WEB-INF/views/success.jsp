<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Success</title>
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
            max-width: 420px;
            border-radius: 12px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.2);
            text-align: center;
            overflow: hidden;
        }

        .card-header {
            background: linear-gradient(135deg, #27ae60, #1e8449);
            padding: 32px 24px;
        }

        .check-icon {
            width: 64px;
            height: 64px;
            background: rgba(255,255,255,0.2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 14px;
            font-size: 32px;
            color: white;
        }

        .card-header h2 {
            color: white;
            font-size: 20px;
            font-weight: 700;
        }

        .card-body {
            padding: 28px 32px;
        }

        .card-body p {
            color: #666;
            font-size: 14px;
            margin-bottom: 24px;
        }

        .btn-group {
            display: flex;
            gap: 12px;
        }

        .btn {
            flex: 1;
            padding: 11px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            text-decoration: none;
            transition: opacity 0.2s;
            display: inline-block;
        }

        .btn:hover { opacity: 0.85; }

        .btn-primary {
            background: linear-gradient(135deg, #1a73e8, #0d47a1);
            color: white;
        }

        .btn-secondary {
            background: #f0f4ff;
            color: #1a73e8;
            border: 1.5px solid #c5d8ff;
        }
    </style>
</head>
<body>
<div class="card">
    <div class="card-header">
        <div class="check-icon">&#10003;</div>
        <h2>${message}</h2>
    </div>
    <div class="card-body">
        <p>The student record has been saved to the database successfully.</p>
        <div class="btn-group">
            <a href="form"     class="btn btn-primary">Add Student</a>
            <a href="students" class="btn btn-secondary">View All</a>
        </div>
    </div>
</div>
</body>
</html>