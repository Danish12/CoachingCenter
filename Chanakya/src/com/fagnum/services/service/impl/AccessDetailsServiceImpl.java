package com.fagnum.services.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fagnum.services.dao.AccessDetailsDao;
import com.fagnum.services.model.AccessDetails;
import com.fagnum.services.service.AccessDetailsService;

@Service("accessDetailsService")
public class AccessDetailsServiceImpl extends AbstractServiceImpl<AccessDetails, String> implements AccessDetailsService {
	
	@Autowired
	@Qualifier("accessDetailsDao")
	private AccessDetailsDao accessDetailsDao;
	
	@Override
	public List<AccessDetails> getAccessDetails(String ip, Date startDate, Date endDate){
		return accessDetailsDao.getAccessDetails(ip, startDate, endDate);
	}

}
