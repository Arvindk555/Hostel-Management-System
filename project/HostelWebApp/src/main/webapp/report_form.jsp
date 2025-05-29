<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String criteria = request.getParameter("criteria");
    if (criteria == null) {
        response.sendRedirect("reports.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Report Criteria</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f7fa;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 500px;
            margin: 60px auto;
            padding: 30px;
            background-color: #ffffff;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 25px;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="date"] {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 6px;
            width: 100%;
        }

        input[type="submit"] {
            padding: 12px;
            font-size: 16px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 25px;
            color: #3498db;
            text-decoration: none;
            font-weight: bold;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>📋 Report Criteria</h2>
        <form action="ReportCriteriaServlet" method="post">
            <input type="hidden" name="criteria" value="<%= criteria %>">

            <%
                if ("room".equals(criteria)) {
            %>
                <label for="roomNumber">🏠 Room Number:</label>
                <input type="text" name="roomNumber" id="roomNumber" required>
            <%
                } else if ("dateRange".equals(criteria)) {
            %>
                <label for="fromDate">📅 Start Date:</label>
                <input type="date" name="fromDate" id="fromDate" required>

                <label for="toDate">📅 End Date:</label>
                <input type="date" name="toDate" id="toDate" required>
            <%
                }
            %>

            <input type="submit" value="Generate Report">
        </form>
        <a class="back-link" href="reports.jsp">⬅ Back to Reports</a>
    </div>
</body>
</html>
