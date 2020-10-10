package com.fagnum.services.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fagnum.services.dao.CategoryDao;
import com.fagnum.services.model.Category;

@Repository("categoryDao")
public class CategoryDaoImpl extends AbstractDaoImpl<Category, String> implements CategoryDao {
	
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

}
