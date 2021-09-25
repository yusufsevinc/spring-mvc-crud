package com.mvc.service;

import java.util.List;

import com.mvc.repository.StudentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.mvc.model.Student;

@Component
@Service
public class StudentServiceImpl implements StudentService {

	
	@Autowired
    private StudentDao studentDao;

	@Override
	public void saveStudent(Student std)
	{
		studentDao.saveStudent(std);
	}

	@Override
	public List<Student> getAllStudent()
	{
		return studentDao.getAllStudent();
	}

	@Override
	public Student getById(Long id)
	{
		return studentDao.getById(id);
	}

	@Override
	public void updateStudent(Student std)
	{
		studentDao.updateStudent(std);
	}

	@Override
	public void deleteStudent(Long id)
	{
		studentDao.deleteStudent(id);
	}
	
}
