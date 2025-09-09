package com.multi.univ.service;

import com.multi.univ.dto.Student;
import com.multi.univ.mapper.StudentMapper;

import java.util.List;

public class StudentServiceImpl implements StudentService {
    private final StudentMapper studentMapper;

    public StudentServiceImpl(StudentMapper studentMapper) {
        this.studentMapper = studentMapper;
    }

    @Override
    public List<Student> findAll(String studentNo, int page, int size) {
        if (page < 1) page = 1;
        if (size < 1) size = 10;
        int offset = (page - 1) * size;

        String studentNoFilter;
        if (studentNo == null || studentNo.isBlank()) {
            studentNoFilter = null; // 전체 학생 목록
        }else{
            studentNoFilter = studentNo.trim(); // 학번 조건 목록
        }
        return studentMapper.findAllStudent(studentNoFilter, offset, size);
    }

    @Override
    public int count(String studentNo) {
        String studentNoFilter;
        if (studentNo == null || studentNo.isBlank()) {
            studentNoFilter = null; //전체 학생 카운트
        } else {
            studentNoFilter = studentNo.trim(); // 학번 조건 카운트
        }
        return studentMapper.countStudent(studentNoFilter);
    }

    @Override
    public Student findByStudentId(Long id) {
        if(id == null) {
            throw new IllegalArgumentException("id는 필수입니다.");
        }
        return studentMapper.findByStudentId(id);
    }

    @Override
    public void save(Student student) {
        if (student == null) throw new IllegalArgumentException("student가 필요합니다.");

        String studentNo = student.getStudentNo();
        String name = student.getName();
        String email = student.getEmail();
        String dept = student.getDept();

        if (studentNo == null || studentNo.isBlank())
            throw new IllegalArgumentException("학번은 필수입니다.");
        if (name == null || name.isBlank())
            throw new IllegalArgumentException("이름은 필수입니다.");
        if (dept == null || dept.isBlank())
            throw new IllegalArgumentException("학과는 필수입니다.");
        if (email == null || email.isBlank())
            throw new IllegalArgumentException("이메일은 필수입니다.");
        if (!email.contains("@") || !email.contains("."))
            throw new IllegalArgumentException("이메일 형식이 올바르지 않습니다.");

        student.setStudentNo(studentNo.trim());
        student.setEmail(email.trim());
        student.setName(name.trim());
        student.setDept(dept.trim());

        try {
            int rows = studentMapper.insertStudent(student);
            if (rows != 1) throw new IllegalStateException("학생 등록 실패");
        } catch (Exception e) {
            // 학번 UNIQUE 제약 위반
            if (e.getMessage() != null && e.getMessage().toLowerCase().contains("duplicate")) {
                throw new IllegalArgumentException("이미 존재하는 학번입니다: " + student.getStudentNo());
            }
            throw e;
        }
    }

    @Override
    public void update(Student student) {
        if (student == null || student.getId() <= 0) {
            throw new IllegalArgumentException("수정 할 학생 id를 입력해주세요.");
        }

        String studentNo = student.getStudentNo();
        String name = student.getName();
        String email = student.getEmail();
        String dept = student.getDept();

        // 수정 내용 입력 시 안쪽 로직 수행 -> 공백이면 예외발생 / 정상입력이면 공백 제거 후 student 객체에 담음
        if (studentNo != null) {
            if (studentNo.isBlank()) {
                throw new IllegalArgumentException("학번은 공백만으로 수정할 수 없습니다.");
            }
            student.setStudentNo(studentNo.trim());
        }

        if (dept != null) {
            if (dept.isBlank()) {
                throw new IllegalArgumentException("학과는 공백만으로 수정할 수 없습니다.");
            }
            student.setDept(dept.trim());
        }

        if (name != null) {
            if (name.isBlank()) {
                throw new IllegalArgumentException("이름은 공백만으로 수정할 수 없습니다.");
            }
            student.setName(name.trim());
        }

        if (email != null) {
            if (email.isBlank()) {
                throw new IllegalArgumentException("이메일은 공백만으로 수정할 수 없습니다.");
            }
            if (!email.contains("@") || !email.contains(".")) {
                throw new IllegalArgumentException("이메일 형식이 올바르지 않습니다.");
            }
            student.setEmail(email.trim());
        }

        try {
            int rows = studentMapper.updateStudent(student);
            if (rows != 1) throw new IllegalStateException("학생 수정 실패");
        } catch (Exception e) {
            // 학번 UNIQUE 제약 위반
            if (e.getMessage() != null && e.getMessage().toLowerCase().contains("duplicate")) {
                throw new IllegalArgumentException("이미 존재하는 학번입니다: " + student.getStudentNo());
            }
            throw e;
        }
    }

    @Override
    public void delete(Long id) {
        if (id == null || id <= 0) {
            throw new IllegalArgumentException("삭제 할 학생 id를 입력해주세요.");
        }
        int rows = studentMapper.deleteStudent(id);
        if (rows != 1) {
            throw new IllegalStateException("학생 삭제 실패");
        }

    }
}