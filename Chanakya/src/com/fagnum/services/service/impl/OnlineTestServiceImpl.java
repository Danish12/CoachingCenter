package com.fagnum.services.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fagnum.services.dao.OnlineTestDao;
import com.fagnum.services.model.OnlineTest;
import com.fagnum.services.service.OnlineTestService;

@Service("onlineTestService")
public class OnlineTestServiceImpl extends AbstractServiceImpl<OnlineTest, String> implements OnlineTestService {

	@Autowired
	@Qualifier("onlineTestDao")
	private OnlineTestDao onlineTestDao;


}
