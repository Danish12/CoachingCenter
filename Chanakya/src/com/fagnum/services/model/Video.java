package com.fagnum.services.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;
import org.json.JSONObject;

@Entity
@Table(name = "VIDEO")
public class Video {

	@Id
	@Column(name = "VIDEO_ID")
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	private String videoId;
	
	@Column(name = "URL", unique = true)
	private String url;

	@Column(name = "TITLE", unique = true)
	private String title;
	
	@Column(name = "NAME")
	private String name;

	@Column(name = "DATE")
	private String date;

	@Column(name = "META_KEYWORD", length = 500)
	private String metaKeyword;

	@Column(name = "META_DESCRIPTION", length = 500)
	private String metaDescription;

	@Column(name = "VIDEO_LOCATION")
	private String videoLocation;

	@Column(name = "VIDEO_TYPE")
	private String videoType;

	@Column(name = "IS_PRIME")
	private Boolean isPrime;


	public String getVideoId() {
		return videoId;
	}

	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getMetaKeyword() {
		return metaKeyword;
	}

	public void setMetaKeyword(String metaKeyword) {
		this.metaKeyword = metaKeyword;
	}

	public String getMetaDescription() {
		return metaDescription;
	}

	public void setMetaDescription(String metaDescription) {
		this.metaDescription = metaDescription;
	}

	public String getVideoType() {
		return videoType;
	}

	public void setVideoType(String videoType) {
		this.videoType = videoType;
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

	@ManyToMany(targetEntity = Course.class, fetch = FetchType.EAGER)
	@JoinTable(name = "COURSE_VIDEO", joinColumns = { @JoinColumn(name = "VIDEO_ID") }, inverseJoinColumns = {
			@JoinColumn(name = "COURSE_ID") })
	private Set<Course> courses = new HashSet<>();

	public Boolean getIsPrime() {

		if (this.isPrime == null || this.isPrime == false) {
			return false;
		}
		return isPrime;
	}

	public void setIsPrime(Boolean isPrime) {
		this.isPrime = isPrime;
	}

	public Set<Course> getCourses() {
		return courses;
	}

	public void setCourses(Set<Course> courses) {
		this.courses = courses;
	}

	public Set<Subject> getSubjects() {
		return subjects;
	}

	public void setSubjects(Set<Subject> subjects) {
		this.subjects = subjects;
	}

	@ManyToMany(targetEntity = Subject.class, fetch = FetchType.EAGER)
	@JoinTable(name = "SUBJECT_VIDEO", joinColumns = { @JoinColumn(name = "VIDEO_ID") }, inverseJoinColumns = {
			@JoinColumn(name = "SUBJECT_ID") })
	private Set<Subject> subjects = new HashSet<>();

	@Column(name = "STATUS")
	// DRAFT - PULISHED
	private String status;

	@Transient
	private String button;

	@Embedded
	private ByAndTimeStamp byAndTimeStamp;

	@Transient
	public String getButton() {
		return button;
	}

	@Transient
	public void setButton(String button) {
		this.button = button;
	}
	
	public String getVideoLocation() {
		return videoLocation;
	}

	public void setVideoLocation(String videoLocation) {
		this.videoLocation = videoLocation;
	}


	public JSONObject toJSON() {
		JSONObject object = new JSONObject();
		object.put("VideoId", this.getVideoId());
		object.put("url", this.getUrl());
		object.put("videoLocation", this.getVideoLocation());
		object.put("name", this.getName());
		object.put("status", this.getStatus());

		String courseStr = "";
		String courseIds = ""; 
		for(Course course : this.getCourses()){
			courseStr = courseStr + " " + course.getName();
			courseIds = courseIds + "," + course.getCourseId();
		}
		
		
		String subjectStr = "";
		String subjectIds = "";
		for (Subject subject : this.getSubjects()) {
			subjectStr = subjectStr + "," + subject.getName();
			subjectIds = subjectIds + "," + subject.getSubjectId();
		}
		
		object.put("subjects", subjectStr);
		object.put("subjectIds", subjectIds);
		object.put("courses", courseStr);
		object.put("courseIds", courseIds);
		
		object.put("button", this.getButton());
		if (this.isPrime == null || this.isPrime == false) {
			object.put("isPrime", "PUBLIC");
		} else {
			object.put("isPrime", "PRIME");
		}
		
		object.put("action",
				"<div class=''><div class=''>"
						+ "<a class='btn btn-primary btn pull-left' data-toggle='modal' href='#searchModal' style='color: white; padding: 0px 6px;' "
						+ "onclick=\"loadVideoDetail('"+this.getVideoId()+"')\" title='Update Test Details'>Update</a></div></div>");

		return object;
	}

}
