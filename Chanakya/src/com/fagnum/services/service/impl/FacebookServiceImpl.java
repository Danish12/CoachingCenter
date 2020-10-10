package com.fagnum.services.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fagnum.services.dao.FacebookDao;
import com.fagnum.services.model.Facebook;
import com.fagnum.services.service.FacebookService;

@Service("facebookService")
public class FacebookServiceImpl extends AbstractServiceImpl<Facebook, String> implements FacebookService {

	@Autowired
	@Qualifier("facebookDao")
	private FacebookDao facebookDao;
}
