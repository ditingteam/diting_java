package com.servlet;

import com.database.UserManage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ChangePassowrdServlet", urlPatterns = {"/change_password"})
public class ChangePassowrdServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username =(String) request.getSession().getAttribute("username");
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("new_password");
        String newPassword1 = request.getParameter("new_password1");
        if (oldPassword == null || newPassword == null ||
        newPassword1 == null || !newPassword.equals(newPassword1)){
            response.sendRedirect("/change_password");
        }
        else if (!UserManage.changePassword(username, oldPassword, newPassword)){
            response.sendRedirect("/change_password");
        }
        else {
            response.sendRedirect("/information");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("change_passwd.jsp").forward(request, response);
    }
}
