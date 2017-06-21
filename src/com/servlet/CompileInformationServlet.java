package com.servlet;

import com.database.UserManage;
import sun.rmi.runtime.Log;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "CompileInServlet", urlPatterns = {"/compile_information"})
public class CompileInformationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        String nickname = new String( request.getParameter("nickname").getBytes("ISO-8859-1"),"UTF-8");
        String sex_data = (String) request.getParameter("sex");
        String pSign = new String( request.getParameter("p_sign").getBytes("ISO-8859-1"),"UTF-8");
        String birth = (String) request.getParameter("birthday");
        String phone = (String) request.getParameter("phone");
        String email = (String) request.getParameter("email");
        String address = new String( request.getParameter("address").getBytes("ISO-8859-1"),"UTF-8");
        String introduce = new String( request.getParameter("info").getBytes("ISO-8859-1"),"UTF-8");
        System.out.println(introduce);
        System.out.println(pSign);
        System.out.println(nickname);
        Boolean sex;
        if (sex_data.equals("male")){
            sex = true;
        }
        else {
            sex = false;
        }
        UserManage.modifyInformation(username,nickname, sex, pSign, birth, phone, email, address, introduce);
        response.sendRedirect("/information");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("compile_information.jsp").forward(request, response);
    }
}
