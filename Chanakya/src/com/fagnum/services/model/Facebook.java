package com.fagnum.services.model;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "FACEBOOK")
public class Facebook {

	@Id
	@Column(name = "FACEBOOK_ID")
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	private String facebookId;
	
	@Column(name = "GROUP_NAME")
	private String groupName;
	
	@Column(name = "GROUP_LINK", unique = true)
	private String groupLink;
	
	@Column(name = "TYPE")
	private String type;
	
	@Column(name = "STATUS")
	private String status;
	
	@Embedded
	private ByAndTimeStamp byAndTimeStamp;

	public String getFacebookId() {
		return facebookId;
	}

	public void setFacebookId(String facebookId) {
		this.facebookId = facebookId;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getGroupLink() {
		return groupLink;
	}

	public void setGroupLink(String groupLink) {
		this.groupLink = groupLink;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public ByAndTimeStamp getByAndTimeStamp() {
		return byAndTimeStamp;
	}

	public void setByAndTimeStamp(ByAndTimeStamp byAndTimeStamp) {
		this.byAndTimeStamp = byAndTimeStamp;
	}
	
}
