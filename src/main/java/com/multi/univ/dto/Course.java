package com.multi.univ.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data  //getter,setter,toString
@NoArgsConstructor
@AllArgsConstructor

public class Course {
    private long id;
    private String code;
    private String title;
    private String professor;
    private int credit;
    private String created_at;
}
