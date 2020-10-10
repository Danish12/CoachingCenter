package com.fagnum.services.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "SUBJECT")
public class Subject {

	@Id
	@Column(name = "SUBJECT_ID")
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	private String subjectId;

	@Column(name = "NAME", unique = true)
	private String name;

	@Column(name = "URL")
	private String url;
	
	@ManyToMany(mappedBy = "subjects")
    private Set<Course> cources = new HashSet<>();
	
	/*@ManyToMany(mappedBy = "subjects")
    private Set<Blog> blogs = new HashSet<>();*/
	
	public Set<Course> getCources() {
		return cources;
	}

	public void setCources(Set<Course> cources) {
		this.cources = cources;
	}

	public String getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(String subjectId) {
		this.subjectId = subjectId;
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

	public ByAndTimeStamp getByAndTimeStamp() {
		return byAndTimeStamp;
	}

	public void setByAndTimeStamp(ByAndTimeStamp byAndTimeStamp) {
		this.byAndTimeStamp = byAndTimeStamp;
	}

	@Embedded
	private ByAndTimeStamp byAndTimeStamp;

	@Override
	public String toString() {
		return "\"" + subjectId + "\"";
	}

}
