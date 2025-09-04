package com.multi.homework.HW20250828;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/rememberlogin")
public class RememberLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String savedId = null;
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("rememberId")) {
                    savedId = cookie.getValue();
                    break;
                }
            }
        }
        req.setAttribute("savedId", savedId);
        req.getRequestDispatcher("/homework/20250828/rememberlogin.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String id = req.getParameter("id");
        boolean on = req.getParameter("rememberId") != null;

        Cookie c = new Cookie("rememberId", on ? id : "");
        c.setMaxAge(on ? 60 : 0);
        c.setPath("/");
        resp.addCookie(c);

        resp.sendRedirect(req.getContextPath() + "/rememberlogin");
    }
}

