package com.ogrievance.controller;

import com.ogrievance.dao.ComplaintDao;
import com.ogrievance.model.Complaint;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.RequestDispatcher;

import java.io.IOException;
import java.util.List;

@WebServlet("/AdminServlet")

public class AdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AdminServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Only allow access if user is admin
        if (session == null || !"admin".equals(session.getAttribute("role"))) {
        	request.getRequestDispatcher("admin.jsp").forward(request, response);

            return;
        }

        // Get all complaints from DAO
        List<Complaint> complaintList = ComplaintDao.getAllComplaints();

        // Set as request attribute
        request.setAttribute("complaintList", complaintList);

        // Forward to admin.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin.jsp");
        dispatcher.forward(request, response);
    }
}
