package com.fagnum.services.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fagnum.services.dao.AbstractDao;
import com.fagnum.services.model.AbstractTransEvents;

@Repository("abstractDao")
public class AbstractDaoImpl<T, PK extends Serializable> implements AbstractDao<T, PK> {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	public AbstractDaoImpl() {
	}

	@Override
	public T save(T o) throws Exception {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.save(o);
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			throw e;
		} finally {
			session.flush();
			session.close();
		}
		return o;
	}

	@Override
	public T update(T o) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.update(o);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		} finally {
			session.flush();
			session.close();
		}
		return o;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Object> executeSQL(String query){
		Session session = sessionFactory.openSession();
		List<Object> listNew = null;
		try {
			SQLQuery sqlQuery = session.createSQLQuery(query);
			listNew = sqlQuery.list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return listNew;
	}

	@Override
	public void executeEvents(List<AbstractTransEvents> operationList) {
		Session session = sessionFactory.openSession();
		org.hibernate.Transaction transaction = session.beginTransaction();
		try {
			for (AbstractTransEvents o : operationList) {
				switch (o.getOperationType()) {
				case "SAVE":
					session.save(o.getObject());
					break;
				case "UPDATE":
					session.saveOrUpdate(o.getObject());
					break;
				case "DELETE":
					session.delete(o.getObject());
					break;

				default:
					break;
				}

			}
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
	}

	public void delete(T o) {
		Session session = sessionFactory.openSession();
		try {
			session.delete(o);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public T read(Class<T> type, PK id) {
		Session session = sessionFactory.openSession();
		T t = null;
		try {
			t = (T) session.get(type, id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return t;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> getList(Class<T> type, String startIndex, String pageSize) {
		List<T> list = null;
		Session session = sessionFactory.openSession();
		try {
			Query query = session.createQuery("from " + type.getName());
			if (startIndex != null && startIndex.length() > 0) {
				query.setFirstResult(Integer.parseInt(startIndex));
			} else {
				query.setFirstResult(0);
			}
			if (pageSize != null && pageSize.length() > 0) {
				query.setMaxResults(Integer.parseInt(pageSize));
			} else {
				query.setMaxResults(10);
			}
			list = (List<T>) query.list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> getAllList(Class<T> type) {
		List<T> list = null;
		Session session = sessionFactory.openSession();
		try {
			Query query = session.createQuery("from " + type.getName());
			list = (List<T>) query.list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	@SuppressWarnings("rawtypes")
	public Long getCount(List<Object> parameters, String queryStr) {
		Session session = sessionFactory.openSession();
		List list = null;
		try {
			Query query = session.createQuery(queryStr);
			if (parameters != null) {
				for (int i = 0; i < parameters.size(); i++) {
					query.setParameter(i, parameters.get(0));
				}
			}
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return (long) list.get(0);
	}
	
	public Long getTableRowCount(Class<T> type) {
		Long count = 0L;
		Session session = sessionFactory.openSession();
		try {
			Query query = session.createQuery("select count(*) from "+ type.getName());
			count = (Long)query.uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return count;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> getEntityListByEmailId(Class<T> type, String emailId, String status) {
		List<T> list = null;
		Session session = sessionFactory.openSession();
		try {
			StringBuffer queryString = new StringBuffer("from "+type.getName()+" where emailId = ? ");
			if(status != null) {
				queryString.append(" and status = ?");
			}
			
			Query query = session.createQuery(queryString.toString());
			query.setParameter(0, emailId);
			if(status != null) {
				query.setParameter(1, status);
			}
			list = (List<T>) query.list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public T getEntityByEmailId(Class<T> type, String emailId) {
		T t = null;
		Session session = sessionFactory.openSession();
		try {
			Query query = session.createQuery("from " + type.getName() +" where emailId = ?");
			query.setParameter(0, emailId);
			List<T> list = (List<T>) query.list();
			for (T t2 : list) {
				t = (T) t2;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return t;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> getListByEntityIdAndType(Class<T> type, String entityId, String entityType) {
		List<T> list = null;
		Session session = sessionFactory.openSession();
		try {
			Query query = session.createQuery("from "+type.getName()+" where entityId = ? and entityType = ?");
			query.setParameter(0, entityId);
			query.setParameter(1, entityType);
			list = (List<T>) query.list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	

	@SuppressWarnings("unchecked")
	@Override
	public List<T> getEntityByStatus(Class<T> type, String status,
			String startIndex, String pageSize) {
		List<T> list = null;
		Session session = sessionFactory.openSession();
		try {
			Query query = session.createQuery("from "+type.getName()+" where status = ?");
			query.setParameter(0, status);
			if (startIndex != null && startIndex.length() > 0) {
				query.setFirstResult(Integer.parseInt(startIndex));
			} else {
				query.setFirstResult(0);
			}
			if (pageSize != null && pageSize.length() > 0) {
				query.setMaxResults(Integer.parseInt(pageSize));
			} else {
				query.setMaxResults(10);
			}
			list = (List<T>) query.list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	/************ Dynamic Query Start *****************************/
	
	@SuppressWarnings("unchecked")
	@Override
	public List<T> getDynamicList(List<Object> parameters, String query, String startIndex, String pageSize) {
		Session session = sessionFactory.openSession();
		List<T> list = null;
		try {
			Query dynamicQuery = session.createQuery(query);
			if (parameters != null) {
				for (int i = 0; i < parameters.size(); i++) {
					dynamicQuery.setParameter(i, parameters.get(i));
				}
			}
			if (startIndex != null && startIndex.length() > 0) {
				dynamicQuery.setFirstResult(Integer.parseInt(startIndex));
			} else {
				dynamicQuery.setFirstResult(0);
			}
			if (pageSize != null && pageSize.length() > 0) {
				dynamicQuery.setMaxResults(Integer.parseInt(pageSize));
			} else {
				dynamicQuery.setMaxResults(10);
			}
			list = (List<T>) dynamicQuery.list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<T> getDynamicList(List<Object> parameters, String query) {
		Session session = sessionFactory.openSession();
		List<T> list = null;
		try {
			Query dynamicQuery = session.createQuery(query);
			if (parameters != null) {
				for (int i = 0; i < parameters.size(); i++) {
					dynamicQuery.setParameter(i, parameters.get(i));
				}
			}
			list = (List<T>) dynamicQuery.list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<T> getDynamicListByLike(String className, String name, String value, String startIndex, String pageSize) {
		Session session = sessionFactory.openSession();
		List<Object> parameters = new ArrayList<Object>();
		List<T> list = null;
		try {
			String values [] = value.split(",");
			String names [] = name.split(",");
			StringBuffer query = new StringBuffer("from "+ className +" "+className.toLowerCase()+" where");
			for (int i=0; i<values.length; i++) {
				if(values[i] != "" && values[i].length() > 0) {
					query.append(" "+className.toLowerCase()+"."+names[i]+" LIKE ?");
					parameters.add(values[i]);
					if(i < (values.length-1)) {
						query.append(" and");
					}
				}
			}
			Query dynamicQuery = session.createQuery(query.toString());
			if (parameters != null) {
				for (int i = 0; i < parameters.size(); i++) {
					dynamicQuery.setParameter(i, "%" + parameters.get(i) + "%");
				}
			}
			if (startIndex != null && startIndex.length() > 0) {
				dynamicQuery.setFirstResult(Integer.parseInt(startIndex));
			} 
			if (pageSize != null && pageSize.length() > 0) {
				dynamicQuery.setMaxResults(Integer.parseInt(pageSize));
			}
			list = (List<T>) dynamicQuery.list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public T getDynamicEntity(String query, List<Object> parameters) {
		T t = null;
		Session session = sessionFactory.openSession();
		try {
			Query dynamicQuery = session.createQuery(query);
			if (parameters != null) {
				for (int i = 0; i < parameters.size(); i++) {
					dynamicQuery.setParameter(i, parameters.get(i));
				}
			}
			List<T> list = (List<T>) dynamicQuery.list();
			for (T t2 : list) {
				t = (T) t2;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return t;
	}

	/************ Dynamic Query End *****************************/
	
	@SuppressWarnings("unchecked")
	@Override
	public Set<String> getDetailByAreaOrCityList(Class<T> classType, String value, String type) {
		Set<String> set = null;
		Session session = sessionFactory.openSession();
		if (type.equals("area")) {
			try {
				Criteria criteria = session.createCriteria(classType);
				//criteria.add(Restrictions.like("area", "%" + value + "%")).setProjection(Projections.distinct(Projections.property("area")));
				criteria.setProjection(Projections.distinct(Projections.property("area")));
				set = new HashSet<String>(criteria.list());
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.flush();
				session.close();
			}
		} else if (type.equals("city")) {
			try {
				Criteria criteria = session.createCriteria(classType);
				//criteria.add(Restrictions.like("city", "%" + value + "%")).setProjection(Projections.distinct(Projections.property("city")));
				criteria.setProjection(Projections.distinct(Projections.property("city")));
				set = new HashSet<String>(criteria.list());
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.flush();
				session.close();
			}
		}
		return set;
	}

}
