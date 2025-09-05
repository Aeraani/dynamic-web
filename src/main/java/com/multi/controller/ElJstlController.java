package com.multi.controller;


import com.multi.dao.BoardDAO;
import com.multi.dto.BoardDTO;
import com.multi.vo.UserVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/jstlLesson")
public class ElJstlController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        BoardDAO boardDao=new BoardDAO();
        UserVO userVO=new UserVO();
        if(action!=null&&action.equals("redirect")){
            req.setAttribute("list", boardDao.getAllBoards());
            resp.sendRedirect(req.getContextPath()+"/eljstl/redirectJstl.jsp");

        }else if(action!=null&&action.equals("forward")){
            req.setAttribute("list", boardDao.getAllBoards());
            req.getRequestDispatcher("/eljstl/forwardJstl.jsp").forward(req,resp);

//        }else if(action!=null&&action.equals("info")){
//            req.setAttribute("info", new BoardDAO(1,"hi", "hello",null,null));
//            req.getRequestDispatcher("/eljstl/info.jsp").forward(req,resp);

        }else if(action!=null&&action.equals("user")){
            req.setAttribute("user", new UserVO(null,20));
            req.getRequestDispatcher("/eljstl/elJstl2.jsp").forward(req,resp);

        }else if(action!=null&&action.equals("calc")){
            resp.sendRedirect(req.getContextPath()+"/eljstl/elJstl3.jsp");

        }else if(action!=null&&action.equals("function")){
            req.getRequestDispatcher("/eljstl/elJstl4.jsp").forward(req,resp);
        }
    }
}
