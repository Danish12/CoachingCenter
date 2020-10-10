package com.fagnum.services.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fagnum.services.dao.DocumentMediaDao;
import com.fagnum.services.model.DocumentMedia;

@Repository("documentMediaDao")
public class DocumentMediDaoImpl extends AbstractDaoImpl<DocumentMedia, String> implements DocumentMediaDao {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
}
