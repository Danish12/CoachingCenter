package com.fagnum.services.dao;

import java.util.List;

import com.fagnum.services.model.Blog;

public interface BlogDao extends AbstractDao<Blog, String> {

	List<Blog> getBlogListByStatusAndBlogIdDesc(String status);
	
	Blog getBlogByURL(String blogUrl);

	/**
	 * @param parameterList 
	 * @param title
	 * @param blogger
	 * @param type
	 * @param startIndex
	 * @param endIndex
	 * @return
	 */
	List<Blog> search(List<Object> parameterList, String title, String blogger, String type, String startIndex, String endIndex);
	
	List<Object> getBloggerBlogCount(String blogId);
	
	List<Blog> findByCourse(String courseId, String startIndex, String pageSize);

	List<Blog> findByCourseAndSubject(String courseId, List<String> subjectIds, String startIndex, String pageSize);

	List<Blog> findBySubject(String subjectId, String startIndex, String pageSize);

}
