package com.multi.controller;

import com.multi.dao.BoardDAO;
import com.multi.dto.BoardDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name="boardController", urlPatterns={"/board"})
public class BoardController extends HttpServlet {
    private final BoardDAO boardDAO = new BoardDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        if (action == null || action.equals("list")) {
            List<BoardDTO> boards = boardDAO.getAllBoards();
            req.setAttribute("boards", boards);
            req.getRequestDispatcher("/jsp/board/list.jsp").forward(req, resp);

        } else if (action.equals("view")) {
            int id = Integer.parseInt(req.getParameter("id"));
            BoardDTO board = boardDAO.getBoardById(id);
            req.setAttribute("board", board);
            req.getRequestDispatcher("/jsp/board/detail.jsp").forward(req, resp);

        } else if (action.equals("write")) {
            req.getRequestDispatcher("/jsp/board/write.jsp").forward(req, resp);

        } else if (action.equals("delete")) {
            int id = Integer.parseInt(req.getParameter("id"));
            boardDAO.deleteBoard(id);
            resp.sendRedirect(req.getContextPath() + "/board?action=list");

        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String idStr = req.getParameter("id");
        String title = req.getParameter("title");
        String content = req.getParameter("content");

        if (idStr == null || idStr.isBlank()) {  // create
            BoardDTO b = new BoardDTO();
            b.setTitle(title);
            b.setContent(content);
            boardDAO.insertBoard(b);
        } else {                                  // update
            BoardDTO b = new BoardDTO();
            b.setId(Integer.parseInt(idStr));
            b.setTitle(title);
            b.setContent(content);
            boardDAO.updateBoard(b);
        }
        resp.sendRedirect(req.getContextPath() + "/board?action=list");
    }
}