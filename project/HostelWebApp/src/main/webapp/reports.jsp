<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reports</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            width: 500px;
            padding: 60px 40px;
            background-color: #fff;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
            border-radius: 16px;
            text-align: center;
        }

        h2 {
            color: #2c3e50;
            margin-bottom: 40px;
            font-size: 28px;
        }

        ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        li {
            margin: 20px 0;
        }

        a.report-link {
            display: block;
            padding: 16px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 10px;
            font-weight: bold;
            font-size: 18px;
            transition: all 0.3s ease;
        }

        a.report-link:hover {
            background-color: #2c80b4;
            transform: scale(1.05);
            box-shadow: 0 8px 18px rgba(0, 0, 0, 0.15);
        }

        .back-link {
            display: block;
            margin-top: 30px;
            color: #3498db;
            text-decoration: none;
            font-weight: bold;
            font-size: 16px;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>📊 Reports</h2>
        <ul>
            <li><a class="report-link" href="ReportServlet?reportType=pendingFees">💰 Students with Pending Fees</a></li>
            <li><a class="report-link" href="report_form.jsp?criteria=room">🏠 Students in a Particular Room</a></li>
            <li><a class="report-link" href="report_form.jsp?criteria=dateRange">📅 Students Admitted in a Date Range</a></li>
        </ul>
        <a class="back-link" href="index.jsp">⬅ Back to Home</a>
    </div>
</body>
</html>
