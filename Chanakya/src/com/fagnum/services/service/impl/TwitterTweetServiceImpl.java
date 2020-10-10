package com.fagnum.services.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fagnum.services.dao.TwitterTweetDao;
import com.fagnum.services.model.TwitterTweet;
import com.fagnum.services.service.TwitterTweetService;

@Service("twitterTweetService")
public class TwitterTweetServiceImpl extends AbstractServiceImpl<TwitterTweet, String> implements TwitterTweetService {

	@Autowired
	@Qualifier("twitterTweetDao")
	private TwitterTweetDao twitterTweetDao;
	
}
