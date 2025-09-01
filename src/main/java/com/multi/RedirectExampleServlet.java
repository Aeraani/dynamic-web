package com.multi;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/redirectExample")
public class RedirectExampleServlet extends HttpServlet {
    public RedirectExampleServlet() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Redirect (새 요청으로 result.jsp로 이동)
        response.sendRedirect("result.jsp");
    }
}
