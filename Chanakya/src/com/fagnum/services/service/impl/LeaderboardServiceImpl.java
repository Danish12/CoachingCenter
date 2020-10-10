package com.fagnum.services.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fagnum.services.dao.LeaderboardDao;
import com.fagnum.services.model.Leaderboard;
import com.fagnum.services.service.LeaderboardService;

@Service("leaderboardService")
public class LeaderboardServiceImpl extends AbstractServiceImpl<Leaderboard, String> implements LeaderboardService {

	@Autowired
	@Qualifier("leaderboardDao")
	private LeaderboardDao leaderboardDao;
	
	@Override
	public Long getLeaderboardCount(String status) {
		return leaderboardDao.getLeaderboardCount(status);
	}
}
