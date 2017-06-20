package com.servlet;

import com.database.HomePageJason;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "GetHomePageServlet", urlPatterns = {"/main_page_data"})
public class GetHomePageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String data = HomePageJason.getData();
        response.setContentType("text/html;charset=utf-8");
        System.out.print(data);
        PrintWriter writer = response.getWriter();
        writer.print(data);
        writer.flush();
        writer.close();
    }
}
