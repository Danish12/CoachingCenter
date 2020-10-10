package com.fagnum.services.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fagnum.services.dao.DeactivateDao;
import com.fagnum.services.model.Deactivate;

@Repository("deactivateDao")
public class DeactivateDaoImpl extends AbstractDaoImpl<Deactivate, String> implements DeactivateDao {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
}
