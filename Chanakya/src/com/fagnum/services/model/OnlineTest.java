package com.fagnum.services.model;

import java.util.*;

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
import org.json.JSONException;
import org.json.JSONObject;

@Entity
@Table(name = "ONLINE_TEST")
public class OnlineTest {

	@Id
	@Column(name = "TEST_ID")
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	private String onlineTestId;

	@Column(name = "NAME")
	private String name;

	@Column(name = "INSTRUCTION")
	private String instruction;

	@ManyToMany(targetEntity = Course.class, fetch = FetchType.EAGER)
	@JoinTable(name = "TEST_COURSE", joinColumns = { @JoinColumn(name = "TEST_ID") }, inverseJoinColumns = {
			@JoinColumn(name = "COURSE_ID") })
	private Set<Course> courses = new HashSet<>();

	@Column(name = "IS_PRIME")
	Boolean isPrime;

	@Column(name = "SECOND")
	Integer second;

	@Column(name = "STATUS")
	private String status;

	@ManyToMany(targetEntity = Subject.class, fetch = FetchType.EAGER)
	@JoinTable(name = "TEST_SUBJECT", joinColumns = { @JoinColumn(name = "TEST_ID") }, inverseJoinColumns = {
			@JoinColumn(name = "SUBJECT_ID") })
	private Set<Subject> subjects = new HashSet<>();

	@ManyToMany(targetEntity = Question.class, fetch = FetchType.EAGER)
	@JoinTable(name = "TEST_QUESTION", joinColumns = { @JoinColumn(name = "TEST_ID") }, inverseJoinColumns = {
			@JoinColumn(name = "QUESTION_ID") })
	private Set<Question> questions = new HashSet<>();
	
	@Embedded
	private ByAndTimeStamp byAndTimeStamp;

	public ByAndTimeStamp getByAndTimeStamp() {
		return byAndTimeStamp;
	}

	public void setByAndTimeStamp(ByAndTimeStamp byAndTimeStamp) {
		this.byAndTimeStamp = byAndTimeStamp;
	}

	public Boolean getIsPrime() {

		if (this.isPrime == null || this.isPrime == false) {
			return false;
		}
		return isPrime;
	}

	public String getOnlineTestId() {
		return onlineTestId;
	}

	public void setOnlineTestId(String onlineTestId) {
		this.onlineTestId = onlineTestId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getInstruction() {
		return instruction;
	}

	public void setInstruction(String instruction) {
		this.instruction = instruction;
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

	public Set<Question> getQuestions() {
		return questions;
	}

	public List<Question> getSortedQuestions() {
		List<Question> listQuestions = new ArrayList<>();
		listQuestions.addAll(this.questions);

		Collections.sort(listQuestions, new Comparator<Question>() {
			@Override
			public int compare(Question question, Question question2) {
				return question2.getByAndTimeStamp().getCreatedTs().compareTo(question.getByAndTimeStamp().getCreatedTs());
			}
		});

		return listQuestions;
	}

	public void setQuestions(Set<Question> questions) {
		this.questions = questions;
	}

	public void setIsPrime(Boolean isPrime) {
		this.isPrime = isPrime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Map<String, Question> getQuestionMap(){
		Map<String, Question> questionsMap = new HashMap<>();
 		for(Question question : this.getQuestions()){
			questionsMap.put(question.getQuestionId(), question);
		}
 		return questionsMap;
	}

	public Boolean getPrime() {
		return isPrime;
	}

	public void setPrime(Boolean prime) {
		isPrime = prime;
	}

	public Integer getSecond() {
		return second;
	}

	public void setSecond(Integer second) {
		this.second = second;
	}

	public JSONObject toJSON() throws JSONException {
		JSONObject object = new JSONObject();
		object.put("OnlineTestId", this.getOnlineTestId());
		object.put("instructions", this.getInstruction());
		object.put("status", this.getStatus());
		object.put("name", this.getName());
		object.put("isPrime", this.isPrime);
		object.put("second", this.second/60);
		
		String courseStr = "";
		String courseIds = ""; 
		for(Course course : this.getCourses()){
			courseStr = courseStr + " " + course.getName();
			courseIds = courseIds + "," + course.getCourseId();
		}
		object.put("courses", courseStr);
		
		String subjectStr = "";
		String subjectIds = "";
		for (Subject subject : this.getSubjects()) {
			subjectStr = subjectStr + "," + subject.getName();
			subjectIds = subjectIds + "," + subject.getSubjectId();
		}
		
		object.put("action",
				"<div class=''><div class=''>"
						+ "<a class='btn btn-primary btn pull-left' data-toggle='modal' href='#searchModal' style='color: white; padding: 0px 6px;' "
						+ "onclick=\"loadOnlineTestDetail('"+this.getOnlineTestId()+"')\" title='Update Test Details'>Update</a>"
						+ "<a class='btn btn-primary btn pull-left' data-toggle='modal' href='questionListHomePage?onlineTestId="+this.getOnlineTestId()
						+"' style='color: white; padding: 0px 6px;margin-left: 1%;'  title='Add Update Questions to test.'" + ">Add Question</a></div></div>");
		
		object.put("subjects", subjectStr);
		object.put("subjectIds", subjectIds);
		
		object.put("courseIds", courseIds);
		
		if(this.isPrime == null || this.isPrime == false){
			object.put("isPrime", "PUBLIC");
		}else{
			object.put("isPrime", "PRIME");
		}

		return object;
	}

}
