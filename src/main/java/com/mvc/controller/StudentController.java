package com.mvc.controller;

import java.util.List;

import com.mvc.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.model.Student;

@Controller
@RequestMapping
public class StudentController {

	@Autowired
	private StudentService studentService;

	@GetMapping("/student")
	public String student()
	{
		return "Student";
	}

	@PostMapping("/insertStudent")
	@ResponseBody
	public String saveStudent(@ModelAttribute("insertStudent") Student student)
	{
		studentService.saveStudent(student);
		return "saved";
	}

	@GetMapping("/getAllStudent")
	public @ResponseBody List<Student> getAllStudent()
	{
		List<Student> students = studentService.getAllStudent();
		
		return students;
	}

	@GetMapping("/getByStudent/{id}")
	@ResponseBody
	public Student getById(@PathVariable Long id)
	{
		return studentService.getById(id);
	}
	
	
	@PostMapping("/updateStudent")
	@ResponseBody
	public String updateStudent(@ModelAttribute("updateStudent") Student student)
	{
		studentService.updateStudent(student);
	
	return "updated";
	}

	@GetMapping("/deleteStudent/{id}")
	@ResponseBody
	public String deleteStudent(@PathVariable Long id)
	{
		studentService.deleteStudent(id);
		
		return "deleted";
	}
	
}
