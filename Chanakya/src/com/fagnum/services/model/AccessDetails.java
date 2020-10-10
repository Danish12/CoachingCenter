package com.fagnum.services.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "ACCESS_DETAILS")
public class AccessDetails {

	@Id
	@Column(name = "ACCESS_ID")
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	private String accessId;

	@Column(name = "IP")
	private String ip;

	@Column(name = "ACCESSED_ON", columnDefinition = "DATE")
	@Temporal(TemporalType.DATE)
	private Date accessedOn;

	@Column(name = "COUNT")
	private int count;
	
	@Column(name = "URL")
	private String url;
	
	@Column(name = "STATUS")
	private String status;
	
	
	public String getAccessId() {
		return accessId;
	}

	public void setAccessId(String accessId) {
		this.accessId = accessId;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public Date getAccessedOn() {
		return accessedOn;
	}

	public void setAccessedOn(Date accessedOn) {
		this.accessedOn = accessedOn;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}
