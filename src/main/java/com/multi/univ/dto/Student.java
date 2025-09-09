package com.multi.univ.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data  //getter,setter,toString
@NoArgsConstructor
@AllArgsConstructor

public class Student {
    private long id;
    private String studentNo;
    private String name;
    private String email;
    private String dept;
    private String createdAt;
}
