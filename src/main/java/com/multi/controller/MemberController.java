package com.multi.controller;

import com.multi.dto.Member;
import com.multi.service.MemberService;
import com.multi.service.MemberServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/member")
public class MemberController extends HttpServlet {
    private MemberService memberService = new MemberServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("MemberController doGet 실행");
        String action = req.getParameter("action");

        if (action == null) {
            action = "loginForm";
        }
        switch (action) {
            case "loginForm": showLoginForm(req,resp);
            break;
            case "signupForm": showSignupForm(req, resp);
            break;
            case "editForm": showEditForm(req, resp);
                break;
            default: showLoginForm(req, resp);
            break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) action = "login";

        switch (action) {

            case "signup": signup(req, resp);
            break; // 회원가입 처리
            case "login": login(req, resp);
            break; // 로그인 처리
            case "logout": logout(req, resp);
            break; // 로그아웃
            case "deleteMember": deleteMember(req,resp);
            break;
            case "update": updateAccount(req, resp);
            break;
            default: resp.sendError(400, "Unknown action");
            break;
        }
    }


    private void showLoginForm(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/view/memberView/login.jsp").forward(req, resp);
    }

    private void showSignupForm(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/view/memberView/signup.jsp").forward(req, resp);
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("loginMember") == null) {
            resp.sendRedirect(req.getContextPath() + "/member?action=loginForm");
            return;
        }

        Member loginMember = (Member) session.getAttribute("loginMember");
        req.setAttribute("loginMember", loginMember);

        req.getRequestDispatcher("/WEB-INF/view/memberView/edit.jsp").forward(req, resp);
    }


    private void signup(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String nickname = req.getParameter("nickname");

        Member m = new Member();
        m.setUsername(username);
        m.setPassword(password);
        m.setNickname(nickname);

        boolean ok = memberService.signup(m);
        if (ok) {
            resp.sendRedirect(req.getContextPath() + "/member?action=loginForm");
        } else {
            req.setAttribute("error", "이미 존재하는 아이디입니다.");
            req.getRequestDispatcher("/WEB-INF/view/memberView/signup.jsp").forward(req, resp);
        }
    }

    private void login(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        Member loginMember = memberService.login(username, password);
        if (loginMember != null) {
            req.getSession().setAttribute("loginMember", loginMember);
            // 로그인 후 이동할 화면(예: 게시판 목록)
            resp.sendRedirect(req.getContextPath() + "/member?action=editForm");
        } else {
            req.setAttribute("error", "아이디 또는 비밀번호가 올바르지 않습니다.");
            req.getRequestDispatcher("/WEB-INF/view/memberView/login.jsp").forward(req, resp);
        }
    }

    // 로그아웃
    private void logout(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        HttpSession session = req.getSession(false);
        if (session != null) session.invalidate();
        resp.sendRedirect(req.getContextPath() + "/member?action=loginForm");
    }

    private void deleteMember(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("loginMember") == null) {
            resp.sendRedirect(req.getContextPath() + "/member?action=loginForm");
            return;
        }

        Member loginMember = (Member) session.getAttribute("loginMember");
        int myId = loginMember.getId();      // 세션의 본인 id 사용
        memberService.deleteMember(myId);    // 본인만 탈퇴 가능
        session.invalidate();                // 세션 종료
        resp.sendRedirect(req.getContextPath() + "/member?action=loginForm");
    }

    private void updateAccount(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {
        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("loginMember") == null) {
            resp.sendRedirect(req.getContextPath() + "/member?action=loginForm");
            return;
        }

        Member loginMember = (Member) session.getAttribute("loginMember");
        int myId = loginMember.getId(); //세션의 본인 id 사용

        String newNickname = req.getParameter("nickname");
        String newPassword = req.getParameter("password"); // 빈 문자열이면 비번 변경 안 함

        // 현재 값으로 채우고, 바뀐 값만 덮어쓰기
        Member toUpdate = new Member();
        toUpdate.setId(myId);
        toUpdate.setUsername(loginMember.getUsername()); // username은 보통 변경 안 함
        toUpdate.setNickname(newNickname != null && !newNickname.isBlank()
                ? newNickname : loginMember.getNickname());
        toUpdate.setPassword(newPassword != null && !newPassword.isBlank()
                ? newPassword : loginMember.getPassword() // 비번 미입력 시 기존 유지
        );
        memberService.updateMember(toUpdate);

        Member refreshed = memberService.findById(myId);
        session.setAttribute("loginMember", refreshed);

        resp.sendRedirect(req.getContextPath() + "/member?action=loginForm");
    }


}
