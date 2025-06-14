package com.ogrievance.controller;

import com.ogrievance.dao.UserDao;
import com.ogrievance.model.User;  // Assuming you have a User model class

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int userId = Integer.parseInt(request.getParameter("id"));

            // Fetch user data before deletion
            User user = UserDao.getUserById(userId); // You should have this method in your UserDao

            if (user != null) {
                // Insert into deleted_users table
                boolean archived = UserDao.archiveDeletedUser(user);

                if (archived) {
                    // Now delete from users table
                    boolean deleted = UserDao.deleteUser(userId);

                    if (deleted) {
                        response.sendRedirect("userList.jsp?msg=deleted");
                    } else {
                        response.sendRedirect("userList.jsp?msg=deleteFail");
                    }
                } else {
                    response.sendRedirect("userList.jsp?msg=archiveFail");
                }

            } else {
                response.sendRedirect("userList.jsp?msg=userNotFound");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("userList.jsp?msg=error");
        }
    }
}
