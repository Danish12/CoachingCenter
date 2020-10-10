package com.fagnum.controller;

import java.util.List;

import org.springframework.web.bind.annotation.ModelAttribute;

import com.fagnum.services.model.Course;
import com.fagnum.services.service.CourseService;

public class BaseAppController {

	@ModelAttribute("courses")
	public List<Course> getCourses() {
		CourseService courseService = AppController.getCourseService();
		List<Course> courses = courseService.getEntityByStatus(Course.class, "ACTIVE", "0", "3");
		return courses;
	}

}
