package com.fagnum.services.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fagnum.services.dao.OnlineTestDao;
import com.fagnum.services.model.OnlineTest;

@Repository("onlineTestDao")
public class OnlineTestDaoImpl extends AbstractDaoImpl<OnlineTest, String> implements OnlineTestDao {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
}
