package com.ogrievance.controller;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import com.ogrievance.dao.ComplaintDao;
import com.ogrievance.model.Complaint;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.OutputStream;

public class DownloadPDFServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int complaintId = Integer.parseInt(request.getParameter("id"));
        Complaint complaint = ComplaintDao.getComplaintById(complaintId);

        if (complaint == null) {
            response.sendRedirect("dashboard.jsp");
            return;
        }

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=complaint_" + complaintId + ".pdf");

        try {
            OutputStream out = response.getOutputStream();
            Document document = new Document();
            PdfWriter.getInstance(document, out);

            document.open();
            Font boldFont = new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD);

            document.add(new Paragraph("Grievance Complaint Details", boldFont));
            document.add(new Paragraph(" "));
            document.add(new Paragraph("Complaint ID: " + complaint.getId()));
            document.add(new Paragraph("Email: " + complaint.getEmail()));
            document.add(new Paragraph("Category: " + complaint.getCategory()));
            document.add(new Paragraph("Description: " + complaint.getDescription()));
            document.add(new Paragraph("Status: " + complaint.getStatus()));
            document.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
