package com.fagnum.services.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fagnum.services.dao.AbstractDao;
import com.fagnum.services.model.AbstractTransEvents;
import com.fagnum.services.service.AbstractService;

@Service("abstractService")
public class AbstractServiceImpl<T, PK extends Serializable> implements AbstractService<T, PK> {

	@Autowired
	@Qualifier("abstractDao")
	private AbstractDao<T, PK> abstractDao;

	@Override
	public T read(Class<T> type, PK id) {
		return (T) abstractDao.read(type, id);
	}

	@Override
	public List<T> getList(Class<T> type, String startIndex, String pageSize) {
		return abstractDao.getList(type, startIndex, pageSize);
	}

	@Override
	public List<T> getAllList(Class<T> type) {
		return abstractDao.getAllList(type);
	}
	
	@Override
	public T save(T o) throws Exception {
		return abstractDao.save(o);
	}

	@Override
	public void executeEvents(List<AbstractTransEvents> o) {
		abstractDao.executeEvents(o);
	}

	@Override
	public T update(T transientObject) {
		return abstractDao.update(transientObject);
	}

	@Override
	public void delete(T o) {
		abstractDao.delete(o);
	}

	@Override
	public Long getTableRowCount(Class<T> type){
		return	abstractDao.getTableRowCount(type);
	}

	@Override
	public List<T> getEntityListByEmailId(Class<T> type, String emailId, String status) {
		return abstractDao.getEntityListByEmailId(type, emailId, status);
	}

	@Override
	public T getEntityByEmailId(Class<T> type, String emailId) {
		return (T) abstractDao.getEntityByEmailId(type, emailId);
	}

	@Override
	public Long getCount(List<Object> parameters, String queryStr) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<T> getListByEntityIdAndType(Class<T> type, String entityId, String entityType) {
		return abstractDao.getListByEntityIdAndType(type, entityId, entityType);
	}

	@Override
	public List<T> getEntityByStatus(Class<T> type, String status,
			String startIndex, String pageSize) {
		return abstractDao.getEntityByStatus(type, status, startIndex, pageSize);
	}
	
	/************ Dynamic Query Start *****************************/
	
	@Override
	public List<T> getDynamicList(List<Object> parameters, String query, String startIndex, String pageSize) {
		return abstractDao.getDynamicList(parameters, query, startIndex, pageSize);
	}
	
	@Override
	public List<T> getDynamicList(List<Object> parameters, String query) {
		return abstractDao.getDynamicList(parameters, query);
	}

	@Override
	public List<T> getDynamicListByLike(String className, String name, String value, String startIndex, String pageSize) {
		return abstractDao.getDynamicListByLike(className, name, value, startIndex, pageSize);
	}
	
	@Override
	public T getDynamicEntity(String query, List<Object> parameters) {
		return (T) abstractDao.getDynamicEntity(query, parameters);
	}
	
	/************ Dynamic Query End *****************************/
	
	@Override
	public Set<String> getDetailByAreaOrCityList(Class<T> classType, String value, String type) {
		return abstractDao.getDetailByAreaOrCityList(classType, value, type);
	}
	
	@Override
	public List<Object> executeSQL(String query) {
		return abstractDao.executeSQL(query);
	}

}
