package com.fagnum.services.dao.impl;

import java.math.BigInteger;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fagnum.services.dao.LeaderboardDao;
import com.fagnum.services.model.Leaderboard;

@Repository("leaderboardDao")
public class LeaderboardDaoImpl extends AbstractDaoImpl<Leaderboard, String> implements LeaderboardDao {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public Long getLeaderboardCount(String status) {
		Session session = sessionFactory.openSession();
		List<BigInteger> list = null;
		Long count = (long) 0;
		try {
			Query query = session.createSQLQuery("select count(LEADERBOARD_ID) from LEADERBOARD where STATUS = ?");
			query.setParameter(0, status);
			list = query.list();
			count = list.get(0).longValue();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return count;
	}
	
}
