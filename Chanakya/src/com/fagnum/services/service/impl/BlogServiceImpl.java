package com.fagnum.services.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fagnum.services.dao.BlogDao;
import com.fagnum.services.model.Blog;
import com.fagnum.services.service.BlogService;

@Service("blogService")
public class BlogServiceImpl extends AbstractServiceImpl<Blog, String> implements BlogService {

	@Autowired
	@Qualifier("blogDao")
	private BlogDao blogDao;

	@Override
	public Blog getBlogByURL(String blogUrl) {
		return blogDao.getBlogByURL(blogUrl);
	}

	@Override
	public List<Blog> getBlogListByStatusAndBlogIdDesc(String status) {
		return blogDao.getBlogListByStatusAndBlogIdDesc(status);
	}
	
	/* (non-Javadoc)
	 * @see com.fagnum.services.service.BlogService#search(java.util.List, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String)
	 */
	@Override
	public List<Blog> search(List<Object> parameterList, String title, String blogger, String type, String startIndex, String endIndex) {
		return blogDao.search(parameterList, title, blogger, type, startIndex, endIndex);
	}

	@Override
	public List<Object> getBloggerBlogCount(String blogId) {
		return blogDao.getBloggerBlogCount(blogId);
	}

	@Override
	public List<Blog> findByCourse(String courseId, String startIndex, String pageSize) {
		return blogDao.findByCourse(courseId, startIndex, pageSize);
	}

	@Override
	public List<Blog> findByCourseAndSubject(String courseId, List<String> subjectIds, String startIndex,
			String pageSize) {
		return blogDao.findByCourseAndSubject(courseId, subjectIds, startIndex, pageSize);
	}

	@Override
	public List<Blog> findBySubject(String subjectId, String startIndex, String pageSize) {
		return blogDao.findBySubject(subjectId, startIndex, pageSize);
	}
}
