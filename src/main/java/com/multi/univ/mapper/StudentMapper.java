package com.multi.univ.mapper;

import com.multi.univ.dto.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentMapper {
    //목록/검색(학번)페이지네이션
    List<Student> findAllStudent(@Param("studentNo") String studentNo, @Param("offset") int offset, @Param("size") int size);
    int countStudent(@Param("studentNo") String studentNo);
    Student findByStudentId(@Param("id") Long id);
    int insertStudent(Student student);
    int updateStudent(Student student);
    int deleteStudent(@Param("id") long id);
}
