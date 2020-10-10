package com.fagnum.services.dao;

import com.fagnum.services.model.Course;

public interface CourseDao extends AbstractDao<Course, String> {

	Course findCourse(String name);

}
