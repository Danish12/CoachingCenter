package com.fagnum.services.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fagnum.services.dao.AccessDetailsDao;
import com.fagnum.services.model.AccessDetails;

@Repository("accessDetailsDao")
public class AccessDetailsDaoImpl extends AbstractDaoImpl<AccessDetails, String> implements AccessDetailsDao {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<AccessDetails> getAccessDetails(String ip, Date startDate, Date endDate) {
		Session session = sessionFactory.openSession();
		List<AccessDetails> list = null;
		try {
			Query query = session
					.createQuery("from AccessDetails accessDetails where accessDetails.ip = ? and accessDetails.accessedOn BETWEEN :startDate AND :endDate)");
			query.setParameter(0, ip);
			query.setParameter("startDate", startDate);
			query.setParameter("endDate", endDate);
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;

	}

}
