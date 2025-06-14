// File: com/ogrievance/controller/ViewComplaintServlet.java
package com.ogrievance.controller;

import com.ogrievance.dao.ComplaintDao;
import com.ogrievance.model.Complaint;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/ViewComplaintServlet")
public class ViewComplaintServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ComplaintDao dao = new ComplaintDao();
        ArrayList<Complaint> complaints = dao.getAllComplaints();

        request.setAttribute("complaintList", complaints);
        RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
        rd.forward(request, response);
    }
}
