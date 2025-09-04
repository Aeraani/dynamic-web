package com.multi.dao;

import com.multi.dto.Member;
import com.multi.util.DB;

import java.sql.*;


public class MemberDAOImpl implements MemberDAO {
    @Override
    public void addMember(Member member) {
        String sql = "INSERT INTO `member`(username, `password`, nickname) VALUES (?, ?, ?)";
        System.out.println("회원가입 시도: " + member.getUsername() + ", "
                + member.getPassword() + ", " + member.getNickname());
        try (Connection conn = DB.getConnection();

             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setString(1, member.getUsername());
            pstmt.setString(2, member.getPassword());
            pstmt.setString(3, member.getNickname());

            pstmt.executeUpdate();

            // 생성된 PK(id) 받아오기 (선택)
            try (ResultSet rs = pstmt.getGeneratedKeys()) {
                if (rs.next()) {
                    member.setId(rs.getInt(1)); // DTO에 다시 id 저장
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // 과제에서는 printStackTrace, 실무는 로깅 + 예외처리
            throw new RuntimeException("회원가입 DB 오류", e);
        }
    }

    @Override
    public void deleteMember(int id) {
        String sql = "DELETE FROM `member` WHERE id = ?";
        try (Connection conn = DB.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id); // 매개변수 id 값 바인딩
            int rows = pstmt.executeUpdate();

            if (rows == 0) {
                System.out.println("삭제할 회원이 없습니다. id=" + id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    @Override
    public void updateMember(Member member) {
        String sql = "UPDATE `member` SET username = ?, `password` = ?, nickname = ? WHERE id = ?";
        try (Connection conn = DB.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, member.getUsername());
            pstmt.setString(2, member.getPassword());
            pstmt.setString(3, member.getNickname());
            pstmt.setInt(4,member.getId());

            int  rows = pstmt.executeUpdate();
            if (rows == 0) {
                System.out.println("수정된 내용이 없습니다. id="+member.getId());
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public Member findById(int id) {
        String sql = "SELECT * FROM `member` WHERE id = ?";
        try(Connection conn = DB.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Member member = new Member();
                    member.setId(rs.getInt("id"));
                    member.setUsername(rs.getString("username"));
                    member.setPassword(rs.getString("password"));
                    member.setNickname(rs.getString("nickname"));
                    member.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                    return member;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  null;
    }


    @Override
    public Member findByUsername(String username) {
        String sql = "SELECT * FROM `member` WHERE username = ?";
        try(Connection conn = DB.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1, username);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Member member = new Member();
                    member.setId(rs.getInt("id"));
                    member.setUsername(rs.getString("username"));
                    member.setPassword(rs.getString("password"));
                    member.setNickname(rs.getString("nickname"));
                    member.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                    return member;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  null;
    }
}
