package com.servlet;

import com.dao.HostelDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class DeleteStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L; // ✅ Fix for the warning

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int studentID = Integer.parseInt(request.getParameter("studentID"));

            HostelDAO dao = new HostelDAO();
            dao.deleteStudent(studentID);

            response.sendRedirect("studentdisplay.jsp");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
