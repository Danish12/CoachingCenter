package com.fagnum.services.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fagnum.services.dao.CourseDao;
import com.fagnum.services.model.Course;

@Repository("courseDao")
public class CourseDaoImpl extends AbstractDaoImpl<Course, String> implements CourseDao {
	
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public Course findCourse(String name) {

		Session session = sessionFactory.openSession();

		Course course = null;
		try {
			String queryStr = "from Course course where course.name = ?";

			Query query = session.createQuery(queryStr);
			query.setParameter(0, name);

			List<Course> list = query.list();
			course = list.get(0);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return course;

	}

}
