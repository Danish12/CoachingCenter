package com.fagnum.services.model;

import java.util.HashSet;
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
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.json.JSONObject;

@Entity
@Table(name = "QUESTION")
public class Question {

	@Id
	@Column(name = "QUESTION_ID")
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	private String questionId;

	@Lob
	@Column(name = "DESCRIPTION")
	private String description;

	@Column(name = "IMAGE_URL")
	private String imageUrl;
	
	@Lob
	String solutionDetail;


	@ManyToMany(targetEntity = Answer.class, cascade = { CascadeType.ALL }, fetch = FetchType.EAGER)
	@JoinTable(name = "QUESTION_ANSWER", joinColumns = { @JoinColumn(name = "QUESTION_ID") }, inverseJoinColumns = {
			@JoinColumn(name = "SUBJECT_ID") })
	private Set<Answer> answers = new HashSet<>();

	@Embedded
	private ByAndTimeStamp byAndTimeStamp;

	public String getQuestionId() {
		return questionId;
	}

	public void setQuestionId(String questionId) {
		this.questionId = questionId;
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

	public Set<Answer> getAnswers() {
		return answers;
	}

	public void setAnswers(Set<Answer> answers) {
		this.answers = answers;
	}

	public ByAndTimeStamp getByAndTimeStamp() {
		return byAndTimeStamp;
	}

	public void setByAndTimeStamp(ByAndTimeStamp byAndTimeStamp) {
		this.byAndTimeStamp = byAndTimeStamp;
	}
	
	public String getSolutionDetail() {
		return solutionDetail;
	}

	public void setSolutionDetail(String solutionDetail) {
		this.solutionDetail = solutionDetail;
	}
	
	public JSONObject toJSON(String testId) {
		JSONObject object = new JSONObject();
		object.put("QuestionId", this.getQuestionId());

		object.put("description", this.getDescription());

		object.put("imageUrl", this.getImageUrl());

		object.put("action",
				"<div class=''><div class=''>"
						+ "<a class='btn btn-primary btn pull-left' data-toggle='modal' href='addUpdateQuestion?QuestionId="
						+ this.getQuestionId() + "&onlineTestId=" + testId
						+ "' style='color: white; padding: 0px 6px;' " + " title='Update Question Details'>Update</a>"
						+ "<a class='btn btn-primary btn pull-left' data-toggle='modal' href='deleteQuestion?QuestionId="
						+ this.getQuestionId()
						+ "' style='color: white; padding: 0px 6px;margin-left: 1%;'  title='Delete Question'"
						+ ">Delete</a></div></div>");

		return object;
	}
}
