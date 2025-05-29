<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Student" %>
<%
    List<Student> students = (List<Student>) request.getAttribute("students");
    String reportTitle = (String) request.getAttribute("reportTitle");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= reportTitle %></title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f7fa;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1000px;
            margin: 50px auto;
            padding: 30px;
            background-color: #ffffff;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #3498db;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .back-link {
            display: block;
            text-align: center;
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
        <h2><%= reportTitle %></h2>
        <table>
            <tr>
                <th>Student ID</th>
                <th>Name</th>
                <th>Room Number</th>
                <th>Admission Date</th>
                <th>Fees Paid</th>
                <th>Pending Fees</th>
            </tr>
            <%
                if (students != null && !students.isEmpty()) {
                    for (Student s : students) {
            %>
            <tr>
                <td><%= s.getStudentID() %></td>
                <td><%= s.getStudentName() %></td>
                <td><%= s.getRoomNumber() %></td>
                <td><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(s.getAdmissionDate()) %></td>
                <td><%= s.getFeesPaid() %></td>
                <td><%= s.getPendingFees() %></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr><td colspan="6">No students found.</td></tr>
            <%
                }
            %>
        </table>
        <a class="back-link" href="reports.jsp">⬅ Back to Reports</a>
    </div>
</body>
</html>
