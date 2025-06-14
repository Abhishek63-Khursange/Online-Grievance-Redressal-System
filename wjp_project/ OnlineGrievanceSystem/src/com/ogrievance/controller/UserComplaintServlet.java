package com.ogrievance.controller;

import com.ogrievance.dao.ComplaintDao;
import com.ogrievance.model.Complaint;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/UserComplaintServlet")
public class UserComplaintServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String email = (session != null) ? (String) session.getAttribute("userEmail") : null;

        if (email == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        ComplaintDao dao = new ComplaintDao();
        ArrayList<Complaint> complaints = dao.getComplaintsByEmail(email);

        request.setAttribute("userComplaints", complaints);
        RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
        rd.forward(request, response);
    }
}
