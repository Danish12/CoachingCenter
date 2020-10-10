package com.fagnum.services.model;

import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
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

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "COURSE")
public class Course {

	@Id
	@Column(name = "COURSE_ID")
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	private String courseId;

	@Column(name = "NAME", unique = true)
	private String name;

	@Column(name = "STATUS")
	private String status;
	
	@Column(name = "PRICE")
	private String price;
	
	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	@ManyToMany(targetEntity = Subject.class, cascade = { CascadeType.ALL }, fetch=FetchType.EAGER)
	@JoinTable(
	        name = "COURSE_SUBJECT", 
	        joinColumns = { @JoinColumn(name = "course_id") }, 
	        inverseJoinColumns = { @JoinColumn(name = "subject_id") }
	    )
	private Set<Subject> subjects = new HashSet<>();
	public Set<Subject> getSubjects() {
		return subjects;
	}
	
	public List<Subject> getSortedSubjects() {
		List<Subject> subList = new LinkedList<Subject>(subjects);
		class SubjectComparator implements Comparator<Subject> {

			public int compare(Subject e1, Subject e2) {
				return e1.getName().compareTo(e2.getName());
			}

		}

		Collections.sort(subList, new SubjectComparator());
		return subList;
	}
	
	public void setSubjects(Set<Subject> subjects) {
		this.subjects = subjects;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Embedded
	private ByAndTimeStamp byAndTimeStamp;

	public String getCourseId() {
		return courseId;
	}

	public void setCourseId(String courseId) {
		this.courseId = courseId;
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

	@Override
	public String toString() {
		return "\"" + courseId + "\"";
	}

}
