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
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;
import org.json.JSONObject;

@Entity
@Table(name = "BLOG")
public class Blog {

	@Id
	@Column(name = "BLOG_ID")
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	private String blogId;

	@Column(name = "URL", unique = true)
	private String url;

	@Column(name = "TITLE", unique = true)
	private String title;
	
	@Column(name = "DATE")
	private String date;
	
	@Column(name = "META_KEYWORD", length = 500)
	private String metaKeyword;
	
	@Column(name = "META_DESCRIPTION", length = 500)
	private String metaDescription;
	
	@Column(name = "BLOG_IMAGE")
	private String blogImage;
	
	@Column(name = "BLOG_IMAGE_NAME")
	private String blogImageName;
	
	@Column(name = "BLOGGER_URL")
	private String bloggerUrl;
	
	@Column(name = "PAYMENT_STATUS")
	private String paymentStatus;
	
	@Column(name = "BLOG_TYPE")
	private String blogType;
	
	@Column(name = "VIEWS")
	private int views;
	
	@Column(name = "GENRE")
	private String genre;
	
	@Column(name = "FRESH")
	private String fresh;
	
	@Column(name = "IS_PRIME")
	private Boolean isPrime;
	
	@ManyToMany(targetEntity = Course.class, fetch=FetchType.EAGER)
	@JoinTable(
	        name = "COURSE_BLOG", 
	        joinColumns = { @JoinColumn(name = "BLOG_ID") }, 
	        inverseJoinColumns = { @JoinColumn(name = "COURSE_ID") }
	    )
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

	@ManyToMany(targetEntity = Subject.class,  fetch=FetchType.EAGER)
	@JoinTable(
	        name = "SUBJECT_BLOG", 
	        joinColumns = { @JoinColumn(name = "blog_id") }, 
	        inverseJoinColumns = { @JoinColumn(name = "subject_id") }
	    )
	private Set<Subject> subjects = new HashSet<>();
	
	@Lob
	@Column(name = "CONTENT")
	private String content;
	
	@Column(name = "STATUS")
	// DRAFT - PULISHED
	private String status;
	
	@Transient
	private String button;
	
	@Embedded
	private ByAndTimeStamp byAndTimeStamp;
	
	@ManyToOne
	@JoinColumn(name = "BLOGGER_ID")
	private Blogger blogger;
	
	@Transient
	public String getButton() {
		return button;
	}

	@Transient
	public void setButton(String button) {
		this.button = button;
	}

	public String getMetaDescription() {
		return metaDescription;
	}

	public void setMetaDescription(String metaDescription) {
		this.metaDescription = metaDescription;
	}

	public String getBlogId() {
		return blogId;
	}

	public void setBlogId(String blogId) {
		this.blogId = blogId;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMetaKeyword() {
		return metaKeyword;
	}

	public void setMetaKeyword(String metaKeyword) {
		this.metaKeyword = metaKeyword;
	}

	public ByAndTimeStamp getByAndTimeStamp() {
		return byAndTimeStamp;
	}

	public void setByAndTimeStamp(ByAndTimeStamp byAndTimeStamp) {
		this.byAndTimeStamp = byAndTimeStamp;
	}

	public String getBlogImage() {
		return blogImage;
	}

	public void setBlogImage(String blogImage) {
		this.blogImage = blogImage;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getBlogImageName() {
		return blogImageName;
	}

	public void setBlogImageName(String blogImageName) {
		this.blogImageName = blogImageName;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public String getBlogType() {
		return blogType;
	}

	public void setBlogType(String blogType) {
		this.blogType = blogType;
	}

	public Blogger getBlogger() {
		return blogger;
	}

	public void setBlogger(Blogger blogger) {
		this.blogger = blogger;
	}

	public String getBloggerUrl() {
		return bloggerUrl;
	}

	public void setBloggerUrl(String bloggerUrl) {
		this.bloggerUrl = bloggerUrl;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getFresh() {
		return fresh;
	}

	public void setFresh(String fresh) {
		this.fresh = fresh;
	}

	@Override
	public String toString() {
		return "Blog [blogId=" + blogId + ", url=" + url + ", title=" + title + ", content=" + content + "]";
	}
	
	public JSONObject toJSON(){
		JSONObject object = new JSONObject();
		object.put("blogId", this.getBlogId());
		object.put("url", this.getUrl());
		object.put("title", this.getTitle());
		object.put("status", this.getStatus());
		
		String courseStr = ""; 
		for(Course course : this.getCourses()){
			courseStr = courseStr + " " + course.getName();
		}
		object.put("courses", courseStr);
		
		String subjectStr = ""; 
		for(Subject subject : this.getSubjects()){
			subjectStr = subjectStr + " " + subject.getName();
		}
		object.put("subjects", subjectStr);
		object.put("button", this.getButton());
		if(this.isPrime == null || this.isPrime == false){
			object.put("isPrime", "PUBLIC");
		}else{
			object.put("isPrime", "PRIME");
		}
		
		
		return object;
	}

}
