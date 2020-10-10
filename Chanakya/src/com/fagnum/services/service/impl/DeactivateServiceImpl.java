package com.fagnum.services.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fagnum.services.dao.DeactivateDao;
import com.fagnum.services.model.Deactivate;
import com.fagnum.services.service.DeactivateService;

@Service("deactivateService")
public class DeactivateServiceImpl extends AbstractServiceImpl<Deactivate, String> implements DeactivateService {

	@Autowired
	@Qualifier("deactivateDao")
	private DeactivateDao deactivateDao;
}
