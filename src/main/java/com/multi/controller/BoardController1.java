package com.multi.controller;

import com.multi.dto.Board;
import com.multi.dto.Member;
import com.multi.service.BoardService;
import com.multi.service.BoardServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/board1")
public class BoardController1 extends HttpServlet {
    private BoardService boardService = new BoardServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action == null) {
            action = "list";
        }
        switch (action) {
            case "view": detailView(req,resp);
            break;
            case "search" : searchList(req,resp);
            break;
            case "list":listView(req,resp);
            break;
            case "writeForm": showWriteForm(req, resp);
            break;
            case "editForm":  showEditForm(req, resp);
            break;
            default:listView(req,resp);
            break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) action = "write";
        switch (action) {
            case "write": write(req,resp);
            break; //글쓰기
            case "edit": edit(req,resp);
            break;
            case "delete": delete(req,resp);
            break;
            default: resp.sendError(400, "Unknown action");
            break;
        }
    }

    private void listView(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int page = 1; // 기본값
        String pageParam = req.getParameter("page");
        if (pageParam != null) {
            try {
                page = Integer.parseInt(pageParam);
            } catch (NumberFormatException e) {
                page = 1; // 숫자 변환 실패 시 기본값
            }
        }
        if (page < 1) page = 1;

        int size = 10; // 한 페이지 고정
        List<Board> boards = boardService.list(page, size);
        int total = boardService.totalCount();
        int totalPages = (int) Math.ceil((double) total / size);

        req.setAttribute("boards", boards);
        req.setAttribute("page", page);
        req.setAttribute("size", size);
        req.setAttribute("totalPages", totalPages);
        req.getRequestDispatcher("/WEB-INF/view/boardView/list.jsp").forward(req, resp);
    }

    private void detailView(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idParam = req.getParameter("id");
        if (idParam == null) {
            resp.sendError(400, "Missing id");
            return;
        }

        long id;
        try {
            id = Long.parseLong(idParam);
        } catch (NumberFormatException e) {
            resp.sendError(400, "Invalid id");
            return;
        }

        Board board = boardService.view(id); // 조회수 증가 + 상세 조회
        if (board == null) {
            resp.sendError(404, "Board not found");
            return;
        }

        req.setAttribute("board", board);
        req.getRequestDispatcher("/WEB-INF/view/boardView/view.jsp").forward(req, resp);
    }

    private void showWriteForm(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // 로그인 필요하면 여기서 체크해도 됨(선택)
        req.getRequestDispatcher("/WEB-INF/view/boardView/write.jsp").forward(req, resp);
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String idParam = req.getParameter("id");
        if (idParam == null) { resp.sendError(400, "Missing id"); return; }
        long id;
        try { id = Long.parseLong(idParam); } catch (NumberFormatException e) {
            resp.sendError(400, "Invalid id"); return;
        }

        // 로그인 확인
        HttpSession session = req.getSession(false);
        Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
        if (loginMember == null) {
            resp.sendRedirect(req.getContextPath() + "/member?action=loginForm");
            return;
        } Board board2 = boardService.view(id);
        if (board2 == null) { resp.sendError(404, "Board not found"); return; }

        // 본인 글인지 확인
        if (board2.getWriter_id() != loginMember.getId()) {
            resp.sendError(403, "Forbidden");
            return;
        }

        req.setAttribute("board", board2);
        req.getRequestDispatcher("/WEB-INF/view/boardView/edit.jsp").forward(req, resp);
    }



    private void searchList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type"); // title|content|writer
        String keyword = req.getParameter("keyword");
        if (keyword == null) keyword = "";
        keyword = keyword.trim();

        // page 처리 (헬퍼 없이)
        int page = 1;
        String pageParam = req.getParameter("page");
        if (pageParam != null) {
            try {
                page = Integer.parseInt(pageParam);
            } catch (NumberFormatException e) {
                page = 1;
            }
        }
        if (page < 1) page = 1;

        int size = 10; // 고정

        if (!"title".equals(type) && !"content".equals(type) && !"writer".equals(type)) {
            resp.sendError(400, "Invalid search type");
            return;
        }

        List<Board> boards = boardService.search(type, keyword, page, size);
        int total = boardService.countSearch(type, keyword);

        req.setAttribute("boards", boards);
        req.setAttribute("type", type);
        req.setAttribute("keyword", keyword);
        req.setAttribute("page", page);
        req.setAttribute("size", size);
        req.setAttribute("total", total);
        req.getRequestDispatcher("/WEB-INF/view/boardView/search.jsp").forward(req, resp);

    }

    private void write(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        if (title == null || title.isBlank() || content == null || content.isBlank()) {
            req.setAttribute("error", "제목/내용은 필수입니다.");
            req.getRequestDispatcher("/WEB-INF/view/boardView/write.jsp").forward(req, resp);
            return;
        }
        HttpSession session = req.getSession(false);
        Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
        if (loginMember == null) {
            resp.sendRedirect(req.getContextPath() + "/member?action=loginForm");
            return;
        }
        long writerId = loginMember.getId(); // int면 자동으로 long으로 승격됨

        // 3) DTO 채우기
        Board b = new Board();
        b.setTitle(title.trim());
        b.setContent(content.trim());
        b.setWriter_id(writerId);

        // 4) 서비스 호출 → DAO.insert → DB INSERT 수행
        long newId = boardService.write(b);

        // 5) PRG 패턴: 새 글 상세로 리다이렉트
        resp.sendRedirect(req.getContextPath() + "/board1?action=view&id=" + newId);
    }

    private void edit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idParam = req.getParameter("id");
        String title = req.getParameter("title");
        String content = req.getParameter("content");

        if (idParam == null) { resp.sendError(400, "Missing id"); return; }
        if (title == null || title.isBlank() || content == null || content.isBlank()) {
            resp.sendError(400, "Title/Content required");
            return;
        }

        long id;
        try {
            id = Long.parseLong(idParam);
        } catch (NumberFormatException e) {
            resp.sendError(400, "Invalid id");
            return;
        }

        // 2) 로그인 확인
        HttpSession session = req.getSession(false);
        Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
        if (loginMember == null) {
            resp.sendRedirect(req.getContextPath() + "/member?action=loginForm");
            return;
        }
        long writerId = loginMember.getId();

        // 3) 수정 실행 (WHERE id=? AND writer_id=? 로 본인만 수정)
        int rows = boardService.edit(id, writerId, title.trim(), content.trim());
        if (rows == 0) { // 권한 없거나 글 없음
            resp.sendError(403, "Forbidden or not found");
            return;
        }

        // 4) 성공 → 상세로 이동 (PRG)
        resp.sendRedirect(req.getContextPath() + "/board1?action=view&id=" + id);
    }
    private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idParam = req.getParameter("id");
        if (idParam == null) { resp.sendError(400, "Missing id"); return; }

        long id;
        try { id = Long.parseLong(idParam); } catch (NumberFormatException e) {
            resp.sendError(400, "Invalid id");
            return;
        }

        HttpSession session = req.getSession(false);
        Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
        if (loginMember == null) {
            resp.sendRedirect(req.getContextPath() + "/member?action=loginForm");
            return;
        }
        long writerId = loginMember.getId();

        int rows = boardService.remove(id, writerId); // WHERE id=? AND writer_id=?
        if (rows == 0) { // 권한 없거나 글 없음
            resp.sendError(403, "Forbidden or not found");
            return;
        }

        resp.sendRedirect(req.getContextPath() + "/board1?action=list");
    }
}
