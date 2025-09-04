package com.multi.service;

import com.multi.dto.Member;

public interface MemberService {
    void addMember(Member member);
    void deleteMember(int id);
    void updateMember(Member member);
    Member findById(int id);
    Member findByUsername(String username);

    boolean isUsernameTaken(String username);     // 중복 아이디 체크
    boolean signup(Member member);                // 회원가입(중복검사 + 해시)
    Member login(String username, String password); // 로그인(성공 시 Member 반환, 실패 null)

}
