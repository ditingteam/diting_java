package com.servlet;

import com.database.UserManage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "RegisterServlet", urlPatterns ={"/register"} )
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = request.getParameter("yonghuming");
        String password = request.getParameter("mima");
        String password1 = request.getParameter("mima1");
        if (username == null || password == null || password1 == null){
            System.out.println("password not invalid");
            response.setContentType("text/html;charset=UTF-8");

            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
        else if (!password.equals(password1)){
            System.out.println(password);
            System.out.println(password1);

            System.out.println("password not invalid 1");

            response.setContentType("text/html;charset=UTF-8");

            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
        else if(!UserManage.register(username, password)){
            System.out.println("password not register failed");

            response.setContentType("text/html;charset=UTF-8");

            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
        else {
            System.out.println("666");

            response.setContentType("text/html;charset=UTF-8");
            response.sendRedirect("/login");
        }

    }
}
