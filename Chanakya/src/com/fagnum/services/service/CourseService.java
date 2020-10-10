package com.fagnum.services.service;

import com.fagnum.services.model.Course;

public interface CourseService extends AbstractService<Course, String> {
	Course findCourse(String name);
}
