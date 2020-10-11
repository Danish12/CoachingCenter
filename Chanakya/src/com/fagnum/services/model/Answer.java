package com.fagnum.services.model;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "ANSWER")
public class Answer {

	public Answer(String description, int optionNumber) {
		this.description = description;
		this.optionNumber = optionNumber;
	}
	
	public Answer() {
	}

	@Id
	@Column(name = "ANSWER_ID")
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	private String answerId;

	@Column(name = "DESCRIPTION")
	private String description;

	@Column(name = "optionNumber")
	private int optionNumber;

	@Column(name = "IMAGE_URL")
	String imageUrl;

	@Embedded
	private ByAndTimeStamp byAndTimeStamp;

	public ByAndTimeStamp getByAndTimeStamp() {
		return byAndTimeStamp;
	}

	public void setByAndTimeStamp(ByAndTimeStamp byAndTimeStamp) {
		this.byAndTimeStamp = byAndTimeStamp;
	}

	public String getAnswerId() {
		return answerId;
	}

	public void setAnswerId(String answerId) {
		this.answerId = answerId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public int getOptionNumber() {
		return optionNumber;
	}

	public void setOptionNumber(int optionNumber) {
		this.optionNumber = optionNumber;
	}

}
