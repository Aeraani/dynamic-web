package com.multi.service;

import com.multi.dao.BoardDAO;
import com.multi.dao.BoardDAO1;
import com.multi.dao.BoardDAO1Impl;
import com.multi.dto.Board;

import java.util.List;

public class BoardServiceImpl implements BoardService {
    private BoardDAO1 boardDAO1 = new BoardDAO1Impl();
    @Override
    public long write(Board board) { //글 작성
        return boardDAO1.insert(board);
    }

    @Override
    public int edit(long id, long writerId, String title, String content) { //글 수정
        return boardDAO1.update(id, writerId, title, content);
    }

    @Override
    public int remove(long id, long writerId) { //글 삭제
        return boardDAO1.delete(id, writerId);
    }

    @Override
    public Board view(long id) { //글 상세보기
        boardDAO1.increaseViewCnt(id);
        return boardDAO1.findbyid(id);
    }

    @Override
    public List<Board> list(int page, int size) { //목록조회 +페이징
        return boardDAO1.findAll(page, size);
    }

    @Override
    public int totalCount() { //전체 글 개수 조회
        return boardDAO1.countAll();
    }

    @Override
    public List<Board> search(String type, String keyword, int page, int size) { //조건검색 + 페이징
        return boardDAO1.search(type, keyword, page, size);
    }

    @Override
    public int countSearch(String type, String keyword) { //조건 검색 글 수
        return boardDAO1.countSearch(type, keyword);
    }
}
