package com.servlet;

import com.dao.HostelDAO;
import com.model.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String reportType = request.getParameter("reportType");
            HostelDAO dao = new HostelDAO();
            List<Student> result = null;
            String reportTitle = "";

            if ("pendingFees".equals(reportType)) {
                result = dao.getStudentsWithPendingFees();
                reportTitle = "Students with Pending Fees";
            }

            request.setAttribute("students", result); // ✔️ must be 'students' to match JSP
            request.setAttribute("reportTitle", reportTitle);
            RequestDispatcher dispatcher = request.getRequestDispatcher("report_result.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Error generating report", e);
        }
    }
}
