// File: com/ogrievance/controller/ComplaintServlet.java
package com.ogrievance.controller;

import com.ogrievance.dao.ComplaintDao;
import com.ogrievance.model.Complaint;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/ComplaintServlet")
public class ComplaintServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("userEmail");

        if (email == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Complaint c = new Complaint();
        c.setEmail(email);
        c.setSubject(request.getParameter("subject"));
        c.setCategory(request.getParameter("category"));
        c.setDescription(request.getParameter("description"));

        ComplaintDao dao = new ComplaintDao();
        boolean status = dao.submitComplaint(c);

        if (status) {
            response.sendRedirect("dashboard.jsp");
        } else {
            response.sendRedirect("complaint.jsp?error=true");
        }
    }
}
