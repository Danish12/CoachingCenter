package com.fagnum.services.service;

import java.util.List;

import com.fagnum.services.model.Blog;

public interface BlogService extends AbstractService<Blog, String> {

	List<Blog> getBlogListByStatusAndBlogIdDesc(String status);
	
	Blog getBlogByURL(String blogUrl);

	List<Blog> search(List<Object> parameterList, String title, String blogger, String type, String startIndex, String endIndex);
	
	List<Object> getBloggerBlogCount(String blogId);
	
	List<Blog> findByCourse(String courseId, String startIndex, String pageSize);
	
	List<Blog> findBySubject(String subjectId, String startIndex, String pageSize);
	
	List<Blog> findByCourseAndSubject(String courseId, List<String> subjectIds, String startIndex, String pageSize);
	
}
