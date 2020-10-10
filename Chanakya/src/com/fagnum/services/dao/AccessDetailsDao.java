package com.fagnum.services.dao;

import java.util.Date;
import java.util.List;

import com.fagnum.services.model.AccessDetails;

public interface AccessDetailsDao extends AbstractDao<AccessDetails, String> {

	/**
	 * @param ip
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	List<AccessDetails> getAccessDetails(String ip, Date startDate, Date endDate);

}
