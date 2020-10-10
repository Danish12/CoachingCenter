package com.fagnum.services.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fagnum.services.dao.NewsletterDao;
import com.fagnum.services.model.Newsletter;
import com.fagnum.services.service.NewsletterService;

@Service("newsletterService")
public class NewsletterServiceImpl extends AbstractServiceImpl<Newsletter, String> implements NewsletterService {
	
	@Autowired
	@Qualifier ("newsletterDao")
	private NewsletterDao newsletterDao;

}
