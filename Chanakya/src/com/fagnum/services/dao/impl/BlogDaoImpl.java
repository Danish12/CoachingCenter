package com.fagnum.services.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fagnum.services.dao.BlogDao;
import com.fagnum.services.model.Blog;
import com.fagnum.services.util.Constants;

@Repository("blogDao")
public class BlogDaoImpl extends AbstractDaoImpl<Blog, String> implements BlogDao {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public Blog getBlogByURL(String blogUrl) {
		Session session = sessionFactory.openSession();
		List<Blog> list = null;
		Blog blog1 = new Blog();
		try {
			Query query = session.createQuery(
					"from Blog blog where (blog.url = ? or blog.url = ?) and (blog.status = ? or blog.status = ?)");
			query.setParameter(0, blogUrl);
			query.setParameter(1, blogUrl + "/");
			query.setParameter(2, Constants._PUBLISH);
			query.setParameter(3, Constants._DRAFT);
			list = query.list();
			if (!list.isEmpty()) {
				for (Blog blog : list) {
					blog1 = blog;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return blog1;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Blog> getBlogListByStatusAndBlogIdDesc(String status) {
		Session session = sessionFactory.openSession();
		List<Blog> list = null;
		try {
			Query query = session.createQuery("from Blog blog where blog.status = ? order by blog.blogId desc");
			query.setParameter(0, status);
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.fagnum.services.dao.BloggerDao#search(java.lang.String,
	 * java.lang.String, java.lang.String, java.lang.String, java.lang.String)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Blog> search(List<Object> parameterList, String title, String blogger, String type, String startIndex,
			String endIndex) {

		Session session = sessionFactory.openSession();
		List<Blog> list = null;
		try {
			String queryStr = "from Blog blog where ";
			boolean isFirst = true;
			if (null != title && title.length() > 1) {
				queryStr = queryStr + " blog.title LIKE :title ";
				isFirst = false;
			}
			if (null != blogger && blogger.length() > 1) {
				if (isFirst) {
					isFirst = false;
				} else {
					queryStr = queryStr + " AND ";
				}
				queryStr = queryStr + " blog.bloggerUrl LIKE :bloggerurl ";
			}
			if (null != type && type.length() > 1) {
				if (isFirst) {
					queryStr = queryStr + " blog.blogType LIKE :type";
				} else {
					queryStr = queryStr + " AND blog.blogType LIKE :type";
				}

			}
			queryStr = queryStr + " order by blog.blogId desc";

			Query query = session.createQuery(queryStr);

			if (null != title && title.length() > 1) {
				query.setParameter("title", "%" + title + "%");
			}
			if (null != blogger && blogger.length() > 1) {
				query.setParameter("bloggerurl", "%" + blogger + "%");
			}
			if (null != type && type.length() > 1) {

				query.setParameter("type", "%" + type + "%");
			}
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> getBloggerBlogCount(String bloggerUrl) {
		List<Object> list = null;
		Session session = sessionFactory.openSession();
		try {
			Query query = session.createSQLQuery("select BLOGGER_ID,BLOGGER_URL,COUNT(BLOGGER_ID) as count from BLOG "
					+ "where BLOGGER_URL = ? and STATUS = ? group by BLOGGER_ID order by count desc, BLOGGER_URL asc");
			query.setParameter(0, bloggerUrl);
			query.setParameter(1, Constants._PUBLISH);
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Blog> findByCourse(String courseId, String startIndex, String pageSize ) {
		List<Blog> blogs = new ArrayList<>();
		StringBuffer query = new StringBuffer("Select DISTINCT blog from Blog blog JOIN blog.courses cb " + "WHERE  cb.courseId = ?");

		List<Object> parameterList = new ArrayList<Object>();
		parameterList.add(courseId);
		blogs = getDynamicList(parameterList, query.toString(), startIndex, pageSize);
		return blogs;

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Blog> findByCourseAndSubject(String courseId, List<String> subjectIds,  String startIndex, String pageSize ) {
		List<Blog> blogs = new ArrayList<>();
		StringBuffer query = new StringBuffer("Select DISTINCT blog from Blog blog JOIN blog.courses cb JOIN blog.subjects cs "
				+ "WHERE  cb.courseId = ? and cs.subjectId IN (:subjects) ");

		Session session = sessionFactory.openSession();
		try {
			Query sesQuery = session.createQuery(query.toString());
			sesQuery.setParameter(0, courseId);
			sesQuery.setParameterList("subjects", subjectIds);
			blogs = sesQuery.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return blogs;

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Blog> findBySubject(String subjectId, String startIndex, String pageSize) {
		List<Blog> blogs = new ArrayList<>();
		StringBuffer query = new StringBuffer("Select DISTINCT blog from Blog blog JOIN blog.subjects sb "+ "WHERE  sb.subjectId = ?  ");

		Session session = sessionFactory.openSession();
		try {
			Query sesQuery = session.createQuery(query.toString());
			sesQuery.setParameter(0, subjectId);
			blogs = sesQuery.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return blogs;

	}

}
