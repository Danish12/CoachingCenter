package com.fagnum.services.service;

import java.util.Date;
import java.util.List;

import com.fagnum.services.model.AccessDetails;

public interface AccessDetailsService extends AbstractService<AccessDetails, String> {

	/**
	 * @param ip
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	List<AccessDetails> getAccessDetails(String ip, Date startDate, Date endDate);
	

}
