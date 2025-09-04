package com.multi.service;

import com.multi.dao.MemberDAO;
import com.multi.dao.MemberDAOImpl;
import com.multi.dto.Member;

public class MemberServiceImpl implements MemberService {
    private MemberDAO memberDAO = new MemberDAOImpl();

    @Override
    public void addMember(Member member) {Member existing = memberDAO.findByUsername(member.getUsername());
        if (existing != null) {
            throw new IllegalArgumentException("이미 존재하는 아이디입니다.");
        }
        memberDAO.addMember(member);
    }

    @Override
    public void deleteMember(int id) {
        memberDAO.deleteMember(id);
    }

    @Override
    public void updateMember(Member member) {
        memberDAO.updateMember(member);
    }

    @Override
    public Member findById(int id) {
        return memberDAO.findById(id);
    }

    @Override
    public Member findByUsername(String username) {
        return memberDAO.findByUsername(username);
    }

    @Override
    public boolean isUsernameTaken(String username) {
        return memberDAO.findByUsername(username) != null;
    }

    @Override
    public boolean signup(Member member) {
        if (isUsernameTaken(member.getUsername())) return false;
        memberDAO.addMember(member);
        return true;
    }

    @Override
    public Member login(String username, String password) {
        Member found = memberDAO.findByUsername(username);
        if (found == null) return null;
        if (found.getPassword().equals(password)) {
            return found; // 로그인 성공 → Member 객체 반환
        }
        return null; // 비밀번호 불일치
    }
}
