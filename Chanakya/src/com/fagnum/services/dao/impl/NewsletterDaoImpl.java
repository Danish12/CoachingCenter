package com.fagnum.services.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fagnum.services.dao.NewsletterDao;
import com.fagnum.services.model.Newsletter;

@Repository("newsletterDao")
public class NewsletterDaoImpl extends AbstractDaoImpl<Newsletter, String> implements NewsletterDao {
	
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

}
