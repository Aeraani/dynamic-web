package com.multi.homework.HW20250828;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    public LoginServlet() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/homework/20250828/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String pwd = request.getParameter("pwd");

        if(id.equals("user") && pwd.equals("1234")){
            HttpSession session = request.getSession();
            session.setAttribute("loginId",id);
            response.sendRedirect(request.getContextPath() + "/me");
        }else{
            request.setAttribute("message","아이디/비밀번호 오류");
            request.getRequestDispatcher("/homework/20250828/login.jsp").forward(request, response);
        }
    }
}
