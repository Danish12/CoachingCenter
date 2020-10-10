package com.fagnum.controller;

import java.security.Principal;
import java.sql.Timestamp;
import java.util.Date;
import java.util.ResourceBundle;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fagnum.services.model.ByAndTimeStamp;
import com.fagnum.services.model.Course;
import com.fagnum.services.model.OnlineTest;
import com.fagnum.services.model.Subject;
import com.fagnum.services.service.AnswerService;
import com.fagnum.services.service.OnlineTestService;
import com.fagnum.services.service.QuestionService;

@Controller
public class QuestionController extends BaseAppController {

	OnlineTestService onlineTestService = AppController.getOnlineTestService();
	QuestionService questionService = AppController.getQuestionService();
	AnswerService answerService = AppController.getAnswerService();


	/*************************
	 * Blog for user reading starts
	 ***********************************/

	@RequestMapping("/questionListHomePage")
	public String questionListHomePage(HttpServletRequest request) {
		String onlineTestId = request.getParameter("onlineTestId");
		request.setAttribute("onlineTestId", onlineTestId);
		OnlineTest onlineTest = onlineTestService.read(OnlineTest.class, onlineTestId);
		request.setAttribute("onlineTest", onlineTest);
		return "masterCrudQuestion";
	}

	/*************************
	 * Online Test Crud Starts
	 ********************************************/
	
	@RequestMapping("/addUpdateQuestion")
	public String addUpdateQuestion(HttpServletRequest request,  Principal principal) {
		
		JSONObject jsonObject = new JSONObject();

		String name = request.getParameter("name");
		String instruction = request.getParameter("instruction");
		String isPrime = request.getParameter("isPrime");
		String status = request.getParameter("status");
		String onlineTestId = request.getParameter("OnlineTestId");
		String[] courses = request.getParameterValues("courses[]");
		String[] subjects = request.getParameterValues("subjects[]");
		String action = request.getParameter("action");


		OnlineTest onlineTest = new OnlineTest();
		if (onlineTestId != null && !onlineTestId.equals("")) {
			onlineTest = onlineTestService.read(OnlineTest.class, onlineTestId);
			onlineTest.getQuestions();
		}
		
		
		try {
			ByAndTimeStamp byAndTimeStamp = new ByAndTimeStamp();
			if (action.equals("ADD")) {
				byAndTimeStamp.setCreatedBy("");
				byAndTimeStamp.setCreatedTs(new Timestamp(new Date().getTime()));
				byAndTimeStamp.setModifiedBy("");
				byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));
				onlineTest.setByAndTimeStamp(byAndTimeStamp);
				onlineTestService.save(onlineTest);
			} else {
				byAndTimeStamp = onlineTest.getByAndTimeStamp();
				byAndTimeStamp.setModifiedBy(principal.getName());
				byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));
				onlineTest.setByAndTimeStamp(byAndTimeStamp);
				onlineTestService.update(onlineTest);
			}
			jsonObject.put("Record", onlineTest);
			jsonObject.put("Result", "OK");
		} catch (Exception e) {
			jsonObject.put("Result", "Error");
			jsonObject.put("Message", "Unable to add Course please try again." + e.getMessage());
		}

			
		return "questionAddEdit";
		
	}
	

	@RequestMapping(value = "/listQuestions", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String listOnlineTest(HttpServletRequest request) {
		ResourceBundle resource = ResourceBundle.getBundle("application");
		JSONObject jsonObject = new JSONObject();
		//questionService.
	//	jsonObject.put("Records", jsonArray);
		jsonObject.put("Result", "OK");
		jsonObject.put("TotalRecordCount", onlineTestService.getTableRowCount(OnlineTest.class));
		return jsonObject.toString();
	}
	
	/*************************
	 * Online Test Crud Ends
	 ***********************************/


}
