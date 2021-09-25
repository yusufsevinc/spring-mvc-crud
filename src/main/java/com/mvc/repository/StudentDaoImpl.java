package com.mvc.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.mvc.model.Student;

@Component
public class StudentDaoImpl implements StudentDao {

	@Autowired
	HibernateTemplate hibernateTemplate;

	@Transactional
	@Override
	public void saveStudent(Student std)
	{
		hibernateTemplate.save(std);
	}

	@Override
	public List<Student> getAllStudent()
	{
		return hibernateTemplate.loadAll(Student.class);
	}

	@Override
	public Student getById(Long id)
	{
		return hibernateTemplate.get(Student.class, id);
	}
	
	@Transactional
	@Override
	public void updateStudent(Student std)
	{
		hibernateTemplate.update(std);
	}
	
	@Transactional
	@Override
	public void deleteStudent(Long id)
	
	{
		hibernateTemplate.delete(hibernateTemplate.get(Student.class, id));
	}
	
	
	
	
	
	
}



