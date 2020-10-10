package com.fagnum.services.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fagnum.services.dao.TwitterTweetDao;
import com.fagnum.services.model.TwitterTweet;

@Repository("twitterTweetDao")
public class TwitterTweetDaoImpl extends AbstractDaoImpl<TwitterTweet, String> implements TwitterTweetDao {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
}
