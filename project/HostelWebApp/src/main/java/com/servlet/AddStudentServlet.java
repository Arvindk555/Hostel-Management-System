package com.servlet;

import com.dao.HostelDAO;
import com.model.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.sql.SQLIntegrityConstraintViolationException;

public class AddStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private HostelDAO hostelDAO;

    @Override
    public void init() {
        hostelDAO = new HostelDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int studentId = Integer.parseInt(request.getParameter("studentId"));
            String studentName = request.getParameter("studentName");
            String roomNumber = request.getParameter("roomNumber");

            String dateStr = request.getParameter("admissionDate");
            java.util.Date utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);
            Date admissionDate = new Date(utilDate.getTime());

            double feesPaid = Double.parseDouble(request.getParameter("feesPaid"));
            double pendingFees = Double.parseDouble(request.getParameter("pendingFees"));

            Student student = new Student(studentId, studentName, roomNumber, admissionDate, feesPaid, pendingFees);

            boolean added = hostelDAO.addStudent(student);

            if (added) {
                response.sendRedirect("DisplayStudentsServlet");
            } else {
                request.setAttribute("error", "❌ Student with this ID already exists.");
                request.getRequestDispatcher("studentadd.jsp").forward(request, response);
            }

        } catch (Exception e) {
            request.setAttribute("error", "❌ Error while adding student: " + e.getMessage());
            request.getRequestDispatcher("studentadd.jsp").forward(request, response);
        }
    }
}
