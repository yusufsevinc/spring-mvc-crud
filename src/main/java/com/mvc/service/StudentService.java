package com.mvc.service;

import com.mvc.model.Student;

import java.util.List;

public interface StudentService {
    void saveStudent(Student std);

    List<Student> getAllStudent();

    Student getById(Long id);

    void updateStudent(Student std);

    void deleteStudent(Long id);
}
