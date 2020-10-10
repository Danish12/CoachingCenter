package com.fagnum.services.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fagnum.services.dao.FacebookDao;
import com.fagnum.services.model.Facebook;

@Repository("facebookDao")
public class FacebookDaoImpl extends AbstractDaoImpl<Facebook, String> implements FacebookDao {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

}
