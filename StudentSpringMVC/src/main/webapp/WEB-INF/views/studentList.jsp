<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student List</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #1a73e8, #0d47a1);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .card {
            background: #fff;
            width: 100%;
            max-width: 780px;
            border-radius: 12px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.2);
            overflow: hidden;
        }

        .card-header {
            background: linear-gradient(135deg, #1a73e8, #0d47a1);
            color: white;
            padding: 22px 32px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .card-header h2 {
            font-size: 20px;
            font-weight: 700;
        }

        .card-header a {
            background: rgba(255,255,255,0.2);
            color: white;
            text-decoration: none;
            padding: 8px 16px;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 600;
            transition: background 0.2s;
        }

        .card-header a:hover { background: rgba(255,255,255,0.35); }

        .table-wrapper {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
        }

        thead th {
            background: #f0f4ff;
            color: #1a73e8;
            font-weight: 700;
            padding: 14px 20px;
            text-align: left;
            border-bottom: 2px solid #c5d8ff;
            white-space: nowrap;
        }

        tbody tr {
            border-bottom: 1px solid #f0f0f0;
            transition: background 0.15s;
        }

        tbody tr:hover { background: #f7f9ff; }

        tbody td {
            padding: 13px 20px;
            color: #444;
        }

        .badge {
            display: inline-block;
            background: #e8f0fe;
            color: #1a73e8;
            border-radius: 20px;
            padding: 3px 12px;
            font-size: 12px;
            font-weight: 600;
        }

        .id-cell {
            color: #999;
            font-weight: 600;
            font-size: 13px;
        }

        .empty-state {
            text-align: center;
            padding: 50px 20px;
            color: #aaa;
        }

        .empty-state p { font-size: 15px; margin-bottom: 16px; }

        .empty-state a {
            color: #1a73e8;
            text-decoration: none;
            font-weight: 600;
        }
    </style>
</head>
<body>
<div class="card">
    <div class="card-header">
        <h2>&#128203; Student List</h2>
        <a href="form">+ Add Student</a>
    </div>

    <div class="table-wrapper">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Course</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${empty studentList}">
                        <tr>
                            <td colspan="4">
                                <div class="empty-state">
                                    <p>No student records found.</p>
                                    <a href="form">+ Add your first student</a>
                                </div>
                            </td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="student" items="${studentList}">
                            <tr>
                                <td class="id-cell">#${student.id}</td>
                                <td>${student.name}</td>
                                <td>${student.email}</td>
                                <td><span class="badge">${student.course}</span></td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>