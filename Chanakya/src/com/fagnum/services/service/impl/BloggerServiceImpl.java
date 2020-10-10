package com.fagnum.services.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fagnum.services.dao.BloggerDao;
import com.fagnum.services.model.Blogger;
import com.fagnum.services.service.BloggerService;

@Service("bloggerService")
public class BloggerServiceImpl extends AbstractServiceImpl<Blogger, String> implements BloggerService {
	
	@Autowired
	@Qualifier("bloggerDao")
	private BloggerDao bloggerDao;

}
