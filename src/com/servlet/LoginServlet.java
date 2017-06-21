package com.servlet;

import com.database.UserManage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = request.getParameter("yonghuming");
        String password = request.getParameter("mima");
        if (UserManage.login(username, password) != null){
            session.setAttribute("username", username);
            session.setAttribute("login", "ok");
            response.setContentType("text/html;charset=UTF-8");
            response.sendRedirect("/index");
        }
        else {
            response.setContentType("text/html;charset=UTF-8");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

}
