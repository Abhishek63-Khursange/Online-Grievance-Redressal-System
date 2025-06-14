// File: com/ogrievance/controller/LoginServlet.java
package com.ogrievance.controller;

import com.ogrievance.dao.UserDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String selectedRole = request.getParameter("role"); // user/admin

        UserDao dao = new UserDao();
        String actualRole = dao.validateLogin(email, password);

        if (actualRole != null && actualRole.equalsIgnoreCase(selectedRole)) {
            // Set session attributes
            HttpSession session = request.getSession();
            session.setAttribute("userEmail", email);
            session.setAttribute("role", actualRole);

            // redirect based on role
            if ("admin".equalsIgnoreCase(actualRole)) {
            	response.sendRedirect("AdminServlet");

            } else if ("user".equalsIgnoreCase(actualRole)) {
                // ✅ Redirect to servlet that fetches user complaints
                response.sendRedirect("UserComplaintServlet");
            } else {
                // Fallback for unexpected role
                response.sendRedirect("login.jsp?error=unknownRole");
            }

        } else {
            // ❌ Invalid login or role mismatch
            request.setAttribute("errorMsg", "Invalid credentials or role.");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }
    }
}
