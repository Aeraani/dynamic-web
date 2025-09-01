package com.multi.dynamicweb;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        res.setContentType("text/html;charset=UTF-8");

        PrintWriter out = res.getWriter();

        out.println("<html><head><title>회원가입 결과</title>");
        out.println("<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css' rel='stylesheet'>");
        out.println("</head><body class='container mt-5'>");
        out.println("<h2 class='mb-4'>전송된 회원가입 정보</h2>");

        out.println("<ul class='list-group'>");

        // 1. getParameter: 단일 값
        String username = req.getParameter("username");
        out.println("<li class='list-group-item'><strong>아이디:</strong> " + username + "</li>");

        // 2. getParameterValues: 복수 값 (체크박스 등)
        String[] hobbies = req.getParameterValues("hobby");
        out.print("<li class='list-group-item'><strong>취미:</strong> ");
        if (hobbies != null) {
            out.print(String.join(", ", hobbies));
        } else {
            out.print("선택 없음");
        }
        out.println("</li>");

        // 3. getParameterNames: 모든 파라미터 나열
        out.println("<li class='list-group-item'><strong>모든 파라미터 목록:</strong><ul>");
        Enumeration<String> names = req.getParameterNames();
        while (names.hasMoreElements()) {
            String param = names.nextElement();
            out.println("<li>" + param + " = " + String.join(", ", req.getParameterValues(param)) + "</li>");
        }
        out.println("</ul></li>");

        // 4. getParameter 사용 예 (email)
        String email = req.getParameter("email");
        out.println("<li class='list-group-item'><strong>이메일:</strong> " + email + "</li>");

        out.println("</ul>");
        out.println("<a href='signup.html' class='btn btn-secondary mt-3'>돌아가기</a>");
        out.println("</body></html>");
    }
}


