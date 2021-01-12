package com.fagnum.services.model;

import java.sql.Date;
import java.util.Set;

public class OnlineTestUserResponse {

    public OnlineTestUserResponse(String questionId, boolean isCorrect, String optionChoosen, Set<Subject> subjects, Date date) {
        this.questionId = questionId;
        this.isCorrect = isCorrect;
        this.optionChoosen = optionChoosen;
        this.date = date;
    }

    Date date;
    String questionId;
    boolean isCorrect;
    String optionChoosen;
    Set<Subject> subject;
    
    public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Set<Subject> getSubject() {
        return subject;
    }

    public void setSubject(Set<Subject> subject) {
        this.subject = subject;
    }

    public String getQuestionId() {
        return questionId;
    }

    public void setQuestionId(String questionId) {
        this.questionId = questionId;
    }

    public boolean isCorrect() {
        return isCorrect;
    }

    public void setCorrect(boolean correct) {
        isCorrect = correct;
    }

    public String getOptionChoosen() {
        return optionChoosen;
    }

    public void setOptionChoosen(String optionChoosen) {
        this.optionChoosen = optionChoosen;
    }
    

    @Override
	public String toString() {
		return "OnlineTestUserResponse [date=" + date + ", questionId=" + questionId + ", isCorrect=" + isCorrect
				+ ", optionChoosen=" + optionChoosen + ", subject=" + subject + "]";
	}

}
