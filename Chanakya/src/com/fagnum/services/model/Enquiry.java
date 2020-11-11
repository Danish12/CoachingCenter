package com.fagnum.services.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "ENQUIRY")
public class Enquiry {

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	@Column(name = "ENQUIRY_ID")
	private String enquiryId;
	@Column(name = "DATE")
	private Date date;
	@Column(name = "NAME")
	private String name;
	@Column(name = "EMAIL_ID")
	private String emailId;
	@Column(name = "CONTACT_NUMBER")
	private String contactNumber;

	@Embedded
	private ByAndTimeStamp byAndTimeStamp;

	public String getEnquiryId() {
		return enquiryId;
	}

	public void setEnquiryId(String enquiryId) {
		this.enquiryId = enquiryId;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		if(emailId != null && !emailId.equals("")) {
			this.emailId = emailId;
		}else {
			this.emailId = "NA";
		}
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		if(contactNumber != null && !contactNumber.equals("")) {
			this.contactNumber = contactNumber;
		}else {
			this.contactNumber = "NA";
		}
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public ByAndTimeStamp getByAndTimeStamp() {
		return byAndTimeStamp;
	}

	public void setByAndTimeStamp(ByAndTimeStamp byAndTimeStamp) {
		this.byAndTimeStamp = byAndTimeStamp;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
}
