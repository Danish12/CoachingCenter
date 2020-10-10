package com.fagnum.services.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fagnum.services.dao.EnquiryDao;
import com.fagnum.services.model.Enquiry;

@Repository("enquiryDao")
public class EnquiryDaoImpl extends AbstractDaoImpl<Enquiry, String> implements EnquiryDao {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
}
