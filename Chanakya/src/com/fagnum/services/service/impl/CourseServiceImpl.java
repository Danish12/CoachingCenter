package com.fagnum.services.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fagnum.services.dao.CourseDao;
import com.fagnum.services.model.Course;
import com.fagnum.services.service.CourseService;

@Service("courseService")
public class CourseServiceImpl extends AbstractServiceImpl<Course, String> implements CourseService {

	@Autowired
	@Qualifier("courseDao")
	private CourseDao courseDao;

	@Override
	public Course findCourse(String name) {
		return courseDao.findCourse(name);
	}
	
}
