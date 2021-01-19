package com.fagnum.controller;

import java.security.Principal;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fagnum.services.model.Answer;
import com.fagnum.services.model.ByAndTimeStamp;
import com.fagnum.services.model.OnlineTest;
import com.fagnum.services.model.Question;
import com.fagnum.services.model.Subject;
import com.fagnum.services.service.AnswerService;
import com.fagnum.services.service.OnlineTestService;
import com.fagnum.services.service.QuestionService;
import com.fagnum.services.service.SubjectService;

@Controller
public class QuestionController extends BaseAppController {

	OnlineTestService onlineTestService = AppController.getOnlineTestService();
	QuestionService questionService = AppController.getQuestionService();
	AnswerService answerService = AppController.getAnswerService();
	SubjectService subjectService = AppController.getSubjectService();

	@RequestMapping("/questionListHomePage")
	public String questionListHomePage(HttpServletRequest request) {
		String onlineTestId = request.getParameter("onlineTestId");
		request.setAttribute("onlineTestId", onlineTestId);
		OnlineTest onlineTest = onlineTestService.read(OnlineTest.class, onlineTestId);
		request.setAttribute("onlineTest", onlineTest);
		return "/crud/masterCrudQuestion";
	}

	@RequestMapping(value = "/saveQuestion" , method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String saveQuestion(HttpServletRequest request, Principal principal) {
		
		JSONObject jsonObject = new JSONObject();

		String action = request.getParameter("action");
		String questionId = request.getParameter("id");
		String questionContent = request.getParameter("questionContent");
		String solutionContent = request.getParameter("solutionContent");
		String option1Content = request.getParameter("option1Content");
		String option2Content = request.getParameter("option2Content");
		String option3Content = request.getParameter("option3Content");
		String option4Content = request.getParameter("option4Content");
		String correctOption = request.getParameter("correctOption");
		String onlineTestId = request.getParameter("onlineTestId");
		String subjectStr[] = request.getParameterValues("subjectIds[]");

		Set<Subject> subjects = new java.util.HashSet<>();
		for (String subj : subjectStr) {
			subjects.add(subjectService.read(Subject.class, subj));
		}

		OnlineTest onlineTest = onlineTestService.read(OnlineTest.class, onlineTestId);

		Set<Answer> answers = new HashSet<Answer>();

		Question question = new Question();
		if (questionId != null && !questionId.equals("")) {
			question = questionService.read(Question.class, questionId);
			for (Answer answer : question.getAnswers()) {
				if (answer.getOptionNumber() == 1) {
					answer.setDescription(option1Content);
				} else if (answer.getOptionNumber() == 2) {
					answer.setDescription(option2Content);
				} else if (answer.getOptionNumber() == 3) {
					answer.setDescription(option3Content);
				} else if (answer.getOptionNumber() == 4) {
					answer.setDescription(option4Content);
				}
			}
			//answers.removeAll(c)
		} else {
			answers.add(new Answer(option1Content, 1));
			answers.add(new Answer(option2Content, 2));
			answers.add(new Answer(option3Content, 3));
			answers.add(new Answer(option4Content, 4));
			question.setAnswers(answers);
		}

		
		question.setDescription(questionContent);
		question.setCorrectAnswer(correctOption);
		question.setSolutionDetail(solutionContent);
		question.setSubjects(subjects);

		try {
			ByAndTimeStamp byAndTimeStamp = new ByAndTimeStamp();
			if (action.equals("ADD")) {
				byAndTimeStamp.setCreatedBy(principal.getName());
				byAndTimeStamp.setCreatedTs(new Timestamp(new Date().getTime()));
				byAndTimeStamp.setModifiedBy(principal.getName());
				byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));
				question.setByAndTimeStamp(byAndTimeStamp);
				questionService.save(question);
				onlineTest.getQuestions().add(question);
				onlineTestService.update(onlineTest);
			} else {
				byAndTimeStamp = question.getByAndTimeStamp();
				byAndTimeStamp.setModifiedBy(principal.getName());
				byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));
				question.setByAndTimeStamp(byAndTimeStamp);
				questionService.update(question);
			}
			jsonObject.put("Record", question);
			jsonObject.put("Result", "OK");

		} catch (Exception e) {
			jsonObject.put("Result", "Error");
			jsonObject.put("Message", "Unable to add Question please try again." + e.getMessage());
		}
		
		return jsonObject.toString();
	}

	@RequestMapping("/addUpdateQuestion")
	public String addUpdateQuestion(HttpServletRequest request, Principal principal) {
		
		String onlineTestId = request.getParameter("onlineTestId");
		request.setAttribute("onlineTestId", onlineTestId);
		OnlineTest onlineTest = onlineTestService.read(OnlineTest.class, onlineTestId);
		request.setAttribute("onlineTest", onlineTest);
		String questionId = request.getParameter("questionId");
		request.setAttribute("status", "ADD");
		
		request.setAttribute("subjects", onlineTest.getSubjects());
		
		if(null != questionId || "".equals(questionId)){
			Question question = questionService.read(Question.class, questionId);
			request.setAttribute("questionId", questionId);
			request.setAttribute("question", question);
			
			request.setAttribute("status", "Update");
		}else{
			request.setAttribute("questionId", questionId);
			request.setAttribute("question", new Question());
			
			request.setAttribute("status", "ADD");
		}
		
		
		return "questionAddEdit";

	}

	@RequestMapping(value = "/listQuestions", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String listOnlineTest(HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		
		String onlineTestId= request.getParameter("onlineTestId");
		OnlineTest onlineTest = onlineTestService.read(OnlineTest.class, onlineTestId);
		
		for(Question question : onlineTest.getSortedQuestions()){
			jsonArray.put(question.toJSON(onlineTestId));
		}
		
		jsonObject.put("Records", jsonArray);

		jsonObject.put("Result", "OK");
		jsonObject.put("TotalRecordCount", onlineTest.getSortedQuestions().size());
		return jsonObject.toString();
	}

}
