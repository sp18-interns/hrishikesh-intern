package com.example.demo.student;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.Month;
import java.util.List;

@Service
public class StudentService {

	public List<Student> getStudents()  {
//		return studentService.getStudents();
		return List.of(
				new Student(1L, "Ketan", "Ketan@dwjdniqjd",
						LocalDate.of(2000, Month.MAY, 20), 22
				)
		);
	}
}
