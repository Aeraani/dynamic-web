package com.multi.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
/*
mvc로 로그인을 하겠습니다
1. index에서 login을 click했을때 ....  mvclogin.jsp화면에 나오게한다...
2. 로그인화면에서 로그인 버튼을 눌렀을때... <form action=login.do?cmd=login>
   LoginAction에서 로그인을 db로 체크하고
*/

@WebServlet("*.do")//MVC에서 대장 Controller
 /*
 1. 명령줄의 인수를 받는다 (cmd를 받음)
 2. 명령에 대한 Action을 생성한다
 3. 해당 Action으 호출한다(비즈니스 로직을 수행한다)
 4. Action을 수행하고 ActionForward를 return한다
 5. redirect or forward 여부에 따라서 페이지 이동한다
 */
public class DispatcherServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String cmd = request.getParameter("cmd");
        Action action=ActionFactory.getInstance().getAction(cmd);//UpCasting
        ActionForward actionForWard= action.execute(request, response);
        if(actionForWard!=null){
            if(actionForWard.isRedirect()){//redirect (2번호출)
                response.sendRedirect(actionForWard.getPath());

            }else{//forward는 리소스를 얻기위해 내부적으로 한번 호출
                RequestDispatcher dispatcher=request.getRequestDispatcher(actionForWard.getPath());
                dispatcher.forward(request, response);
            }
        }


    }
}