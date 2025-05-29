<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Student</title>
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
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            width: 360px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"] {
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        input[type="submit"] {
            margin-top: 15px;
            padding: 12px;
            background-color: #3498db;
            border: none;
            color: white;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #2c80b4;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #3498db;
            font-weight: bold;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
    <h2>➕ Add New Student</h2>

    <% String error = (String) request.getAttribute("error"); %>
    <% if (error != null) { %>
        <p style="color: red; font-weight: bold; text-align: center;"><%= error %></p>
    <% } %>

    <form action="AddStudentServlet" method="post">
        <input type="number" name="studentId" placeholder="Student ID" required>
        <input type="text" name="studentName" placeholder="Name" required>
        <input type="text" name="roomNumber" placeholder="Room Number" required>
        <input type="date" name="admissionDate" required>
        <input type="number" step="0.01" name="feesPaid" placeholder="Fees Paid" required>
        <input type="number" step="0.01" name="pendingFees" placeholder="Pending Fees" required>
        <input type="submit" value="Add Student">
    </form>
    <a class="back-link" href="index.jsp">⬅ Back to Home</a>
</div>

</body>
</html>
