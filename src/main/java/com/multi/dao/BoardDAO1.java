package com.multi.dao;

import com.multi.dto.Board;

import java.util.List;

public interface BoardDAO1 {
    long insert(Board board);
    int update(long id, long writer_Id, String title, String content);
    int delete(long id, long writer_Id);

    Board findbyid(long id);

    List<Board> findAll(int page, int size);  // 최신순
    int countAll();

    List<Board> search(String type, String keyword, int page, int size);
    int countSearch(String type, String keyword);

    int increaseViewCnt(long id);
}
