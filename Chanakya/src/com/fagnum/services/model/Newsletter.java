package com.fagnum.services.model;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "NEWSLETTER")
public class Newsletter {

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	@Column(name = "NEWSLETTER_ID")
	private String newsletterId;
	@Column(name = "EMAIL_ID")
	private String emailId;
	@Column(name = "REASON")
	private String reason;
	@Column(name = "STATUS")
	private String status;

	@Embedded
	private ByAndTimeStamp byAndTimeStamp;

	public String getNewsletterId() {
		return newsletterId;
	}

	public void setNewsletterId(String newsletterId) {
		this.newsletterId = newsletterId;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
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
