package com.servlet;

import com.dao.HostelDAO;
import com.model.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;

public class UpdateStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L; // Fixes the warning

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int studentID = Integer.parseInt(request.getParameter("studentID"));
            String studentName = request.getParameter("studentName");
            String roomNumber = request.getParameter("roomNumber");

            // Convert to java.sql.Date
            java.util.Date utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("admissionDate"));
            java.sql.Date admissionDate = new java.sql.Date(utilDate.getTime());

            double feesPaid = Double.parseDouble(request.getParameter("feesPaid"));
            double pendingFees = Double.parseDouble(request.getParameter("pendingFees"));

            Student s = new Student();
            s.setStudentID(studentID);
            s.setStudentName(studentName);
            s.setRoomNumber(roomNumber);
            s.setAdmissionDate(admissionDate); // ✅ Fixed here
            s.setFeesPaid(feesPaid);
            s.setPendingFees(pendingFees);

            HostelDAO dao = new HostelDAO();
            dao.updateStudent(s);

            response.sendRedirect("DisplayStudentsServlet");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
