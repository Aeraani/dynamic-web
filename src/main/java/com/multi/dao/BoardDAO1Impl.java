package com.multi.dao;

import com.multi.dto.Board;
import com.multi.util.DB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO1Impl implements BoardDAO1{

    @Override
    public long insert(Board board) {
        String sql = "insert into board (writer_id,title,content) values(?,?,?)";
        try (Connection conn = DB.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setLong(1, board.getWriter_id());  // writer_id (BIGINT)
            pstmt.setString(2, board.getTitle());   // title
            pstmt.setString(3, board.getContent()); // content

            pstmt.executeUpdate();

            try (ResultSet rs = pstmt.getGeneratedKeys()) {
                if (rs.next()) {
                    long id = rs.getLong(1);
                    board.setId(id);
                    return id;
                }else  {
                    throw new SQLException("No generated key returned");
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Insert failed", e);
        }
    }

    @Override
    public int update(long id, long writer_Id, String title, String content) {
        String sql = "update board set title=?,content=? where id=? and writer_id=?";
        try (Connection conn = DB.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1, title);
            pstmt.setString(2,content);
            pstmt.setLong(3,id);
            pstmt.setLong(4,writer_Id);

            return pstmt.executeUpdate();
        }catch (SQLException e) {
            throw new RuntimeException("Update failed", e);
        }
    }

    @Override
    public int delete(long id, long writer_Id) {
        String sql = "DELETE FROM board WHERE id=? AND writer_id=?";
        try (Connection conn = DB.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setLong(1, id);
            pstmt.setLong(2, writer_Id);

            return pstmt.executeUpdate();
            // 1 = 삭제 성공, 0 = 권한 없음 or 해당 글 없음
        } catch (SQLException e) {
            throw new RuntimeException("Delete failed", e);
        }
    }

    @Override
    public Board findbyid(long id) {
        String sql = "select * from board where id=?";
        try(Connection conn = DB.getConnection();
        PreparedStatement pstmt=conn.prepareStatement(sql)){

            pstmt.setLong(1,id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Board board = new Board();
                    board.setId(rs.getLong("id"));
                    board.setTitle(rs.getString("title"));
                    board.setContent(rs.getString("content"));
                    board.setWriter_id(rs.getLong("writer_id"));
                    board.setView_cnt(rs.getInt("view_cnt"));

                    Timestamp c = rs.getTimestamp("created_at");
                    Timestamp u = rs.getTimestamp("updated_at");
                    board.setCreated_at(c != null ? c.toLocalDateTime() : null);
                    board.setUpdated_at(u != null ? u.toLocalDateTime() : null);

                    return board;
                }
                return null; // 해당 id의 글이 없을 때
            }
        } catch (SQLException e) {
            throw new RuntimeException("findbyid failed", e);
        }
    }

    @Override
    public List<Board> findAll(int page, int size) { String sql = "SELECT * FROM board ORDER BY created_at DESC LIMIT ? OFFSET ?";
        List<Board> list = new ArrayList<>();

        int offset = (page - 1) * size;

        try (Connection conn = DB.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, size);   // 몇 개 가져올지
            pstmt.setInt(2, offset); // 어디서부터 시작할지

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Board board = new Board();
                    board.setId(rs.getLong("id"));
                    board.setTitle(rs.getString("title"));
                    board.setContent(rs.getString("content"));
                    board.setWriter_id(rs.getLong("writer_id"));
                    board.setView_cnt(rs.getInt("view_cnt"));

                    Timestamp c = rs.getTimestamp("created_at");
                    Timestamp u = rs.getTimestamp("updated_at");
                    board.setCreated_at(c != null ? c.toLocalDateTime() : null);
                    board.setUpdated_at(u != null ? u.toLocalDateTime() : null);

                    list.add(board);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("findAll failed", e);
        }
        return list;
    }

    @Override
    public int countAll() {
        String sql = "SELECT COUNT(*) FROM board";
        try (Connection conn = DB.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            if (rs.next()) {
                return rs.getInt(1);
            }
            return 0;
        } catch (SQLException e) {
            throw new RuntimeException("countAll failed", e);
        }
        }

    @Override
    public List<Board> search(String type, String keyword, int page, int size) {
        String sql;
        List<Board> list = new ArrayList<>();
        int offset = (page - 1) * size;

        try (Connection conn = DB.getConnection()) {
            PreparedStatement pstmt;

            switch (type) {
                case "title":
                    sql = "SELECT * FROM board WHERE title LIKE CONCAT('%', ?, '%') " +
                            "ORDER BY created_at DESC LIMIT ? OFFSET ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, keyword);
                    pstmt.setInt(2, size);   // LIMIT ? OFFSET ?  => size, offset 순서
                    pstmt.setInt(3, offset);
                    break;

                case "content":
                    sql = "SELECT * FROM board WHERE content LIKE CONCAT('%', ?, '%') " +
                            "ORDER BY created_at DESC LIMIT ? OFFSET ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, keyword);
                    pstmt.setInt(2, size);
                    pstmt.setInt(3, offset);
                    break;

                case "writer":
                    long writerId;
                    try {
                        writerId = Long.parseLong(keyword.trim());
                    } catch (NumberFormatException e) {
                        // 숫자가 아니면 결과 없음
                        return java.util.Collections.emptyList();
                    }
                    sql = "SELECT * FROM board WHERE writer_id = ? " +
                            "ORDER BY created_at DESC LIMIT ? OFFSET ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setLong(1, writerId);
                    pstmt.setInt(2, size);
                    pstmt.setInt(3, offset);
                    break;

                default:
                    throw new IllegalArgumentException("Invalid search type: " + type);
            }

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Board board = new Board();
                    board.setId(rs.getLong("id"));
                    board.setTitle(rs.getString("title"));
                    board.setContent(rs.getString("content"));
                    board.setWriter_id(rs.getLong("writer_id"));
                    board.setView_cnt(rs.getInt("view_cnt"));
                    Timestamp c = rs.getTimestamp("created_at");
                    Timestamp u = rs.getTimestamp("updated_at");
                    board.setCreated_at(c != null ? c.toLocalDateTime() : null);
                    board.setUpdated_at(u != null ? u.toLocalDateTime() : null);
                    list.add(board);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("search failed", e);
        }
        return list;
    }

    @Override
    public int countSearch(String type, String keyword) {
        String sql;

        try (Connection conn = DB.getConnection()) {
            PreparedStatement pstmt;

            switch (type) {
                case "title":
                    sql = "SELECT COUNT(*) FROM board WHERE title LIKE CONCAT('%', ?, '%')";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, keyword);
                    break;

                case "content":
                    sql = "SELECT COUNT(*) FROM board WHERE content LIKE CONCAT('%', ?, '%')";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, keyword);
                    break;

                case "writer":
                    long writerId;
                    try {
                        writerId = Long.parseLong(keyword.trim());
                    } catch (NumberFormatException e) {
                        return 0;
                    }
                    sql = "SELECT COUNT(*) FROM board WHERE writer_id = ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setLong(1, writerId);
                    break;

                default:
                    throw new IllegalArgumentException("Invalid search type: " + type);
            }

            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next() ? rs.getInt(1) : 0;
            }
        } catch (SQLException e) {
            throw new RuntimeException("countSearch failed", e);
        }
    }

    @Override
    public int increaseViewCnt(long id) {
        String sql = "UPDATE board SET view_cnt = view_cnt + 1 WHERE id=?";
        try (Connection conn = DB.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setLong(1, id);
            return pstmt.executeUpdate(); // 1이면 성공, 0이면 실패
        } catch (SQLException e) {
            throw new RuntimeException("increaseViewCnt failed", e);
        }
    }
}
