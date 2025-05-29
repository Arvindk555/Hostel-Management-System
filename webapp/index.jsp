<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hostel Management System</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #ecf0f3;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background: #fff;
            padding: 80px 50px;
            border-radius: 16px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 500px;
        }

        h1 {
            margin-bottom: 50px;
            color: #2c3e50;
            font-size: 32px;
        }

        .nav-link {
            display: block;
            margin: 25px 0;
            padding: 18px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 12px;
            font-size: 20px;
            transition: all 0.3s ease;
        }

        .nav-link:hover {
            background-color: #2c80b4;
            transform: scale(1.05);
            box-shadow: 0 8px 18px rgba(0, 0, 0, 0.15);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🏨 Hostel Management System</h1>
        <a class="nav-link" href="studentadd.jsp">➕ Add New Student</a>
        <a class="nav-link" href="DisplayStudentsServlet">📋 View Students</a>
        <a class="nav-link" href="reports.jsp">📊 Reports</a>
    </div>
</body>
</html>
