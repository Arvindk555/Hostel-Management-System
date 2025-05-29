<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Student" %>
<%
    List<Student> students = (List<Student>) request.getAttribute("students");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student List</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f6f8;
            padding: 30px;
            margin: 0;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #eee;
        }

        th {
            background-color: #3498db;
            color: white;
        }

        tr:hover {
            background-color: #f0f8ff;
        }

        .actions a {
            padding: 6px 12px;
            text-decoration: none;
            border-radius: 5px;
            color: white;
            font-weight: bold;
            margin: 0 2px;
        }

        .actions a:first-child {
            background-color: #2ecc71;
        }

        .actions a:last-child {
            background-color: #e74c3c;
        }

        .actions a:hover:first-child {
            background-color: #27ae60;
        }

        .actions a:hover:last-child {
            background-color: #c0392b;
        }

        .back-link {
            display: block;
            width: fit-content;
            margin: 30px auto 0;
            text-align: center;
            font-weight: bold;
            text-decoration: none;
            color: #3498db;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>📋 Students</h2>
    <table>
        <tr>
            <th>Student ID</th>
            <th>Name</th>
            <th>Room Number</th>
            <th>Admission Date</th>
            <th>Fees Paid</th>
            <th>Pending Fees</th>
            <th>Actions</th>
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
            <td class="actions">
                <a href="studentupdate.jsp?studentID=<%= s.getStudentID() %>">Update</a>
                <a href="DeleteStudentServlet?studentID=<%= s.getStudentID() %>" onclick="return confirm('Are you sure?');">Delete</a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="7">No students found.</td>
        </tr>
        <%
            }
        %>
    </table>

    <a class="back-link" href="index.jsp">⬅ Back to Home</a>
</body>
</html>
