package com.fagnum.controller;

import java.security.Principal;
import java.sql.Timestamp;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import com.fagnum.services.model.*;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fagnum.services.service.CourseService;
import com.fagnum.services.service.OnlineTestService;
import com.fagnum.services.service.SubjectService;

@Controller
public class OnlineTestController extends BaseAppController {

	CourseService courseService = AppController.getCourseService();
	SubjectService subjectService = AppController.getSubjectService();
	OnlineTestService onlineTestService = AppController.getOnlineTestService();

	@RequestMapping("/testList")
	public String testList(HttpServletRequest request) {
		request.setAttribute("courses", courseService.getAllList(Course.class));
		request.setAttribute("subjects", subjectService.getAllList(Subject.class));
		return "masterCrudOnlineTest";
	}

	@RequestMapping("/online-test")
	public String onlineTest(HttpServletRequest request) {

		//request.setAttribute("videos", videoService.getAllList(Video.class));
		request.setAttribute("courses", courseService.getAllList(Course.class));

		return "onlineTestDetails";
	}

	@RequestMapping(value = "/online-test-submit", method =  RequestMethod.POST)
	public String submitOnlineTest( HttpServletRequest request) {

		String testId = request.getParameter("testId");
		OnlineTest onlineTest = onlineTestService.read(OnlineTest.class, testId);
		if (null == onlineTest) {
			return "errorPage";
		}
		Set<Question> questions = onlineTest.getQuestions();
		int correctCount = 0;
		List<OnlineTestUserResponse> onlineTestUserResponses = new ArrayList<OnlineTestUserResponse>();
		for(Question question : questions){
			String response = request.getParameter(question.getQuestionId());
			boolean isCorrect = false;
			if(null != response && response.equals(question.getCorrectAnswer())){
				isCorrect = true;
				correctCount++;
			}
			onlineTestUserResponses.add(new OnlineTestUserResponse(question.getQuestionId(), isCorrect, response, question.getSubjects()));
		}
		request.setAttribute("onlineTest", onlineTest);

		request.setAttribute("correctCount", correctCount);
		request.setAttribute("onlineTestUserResponses", onlineTestUserResponses);

		return "onlineTestResults";
	}


	@RequestMapping("/online-test/{courseName}")
	public String listOnlineTestCourse(@PathVariable("courseName") String courseName, HttpServletRequest request) {

		Course course = courseService.findCourse(courseName);
		if (null == course) {
			return "errorPage";
		}

		request.setAttribute("onlineTests", onlineTestService.findByCourse(course.getCourseId(), "0", "10"));
		request.setAttribute("course", course);

		return "onlineTestDetails";
	}

	@RequestMapping("/online-test/{courseName}/{subjectName}")
	public String listOnlineTestCourseSubject(@PathVariable("courseName") String courseName,
										   @PathVariable("subjectName") String subjectName, HttpServletRequest request) {

		Course course = courseService.findCourse(courseName);
		if (null == course) {
			return "errorPage";
		}

		Subject subject = subjectService.findSubject(subjectName);

		request.setAttribute("onlineTests",
				onlineTestService.findByCourseAndSubject(course.getCourseId(), subject.getSubjectId(), "0", "10"));
		request.setAttribute("course", course);

		return "onlineTestDetails";
	}

	@RequestMapping("/online-test-details/{testId}")
	public String loadOnlineTestDetails(@PathVariable("testId") String testId, HttpServletRequest request) {

		OnlineTest onlineTest = onlineTestService.read(OnlineTest.class, testId);
		if (null == onlineTest) {
			return "errorPage";
		}
		request.setAttribute("onlineTest", onlineTest);

		return "listOnlineTestQuestions";
	}


	/*************************
	 * Online Test Crud Starts
	 ********************************************/
	
	@RequestMapping(value = "/addUpdateOnlineTest")
	public @ResponseBody String addOnlineTest(HttpServletRequest request,  Principal principal) {
		
		JSONObject jsonObject = new JSONObject();

		String name = request.getParameter("name");
		String instruction = request.getParameter("instruction");
		String isPrime = request.getParameter("isPrime");
		String status = request.getParameter("status");
		String seconds = request.getParameter("second");
		String onlineTestId = request.getParameter("OnlineTestId");
		String[] courses = request.getParameterValues("courses[]");
		String[] subjects = request.getParameterValues("subjects[]");
		String action = request.getParameter("action");


		OnlineTest onlineTest = new OnlineTest();
		if (onlineTestId != null && !onlineTestId.equals("")) {
			onlineTest = onlineTestService.read(OnlineTest.class, onlineTestId);
			onlineTest.getQuestions();
		}
		
		onlineTest.setIsPrime(Boolean.valueOf(isPrime));
		onlineTest.setStatus(status);
		onlineTest.setName(name);
		onlineTest.setSecond(Integer.parseInt(seconds)*60);
		onlineTest.setInstruction(instruction);
		
		if (null != courses) {
			Set<Course> coursesSet = new java.util.HashSet<>();
			for (String course : courses) {
				coursesSet.add(courseService.read(Course.class, course));
			}
			onlineTest.setCourses(coursesSet);
		}

		if (null != subjects) {
			Set<Subject> subjectsSet = new java.util.HashSet<>();
			for (String subject : subjects) {
				subjectsSet.add(subjectService.read(Subject.class, subject));
			}
			onlineTest.setSubjects(subjectsSet);
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

			
		return jsonObject.toString();
		
	}
	

	@RequestMapping(value = "/listOnlineTest", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String listOnlineTest(HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		String startIndex = request.getParameter("jtStartIndex");
		String pageSize = request.getParameter("jtPageSize");

		List<Object> parameterList = new ArrayList<Object>();
		parameterList.add("ACTIVE");
		parameterList.add("DEACTIVE");

		String query = "from OnlineTest ot where ot.status = ? or ot.status = ? order by ot.onlineTestId desc";
		List<OnlineTest> list =  onlineTestService.getDynamicList(parameterList, query, startIndex, pageSize);

		for (OnlineTest onlineTest : list) {
			jsonArray.put(onlineTest.toJSON());
		}
		jsonObject.put("Records", jsonArray);
		jsonObject.put("Result", "OK");
		jsonObject.put("TotalRecordCount", onlineTestService.getTableRowCount(OnlineTest.class));
		return jsonObject.toString();
	}
	
	@RequestMapping(value = "/loadOnlineTestDetails")
	public @ResponseBody String loadOnlineTestDetails(HttpServletRequest request) {

		String onlineTestId = request.getParameter("onlineTestId");
		OnlineTest onlineTest = onlineTestService.read(OnlineTest.class, onlineTestId);
		return onlineTest.toJSON().toString();
	}
	
	@RequestMapping(value = "/publishTest", method = RequestMethod.GET)
	public String publishBlog(Model model, Map<String, Object> map, HttpServletRequest request, Principal principal) {

		return "blogList";
	}
	/*************************
	 * Online Test Crud END
	 ********************************************/

}
