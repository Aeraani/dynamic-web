package com.multi.homework.HW20250828;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet("/me")
public class MeServlet extends HttpServlet {
    public MeServlet() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loginId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String loginId = (String) session.getAttribute("loginId");
        request.setAttribute("message", loginId + "님 환영합니다!");
        request.getRequestDispatcher("/homework/20250828/me.jsp").forward(request, response);
    }
}