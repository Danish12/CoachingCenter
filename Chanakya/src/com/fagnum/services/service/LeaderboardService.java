package com.fagnum.services.service;

import com.fagnum.services.model.Leaderboard;

public interface LeaderboardService extends AbstractService<Leaderboard, String> {

	Long getLeaderboardCount(String status);
}
