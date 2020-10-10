package com.fagnum.services.model;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "DEACTIVATE")
public class Deactivate {
	
	@Id
	@Column(name = "Deactivate_ID")
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	private String deactivateId;
	
	@Column(name = "EMAIL_ID")
	private String emailId;
	
	@Column(name = "ENTITY_ID")
	private String entityId;
	
	@Column(name = "ENTITY_TYPE")
	private String entityType;
	
	@Column(name = "STATUS")
	private String status;
	
	@Column(name = "REASON")
	private String reason;
	
	@Embedded
	private ByAndTimeStamp byAndTimeStamp;

	public String getDeactivateId() {
		return deactivateId;
	}

	public void setDeactivateId(String deactivateId) {
		this.deactivateId = deactivateId;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getEntityId() {
		return entityId;
	}

	public void setEntityId(String entityId) {
		this.entityId = entityId;
	}

	public String getEntityType() {
		return entityType;
	}

	public void setEntityType(String entityType) {
		this.entityType = entityType;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public ByAndTimeStamp getByAndTimeStamp() {
		return byAndTimeStamp;
	}

	public void setByAndTimeStamp(ByAndTimeStamp byAndTimeStamp) {
		this.byAndTimeStamp = byAndTimeStamp;
	}
	
}
