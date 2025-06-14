// File: com/ogrievance/controller/UpdateStatusServlet.java
package com.ogrievance.controller;

import com.ogrievance.dao.ComplaintDao;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/UpdateStatusServlet")
public class UpdateStatusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int complaintId = Integer.parseInt(request.getParameter("complaintId"));
            String newStatus = request.getParameter("status");

            System.out.println("Received ID: " + complaintId + ", New Status: " + newStatus);

            boolean updated = ComplaintDao.updateStatus(complaintId, newStatus);

            // ✅ Redirect with status result
            if (updated) {
                response.sendRedirect("admin.jsp?status=success");
            } else {
                response.sendRedirect("admin.jsp?status=failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin.jsp?status=error");
        }
    }
}
