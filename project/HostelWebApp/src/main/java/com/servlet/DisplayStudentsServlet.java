package com.servlet;

import com.dao.HostelDAO;
import com.model.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class DisplayStudentsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L; // ✅ Added to fix serialization warning

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HostelDAO dao = new HostelDAO();
            List<Student> studentList = dao.getAllStudents();

            request.setAttribute("students", studentList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("studentdisplay.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
