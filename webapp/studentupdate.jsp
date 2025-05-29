<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.dao.HostelDAO, com.model.Student" %>
<%@ page import="java.util.List" %>
<%
    String studentIDParam = request.getParameter("studentID");
    if (studentIDParam == null) {
        response.sendRedirect("DisplayStudentsServlet");
        return;
    }
    int studentID = Integer.parseInt(studentIDParam);
    Student s = null;
    try {
        HostelDAO dao = new HostelDAO();
        List<Student> allStudents = dao.getAllStudents();
        for (Student st : allStudents) {
            if (st.getStudentID() == studentID) {
                s = st;
                break;
            }
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
    if (s == null) {
        out.println("Student not found.");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Student</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 500px;
            margin: 50px auto;
            padding: 30px;
            background: white;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
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
        }

        input[type="text"],
        input[type="number"],
        input[type="date"] {
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 16px;
        }

        input[type="submit"] {
            padding: 12px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
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
        <h2>✏️ Update Student</h2>
        <form action="UpdateStudentServlet" method="post">
            <input type="hidden" name="studentID" value="<%= s.getStudentID() %>">
            <input type="text" name="studentName" value="<%= s.getStudentName() %>" placeholder="Name" required>
            <input type="text" name="roomNumber" value="<%= s.getRoomNumber() %>" placeholder="Room Number" required>
            <input type="date" name="admissionDate" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(s.getAdmissionDate()) %>" required>
            <input type="number" step="0.01" name="feesPaid" value="<%= s.getFeesPaid() %>" placeholder="Fees Paid" required>
            <input type="number" step="0.01" name="pendingFees" value="<%= s.getPendingFees() %>" placeholder="Pending Fees" required>
            <input type="submit" value="Update Student">
        </form>
        <a class="back-link" href="DisplayStudentsServlet">⬅ Back to Students List</a>
    </div>
</body>
</html>
