package com.servlet;

import com.database.UserManage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "GetInformationServlet", urlPatterns = {"/get_information"})
public class GetInformationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String username = (String)request.getSession().getAttribute("username");
        String data = UserManage.getInformation(username);
        PrintWriter writer = response.getWriter();
        writer.print(data);
        writer.flush();
        writer.close();
    }
}
