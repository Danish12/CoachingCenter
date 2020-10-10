package com.fagnum.services.model;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "TWITTER_TWEET")
public class TwitterTweet {

	@Id
	@Column(name = "TWITTER_TWEET_ID")
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	private String twitterTweetId;
	
	@Column(name = "TWEET", unique = true)
	private String tweet;
	
	@Column(name = "LINK", unique = true)
	private String link;
	
	@Column(name = "TITLE")
	private String title;
	
	@Column(name = "TWEET_OWNER")
	private String tweetOwner;
	
	@Column(name = "STATUS")
	private String status;
	
	@Embedded
	private ByAndTimeStamp byAndTimeStamp;

	public String getTwitterTweetId() {
		return twitterTweetId;
	}

	public void setTwitterTweetId(String twitterTweetId) {
		this.twitterTweetId = twitterTweetId;
	}

	public String getTweet() {
		return tweet;
	}

	public void setTweet(String tweet) {
		this.tweet = tweet;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public ByAndTimeStamp getByAndTimeStamp() {
		return byAndTimeStamp;
	}

	public void setByAndTimeStamp(ByAndTimeStamp byAndTimeStamp) {
		this.byAndTimeStamp = byAndTimeStamp;
	}

	public String getTweetOwner() {
		return tweetOwner;
	}

	public void setTweetOwner(String tweetOwner) {
		this.tweetOwner = tweetOwner;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
}
