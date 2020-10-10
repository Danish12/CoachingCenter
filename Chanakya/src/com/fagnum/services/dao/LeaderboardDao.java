package com.fagnum.services.dao;

import com.fagnum.services.model.Leaderboard;

public interface LeaderboardDao extends AbstractDao<Leaderboard, String> {

	Long getLeaderboardCount(String status);
}
