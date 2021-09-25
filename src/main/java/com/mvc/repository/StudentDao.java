package com.mvc.repository;

import com.mvc.model.Student;

import javax.transaction.Transactional;
import java.util.List;

public interface StudentDao {
    @Transactional
    void saveStudent(Student std);

    List<Student> getAllStudent();

    Student getById(Long id);

    @Transactional
    void updateStudent(Student std);

    @Transactional
    void deleteStudent(Long id);
}
