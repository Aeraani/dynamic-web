package com.multi.dao;


import com.multi.dto.Member;

public interface MemberDAO {
    void addMember(Member member);
    void deleteMember(int id);
    void updateMember(Member member);
    Member findById(int id);
    Member findByUsername(String username);

}
