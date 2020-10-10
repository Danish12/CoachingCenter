package com.fagnum.services.service;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

import com.fagnum.services.model.AbstractTransEvents;

public interface AbstractService<T, PK extends Serializable> {

	T read(Class<T> type, PK id);
	
	T save(T o) throws Exception;

	T update(T transientObject);
	
	void delete(T persistentObject);
	
	void executeEvents(List<AbstractTransEvents> o);

	Long getTableRowCount(Class<T> type);

	Long getCount(List<Object> parameters, String queryStr);
	
	T getEntityByEmailId(Class<T> type, String emailId);
	
	List<T> getEntityListByEmailId(Class<T> type, String emailId, String status);
	
	List<T> getList(Class<T> type, String startIndex, String pageSize);

	List<T> getAllList(Class<T> type);
	
	List<T> getListByEntityIdAndType(Class<T> type, String entityId, String entityType);
	
	List<T> getEntityByStatus(Class<T> type, String status, String startIndex, String pageSize);
	
	/************ Dynamic Query Start *****************************/
	
	List<T> getDynamicList(List<Object> parameters, String query, String startIndex, String pageSize);
	
	List<T> getDynamicList(List<Object> parameters, String query);
	
	List<T> getDynamicListByLike(String className, String name, String value, String startIndex, String pageSize);
	
	T getDynamicEntity(String query, List<Object> parameters);
	
	/************ Dynamic Query End *****************************/
	
	Set<String> getDetailByAreaOrCityList(Class<T> classType, String value,String type);
	List<Object> executeSQL(String query);
}
