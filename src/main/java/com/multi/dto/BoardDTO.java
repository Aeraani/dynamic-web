package com.multi.dto;

import lombok.Data;

import java.time.LocalDateTime;
@Data  //getter,setter,toString
public class BoardDTO {
    private int id;
    private String title;
    private String content;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;


}