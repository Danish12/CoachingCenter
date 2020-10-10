package com.fagnum.services.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fagnum.services.dao.VideoDao;
import com.fagnum.services.model.Video;

@Repository("videoDao")
public class VideoDaoImpl extends AbstractDaoImpl<Video, String> implements VideoDao {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	@Override
	public List<Video> findByCourse(String courseId, String startIndex, String pageSize) {
		List<Video> videos = new ArrayList<>();
		StringBuffer query = new StringBuffer("Select DISTINCT video from Video video JOIN video.courses cb " + "WHERE  cb.courseId = ?");

		List<Object> parameterList = new ArrayList<Object>();
		parameterList.add(courseId);
		videos = getDynamicList(parameterList, query.toString(), startIndex, pageSize);
		return videos;

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Video> findByCourseAndSubject(String courseId, String subjectId, String startIndex, String pageSize) {
		List<Video> videos = new ArrayList<>();
		StringBuffer query = new StringBuffer("Select DISTINCT video from Video video JOIN video.courses cb JOIN video.subjects cs "
				+ "WHERE  cb.courseId = ? and cs.subjectId = ?");

		Session session = sessionFactory.openSession();
		try {
			Query sesQuery = session.createQuery(query.toString());
			sesQuery.setParameter(0, courseId);
			sesQuery.setParameter(1, subjectId);
			videos = sesQuery.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return videos;

	}
	
}
