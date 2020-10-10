package com.fagnum.services.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fagnum.services.dao.UserDao;
import com.fagnum.services.model.User;

@Repository("userDao")
public class UserDaoImpl extends AbstractDaoImpl<User,String> implements UserDao {
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<User> isAuthenticate(String email, String password) {
		Session session = sessionFactory.openSession();
		List<User> list = null;
		try {
			Transaction tx = session.beginTransaction();
			Query query = session.createQuery("from User where emailId=? and password=?");
			query.setParameter(0, email);
			query.setParameter(1, password);
			list = query.list();
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public boolean checkEmailId(String emailId) {
		Session session = sessionFactory.openSession();
		boolean status = false;
		try {
			Query query = session.createQuery("from User where emailId = ?");
			query.setParameter(0, emailId);
			@SuppressWarnings("unchecked")
			List<User> list = query.list();
			if (list.isEmpty()) {
				status = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return status;
	}

	@Override
	public boolean delete(String emailId) {
		return false;
	}

	@Override
	public int updateStatus(String emailId) {
		Session session = sessionFactory.openSession();
		int i = 0;
		try {
			Query query = session.createQuery("update User set status = ? where emailId = ?");
			query.setParameter(0, (short) 1);
			query.setParameter(1, emailId);
			i = query.executeUpdate();
		} catch (HibernateException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return i;
	}

	@SuppressWarnings("unchecked")
	@Override
	public User findUsersByEmail(String emailId) {
		Session session = sessionFactory.openSession();
		List<User> list = null;
		try {
			Transaction tx = session.beginTransaction();
			Query query = session.createQuery("from User where emailId = ?");
			query.setParameter(0, emailId);
			list = query.list();
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getUserOfCompany(String companyId) {
		Session session = sessionFactory.openSession();
		List<User> list = null;
		try {
			Transaction tx = session.beginTransaction();
			Query query = session.createQuery("from User user left join fetch user.company "
					+ "where user.company.companyId = ?");
			query.setParameter(0, companyId);
			list = query.list();
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

}
