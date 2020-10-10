package com.fagnum.services.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fagnum.services.dao.SubjectDao;
import com.fagnum.services.model.Subject;

@Repository("subjectDao")
public class SubjectDaoImpl extends AbstractDaoImpl<Subject, String> implements SubjectDao {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public Subject findSubject(String name) {

		Session session = sessionFactory.openSession();

		Subject subject = null;
		try {
			String queryStr = "from Subject subject where subject.name = ?";

			Query query = session.createQuery(queryStr);
			query.setParameter(0, name);

			List<Subject> list = query.list();
			subject = list.get(0);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return subject;

	}

}
