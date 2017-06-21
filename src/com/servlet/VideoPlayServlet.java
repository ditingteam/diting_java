package com.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "VideoPlayServlet", urlPatterns = {"/video_play"})
public class VideoPlayServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username =(String) request.getSession().getAttribute("username");
        if (username != null){
            String video_link = request.getParameter("play_address");
            //todo add history
        }
        request.getRequestDispatcher("play.jsp").forward(request, response);
    }
}
