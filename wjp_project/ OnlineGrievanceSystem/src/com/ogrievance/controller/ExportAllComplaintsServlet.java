package com.ogrievance.controller;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import com.ogrievance.dao.ComplaintDao;
import com.ogrievance.model.Complaint;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.stream.Stream;

public class ExportAllComplaintsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Complaint> complaints = null;
		try {
			complaints = ComplaintDao.getAllComplaints();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=All_Complaints_Report.pdf");

        try {
            OutputStream out = response.getOutputStream();
            Document document = new Document(PageSize.A4.rotate()); // Landscape orientation
            PdfWriter.getInstance(document, out);
            document.open();

            Font headerFont = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD);
            Font tableHeader = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD);
            Font tableBody = new Font(Font.FontFamily.HELVETICA, 12);

            document.add(new Paragraph("All Grievance Complaints Report", headerFont));
            document.add(new Paragraph("Total Complaints: " + complaints.size()));
            document.add(new Paragraph("Generated On: " + new java.util.Date().toString()));
            document.add(new Paragraph(" ")); // Blank line

            PdfPTable table = new PdfPTable(5); // ID, Email, Category, Description, Status
            table.setWidthPercentage(100);
            table.setWidths(new int[]{1, 3, 2, 5, 2});

            // Table headers
            Stream.of("ID", "Email", "Category", "Description", "Status").forEach(column -> {
                PdfPCell cell = new PdfPCell(new Phrase(column, tableHeader));
                cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
                table.addCell(cell);
            });

            // Table rows
            for (Complaint c : complaints) {
                table.addCell(new Phrase(String.valueOf(c.getId()), tableBody));
                table.addCell(new Phrase(c.getEmail(), tableBody));
                table.addCell(new Phrase(c.getCategory(), tableBody));
                table.addCell(new Phrase(c.getDescription(), tableBody));
                table.addCell(new Phrase(c.getStatus(), tableBody));
            }

            document.add(table);
            document.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
