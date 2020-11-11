package com.fagnum.test;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.Set;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.fagnum.controller.AppController;
import com.fagnum.services.model.Blog;
import com.fagnum.services.model.ByAndTimeStamp;
import com.fagnum.services.model.Course;
import com.fagnum.services.model.Subject;
import com.fagnum.services.service.BlogService;
import com.fagnum.services.service.CourseService;
import com.fagnum.services.service.SubjectService;

public class DynamicQuery {
	private static final Logger logger = Logger.getLogger(DynamicQuery.class);

	@Autowired
	public static ClassPathXmlApplicationContext appContext = null;

	public static void main(String[] args) throws Exception {

		appContext = new ClassPathXmlApplicationContext(new String[] {"applicationContext.xml"});

		CourseService courseService = AppController.getCourseService();
		SubjectService subjectService = AppController.getSubjectService();
		BlogService blogService = AppController.getBlogService();

		// addCourse(subjectService, courseService);
		// addBlog(subjectService,courseService, blogService);
		// findBlogByCourseName(blogService, courseService);

		Course course = courseService.findCourse("UPSC");
		Subject subject = subjectService.findSubject("HINDI");
		Subject subject2 = subjectService.findSubject("Maths");
		String[] subjects = {subject.getSubjectId(), subject2.getSubjectId()};
		
		List<String> subList = new ArrayList<>();
		subList.add(subject.getSubjectId());
		subList.add(subject2.getSubjectId());

		StringBuffer query = new StringBuffer(
				"Select DISTINCT blog from Blog blog JOIN blog.courses cb JOIN blog.subjects cs "
						+ "WHERE  cb.courseId = ? and cs.subjectId IN (:subjects) ");
		
		
		String query2 = "Select DISTINCT blog from Blog blog JOIN blog.subjects sb WHERE  sb.subjectId = ?  ";

		List<Object> parameterList = new ArrayList<Object>();
		parameterList.add("402881e575018460017501864b980000");
		List<Blog> list = blogService.getDynamicList(parameterList, query2.toString());
		System.out.println(list);

	}

	private static void findBlogByCourseName(BlogService blogService, CourseService courseService) {

		Course course = courseService.findCourse("UPSE");

		StringBuffer query = new StringBuffer(
				"Select DISTINCT blog from Blog blog JOIN blog.courses cb " + "WHERE  cb.courseId = ?");

		List<Object> parameterList = new ArrayList<Object>();
		parameterList.add(course.getCourseId());
		List<Blog> list = blogService.getDynamicList(parameterList, query.toString());
		System.out.println(list);

	}

	private static void addCourse(SubjectService subjectService, CourseService courseService) throws Exception {
		Course course = new Course();
		Set<Subject> subjects = new java.util.HashSet<>();
		subjects.add(subjectService.read(Subject.class, "402780e674a4979b0174a49b99f80000"));
		course.setName("Test" + new Random().nextInt());
		course.setSubjects(subjects);

		ByAndTimeStamp byAndTimeStamp = new ByAndTimeStamp();
		byAndTimeStamp.setCreatedBy("Test");
		byAndTimeStamp.setCreatedTs(new Timestamp(new Date().getTime()));
		byAndTimeStamp.setModifiedBy("Test");
		byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));

		course.setByAndTimeStamp(byAndTimeStamp);
		course = courseService.save(course);

		System.out.println(course.getCourseId());

	}

	private static void addBlog(SubjectService subjectService, CourseService courseService, BlogService blogService)
			throws Exception {
		Set<Course> courses = new java.util.HashSet<>();
		courses.add(courseService.read(Course.class, "402881e674a5959b0174a596ced80000"));

		Set<Subject> subjects = new java.util.HashSet<>();
		subjects.add(subjectService.read(Subject.class, "402780e674a4979b0174a4f08afe0003"));

		Blog blog = new Blog();
		blog.setBlogger(null);

		blog.setSubjects(subjects);
		blog.setCourses(courses);

		blog.setContent("THIS IS A TEST BLOG");
		blog.setTitle("THIS IS A TEST BLOG" + new Random().nextInt());
		blog.setUrl("THIS IS A TEST BLOG" + new Random().nextInt());

		blog = blogService.save(blog);
		System.out.println(blog.getSubjects());
		System.out.println(blog.getCourses());

	}
}
