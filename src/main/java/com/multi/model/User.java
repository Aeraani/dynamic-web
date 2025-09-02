
package com.multi.model;

import lombok.*;

//model,domain,vo,dto
@Data  //안에 getter, setter, toString 기능이 들어았음
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private int id;
    private String name;
    private int age;
}
