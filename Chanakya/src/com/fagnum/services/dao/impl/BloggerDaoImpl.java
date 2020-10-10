package com.fagnum.services.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fagnum.services.dao.BloggerDao;
import com.fagnum.services.model.Blogger;

@Repository("bloggerDao")
public class BloggerDaoImpl extends AbstractDaoImpl<Blogger, String> implements BloggerDao {
	
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

}
