package com.fagnum.services.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fagnum.services.dao.EnquiryDao;
import com.fagnum.services.model.Enquiry;
import com.fagnum.services.service.EnquiryService;

@Service("enquiryService")
public class EnquiryServiceImpl extends AbstractServiceImpl<Enquiry, String> implements EnquiryService {

	@Autowired
	@Qualifier("enquiryDao")
	private EnquiryDao enquiryDao;
}
