package com.fagnum.services.model;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "LEADERBOARD")
public class Leaderboard {

	@Id
	@Column(name = "LEADERBOARD_ID")
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	private String leaderboardId;
	
	@Column(name = "CONTEST_NUMBER")
	private int contestNumber;
	
	@Column(name = "SHARE")
	private int share;
	
	@Column(name = "VIEW")
	private int view;
	
	@Column(name = "CRITICS")
	private int critics;
	
	@Column(name = "REFERRAL")
	private int referral;
	
	@Column(name = "POINT")
	private int point;
	
	@Column(name = "STANDING")
	private int standing;
	
	@Column(name = "AWARDED_MONEY")
	private int awardedMoney;
	
	@Column(name = "AVERAGE_TIME")
	private String averageTime;
	
	@Column(name = "STATUS")
	private String status;
	
	@ManyToOne
	@JoinColumn(name = "BLOG_ID")
	private Blog blog;
	
	@Embedded
	private ByAndTimeStamp byAndTimeStamp;

	public String getLeaderboardId() {
		return leaderboardId;
	}

	public void setLeaderboardId(String leaderboardId) {
		this.leaderboardId = leaderboardId;
	}

	public int getShare() {
		return share;
	}

	public void setShare(int share) {
		this.share = share;
	}

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Blog getBlog() {
		return blog;
	}

	public void setBlog(Blog blog) {
		this.blog = blog;
	}

	public ByAndTimeStamp getByAndTimeStamp() {
		return byAndTimeStamp;
	}

	public void setByAndTimeStamp(ByAndTimeStamp byAndTimeStamp) {
		this.byAndTimeStamp = byAndTimeStamp;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getCritics() {
		return critics;
	}

	public void setCritics(int critics) {
		this.critics = critics;
	}

	public int getReferral() {
		return referral;
	}

	public void setReferral(int referral) {
		this.referral = referral;
	}

	public int getContestNumber() {
		return contestNumber;
	}

	public void setContestNumber(int contestNumber) {
		this.contestNumber = contestNumber;
	}

	public int getAwardedMoney() {
		return awardedMoney;
	}

	public void setAwardedMoney(int awardedMoney) {
		this.awardedMoney = awardedMoney;
	}

	public String getAverageTime() {
		return averageTime;
	}

	public void setAverageTime(String averageTime) {
		this.averageTime = averageTime;
	}

	public int getStanding() {
		return standing;
	}

	public void setStanding(int standing) {
		this.standing = standing;
	}
	
}
