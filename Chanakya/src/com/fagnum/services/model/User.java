package com.fagnum.services.model;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.json.JSONException;
import org.json.JSONObject;

@Entity
@Table(name = "USER")
public class User {

	@Column(name = "USER_ID")
	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	private String userId;
	@Column(name = "NAME")
	private String name;
	@Column(name = "EMAIL_ID")
	private String emailId;
	@Column(name = "CONTACT_NUMBER")
	private String contactNumber;
	@Column(name = "PASSWORD")
	private String password;
	@Column(name = "USER_TYPE")
	private String userType;
	
	@Column(name = "COURSE")
	private String course;
	
	@Column(name = "STATUS")
	private String status;
	
	@Column(name = "DATE_START")
	Date startDate;
	
	@Column(name = "DATE_END")
	Date endDate;
	
	@Embedded
	private ByAndTimeStamp byAndTimeStamp;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public ByAndTimeStamp getByAndTimeStamp() {
		return byAndTimeStamp;
	}

	public void setByAndTimeStamp(ByAndTimeStamp byAndTimeStamp) {
		this.byAndTimeStamp = byAndTimeStamp;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", name=" + name + ", emailId=" + emailId + ", "
				+ " contactNumber =" + contactNumber + ", password=" + password + ", userType=" + userType + ","
				+ " byAndTimeStamp= " + byAndTimeStamp + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		return true;
	}
	
	public JSONObject toJSON() throws JSONException {
		JSONObject object = new JSONObject();
		
		object.put("UserId", this.getUserId());
		object.put("status", this.getStatus());
		object.put("name", this.getName());
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		
		object.put("startDate", format.format(this.getStartDate()));
		object.put("endDate", format.format(this.getEndDate()));
		object.put("emailAddress", this.getEmailId());
		object.put("mobile", this.contactNumber);
		object.put("password", this.password);
		String courseStr = "";
		String courseIds = ""; 
		for(String course : this.getCourse().split(",")){
			courseIds = courseIds + "," + course;
		}
		object.put("courses", courseStr);
		
		object.put("action",
				"<div class=''><div class=''>"
						+ "<a class='btn btn-primary btn pull-left' data-toggle='modal' href='#searchModal' style='color: white; padding: 0px 6px;' "
						+ "onclick=\"loadUserDetails('"+this.getUserId()+"')\" title='Update User Details'>Update</a></div></div>");
		
		object.put("courseIds", courseIds);
		
		return object;
	}

}
