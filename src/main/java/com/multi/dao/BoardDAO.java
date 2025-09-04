package com.multi.dao;

import com.multi.config.MyBatisUtil;
import com.multi.dto.BoardDTO;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
//dao는 실제 db에 가서 데이터를 가져오는 객체
public class BoardDAO {
    public List<BoardDTO> getAllBoards() {
        //MyBatisUtil.getSqlSessionFactory().openSession()는 MyBatis객체를 의미한다
        try (SqlSession s = MyBatisUtil.getSqlSessionFactory().openSession()) {
            //s가 mybatis객체이다
            //객체는 데이터다. 기능을 갖고있는 데이터를 객체라고 한다
            //태란.sleep(); 하면 태란 데이터 자라
            //그러니까 여기서 s는 sqlSession(dbconfig,sqlQuery 갖고있음)이다
            return s.selectList("com.multi.dao.BoardDAO.getAllBoards");
        }
    }
    public BoardDTO getBoardById(int id) {
        try (SqlSession s = MyBatisUtil.getSqlSessionFactory().openSession()) {
            return s.selectOne("com.multi.dao.BoardDAO.getBoardById", id);
        }
    }
    public int insertBoard(BoardDTO b) {
        try (SqlSession s = MyBatisUtil.getSqlSessionFactory().openSession(true)) {
            return s.insert("com.multi.dao.BoardDAO.insertBoard", b);
        }
    }
    public int updateBoard(BoardDTO b) {
        try (SqlSession s = MyBatisUtil.getSqlSessionFactory().openSession(true)) {
            return s.update("com.multi.dao.BoardDAO.updateBoard", b);
        }
    }
    public int deleteBoard(int id) {
        try (SqlSession s = MyBatisUtil.getSqlSessionFactory().openSession(true)) {
            return s.delete("com.multi.dao.BoardDAO.deleteBoard", id);
        }
    }
}