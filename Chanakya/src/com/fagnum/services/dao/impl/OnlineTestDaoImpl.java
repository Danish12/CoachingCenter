package com.fagnum.services.dao.impl;

import com.fagnum.services.model.Video;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fagnum.services.dao.OnlineTestDao;
import com.fagnum.services.model.OnlineTest;

import java.util.ArrayList;
import java.util.List;

@Repository("onlineTestDao")
public class OnlineTestDaoImpl extends AbstractDaoImpl<OnlineTest, String> implements OnlineTestDao {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	@Override
	public List<OnlineTest> findByCourseAndSubject(String courseId, String subjectId, String startIndex, String pageSize) {
		List<OnlineTest> onlineTests = new ArrayList<>();
		StringBuffer query = new StringBuffer("Select DISTINCT onlineTest from OnlineTest onlineTest JOIN " +
				"onlineTest.courses cb JOIN onlineTest.subjects cs "
				+ "WHERE  cb.courseId = ? and cs.subjectId = ?");

		Session session = sessionFactory.openSession();
		try {
			Query sesQuery = session.createQuery(query.toString());
			sesQuery.setParameter(0, courseId);
			sesQuery.setParameter(1, subjectId);
			onlineTests = sesQuery.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return onlineTests;
	}
	
	@Override
	public List<OnlineTest> findByCourseAndSubject(String courseId, String subjectId, String startIndex, String pageSize, boolean isPrime) {
		List<OnlineTest> onlineTests = new ArrayList<>();
		StringBuffer query = new StringBuffer("Select DISTINCT onlineTest from OnlineTest onlineTest JOIN " +
				"onlineTest.courses cb JOIN onlineTest.subjects cs "
				+ "WHERE  cb.courseId = ? and cs.subjectId = ? and onlineTest.isPrime = ?");

		Session session = sessionFactory.openSession();
		try {
			Query sesQuery = session.createQuery(query.toString());
			sesQuery.setParameter(0, courseId);
			sesQuery.setParameter(1, subjectId);
			sesQuery.setParameter(2, isPrime);
			onlineTests = sesQuery.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return onlineTests;
	}
	
	@Override
	public List<OnlineTest> findByCourse(String courseId, String startIndex, String pageSize, boolean isPrime) {
		List<OnlineTest> onlineTests = new ArrayList<>();
		StringBuffer query = new StringBuffer("Select DISTINCT onlineTest from OnlineTest onlineTest JOIN " +
				"onlineTest.courses cb WHERE  cb.courseId = ? and onlineTest.isPrime = ?");

		List<Object> parameterList = new ArrayList<Object>();
		parameterList.add(courseId);
		parameterList.add(isPrime);
		onlineTests = getDynamicList(parameterList, query.toString(), startIndex, pageSize);
		return onlineTests;
	}

	@Override
	public List<OnlineTest> findByCourse(String courseId, String startIndex, String pageSize) {
		List<OnlineTest> onlineTests = new ArrayList<>();
		StringBuffer query = new StringBuffer("Select DISTINCT onlineTest from OnlineTest onlineTest JOIN " +
				"onlineTest.courses cb WHERE  cb.courseId = ?");

		List<Object> parameterList = new ArrayList<Object>();
		parameterList.add(courseId);
		onlineTests = getDynamicList(parameterList, query.toString(), startIndex, pageSize);
		return onlineTests;
	}
}
