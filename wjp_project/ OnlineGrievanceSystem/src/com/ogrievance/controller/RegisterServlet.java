package com.ogrievance.controller;

import com.ogrievance.dao.UserDao;
import com.ogrievance.model.User;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");

        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setPhone(phone);
        user.setRole("user");

        UserDao dao = new UserDao();
        boolean status = dao.registerUser(user);

        if (status) {
            // Forward to success page
            request.getRequestDispatcher("register_success.jsp").forward(request, response);
        } else {
            response.sendRedirect("register.jsp?error=true");
        }
    }
}
