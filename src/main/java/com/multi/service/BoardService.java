package com.multi.service;

import com.multi.dto.Board;

import java.util.List;

public interface BoardService {
    long write(Board board); // insert 위임
    int edit(long id, long writerId, String title, String content);
    int remove(long id, long writerId);
    Board view(long id); // 여기서 increaseViewCnt + findbyid 묶음
    List<Board> list(int page, int size);
    int totalCount();
    List<Board> search(String type, String keyword, int page, int size);
    int countSearch(String type, String keyword);
}
