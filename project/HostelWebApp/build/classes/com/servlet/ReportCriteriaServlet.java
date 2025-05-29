package com.servlet;

import com.dao.HostelDAO;
import com.model.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class ReportCriteriaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String criteria = request.getParameter("criteria");
            HostelDAO dao = new HostelDAO();
            List<Student> students = null;
            String reportTitle = "";

            switch (criteria) {
                case "pendingFees":
                    students = dao.getStudentsWithPendingFees();
                    reportTitle = "Students with Pending Fees";
                    break;
                case "room":
                    String room = request.getParameter("roomNumber");
                    students = dao.getStudentsByRoom(room);
                    reportTitle = "Students in Room " + room;
                    break;
                case "dateRange":
                    String fromDateStr = request.getParameter("fromDate");
                    String toDateStr = request.getParameter("toDate");
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    Date fromDate = sdf.parse(fromDateStr);
                    Date toDate = sdf.parse(toDateStr);
                    students = dao.getStudentsByDateRange(fromDate, toDate);
                    reportTitle = "Students Admitted from " + fromDateStr + " to " + toDateStr;
                    break;
            }

            request.setAttribute("students", students); // ✔️ must match JSP
            request.setAttribute("reportTitle", reportTitle);
            RequestDispatcher dispatcher = request.getRequestDispatcher("report_result.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            throw new ServletException("Error generating report", e);
        }
    }
}
