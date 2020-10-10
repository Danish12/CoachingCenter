package com.fagnum.services.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class ByAndTimeStamp {

	@Column(name="CREATED_BY")
	private String createdBy;
	@Column(name="MODIFIED_BY")
	private String modifiedBy;
	@Column(name="CREATED_TS")
	private Timestamp createdTs;
	@Column(name="MODIFIED_TS")
	private Timestamp modifiedTs;
	
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public String getModifiedBy() {
		return modifiedBy;
	}
	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}
	public Timestamp getCreatedTs() {
		return createdTs;
	}
	public void setCreatedTs(Timestamp createdTs) {
		this.createdTs = createdTs;
	}
	public Timestamp getModifiedTs() {
		return modifiedTs;
	}
	public void setModifiedTs(Timestamp modifiedTs) {
		this.modifiedTs = modifiedTs;
	}
	
	@Override
	public String toString() {
		return "ByAndTimeStamp [modifiedBy=" + modifiedBy + ", createdTs=" + createdTs + ", modifiedTs=" + modifiedTs + "]";
	}
}
