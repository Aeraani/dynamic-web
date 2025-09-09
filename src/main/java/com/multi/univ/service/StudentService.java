package com.multi.univ.service;

import com.multi.univ.dto.Student;

import java.util.List;

public interface StudentService {
    // 목록 + 학번검색 + 페이지네이션
    List<Student> findAll(String studentNo, int page, int size);
    int count(String studentNo);

    // id로 상세검색
    Student findByStudentId(Long id);

    // 학생 등록
    void save(Student student);

    // 학생 수정
    void update(Student student);

    // 학생 삭제
    void delete(Long id);
}
