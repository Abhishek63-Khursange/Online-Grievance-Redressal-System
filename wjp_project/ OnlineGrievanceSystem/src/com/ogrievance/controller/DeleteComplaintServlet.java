package com.ogrievance.controller;

import com.ogrievance.dao.ComplaintDao;
import com.ogrievance.dbutils.DBUtils;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/DeleteComplaintServlet")
public class DeleteComplaintServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection con = null;
        PreparedStatement psFetch = null;
        PreparedStatement psInsertDeleted = null;
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            con = DBUtils.getConnection();

            // Step 1: Fetch the complaint by ID
            psFetch = con.prepareStatement("SELECT * FROM complaints WHERE id=?");
            psFetch.setInt(1, id);
            ResultSet rs = psFetch.executeQuery();

            if (rs.next()) {
                // Step 2: Insert into deleted_complaints
                psInsertDeleted = con.prepareStatement(
                    "INSERT INTO deleted_complaints (complaint_id, category, description, status) VALUES (?, ?, ?, ?)"
                );
                psInsertDeleted.setInt(1, rs.getInt("id"));
                psInsertDeleted.setString(2, rs.getString("category"));
                psInsertDeleted.setString(3, rs.getString("description"));
                psInsertDeleted.setString(4, rs.getString("status"));
                psInsertDeleted.executeUpdate();

                // Step 3: Delete from original table
                boolean deleted = ComplaintDao.deleteComplaintById(id);
                if (deleted) {
                    response.sendRedirect("admin.jsp?msg=deleted");
                } else {
                    response.sendRedirect("admin.jsp?msg=deleteFailed");
                }
            } else {
                response.sendRedirect("admin.jsp?msg=notFound");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin.jsp?msg=error");
        } finally {
            DBUtils.close(con, psFetch);
            DBUtils.close(null, psInsertDeleted);
        }
    }
}
