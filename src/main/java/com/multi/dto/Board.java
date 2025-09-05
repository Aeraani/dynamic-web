package com.multi.dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Board {
    private long id;
    private String title;
    private String content;
    private long writer_id;
    private int view_cnt;
    private LocalDateTime created_at;
    private LocalDateTime updated_at;
}
