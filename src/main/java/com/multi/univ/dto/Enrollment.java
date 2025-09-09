package com.multi.univ.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data  //getter,setter,toString
@NoArgsConstructor
@AllArgsConstructor

public class Enrollment {
    private long id;
    private long student_id;
    private long course_id;
    private String enrolled_at;

}
