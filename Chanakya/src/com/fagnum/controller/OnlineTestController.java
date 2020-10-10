package com.fagnum.controller;

import java.security.Principal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fagnum.services.model.ByAndTimeStamp;
import com.fagnum.services.model.Category;
import com.fagnum.services.model.Course;
import com.fagnum.services.model.OnlineTest;
import com.fagnum.services.model.Subject;
import com.fagnum.services.service.CategoryService;
import com.fagnum.services.service.CourseService;
import com.fagnum.services.service.OnlineTestService;
import com.fagnum.services.service.SubjectService;

@Controller
public class OnlineTestController extends BaseAppController {

	CategoryService categoryService = AppController.getCategoryService();
	CourseService courseService = AppController.getCourseService();
	SubjectService subjectService = AppController.getSubjectService();
	OnlineTestService onlineTestService = AppController.getOnlineTestService();

	List<Category> categoryList = categoryService.getAllList(Category.class);

	/*************************
	 * Blog for user reading starts
	 ***********************************/

	@RequestMapping("/testList")
	public String testList(HttpServletRequest request) {
		request.setAttribute("courses", courseService.getAllList(Course.class));
		request.setAttribute("subjects", subjectService.getAllList(Subject.class));
		return "masterCrudOnlineTest";
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

		//boolean isSearch = ServletRequestUtils.getBooleanParameter(request, "search", false);
		List<OnlineTest> list = null;

		String query = "";

		query = new String("from OnlineTest ot where ot.status = ? or ot.status = ? order by ot.onlineTestId desc");
		list = onlineTestService.getDynamicList(parameterList, query, startIndex, pageSize);

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
		/*String blogId = request.getParameter("id");
		Blog blog = blogService.read(Blog.class, blogId);
		blog.setDate(DateAndTimeFormat.clientDate(new java.sql.Date(new Date().getTime())));
		ByAndTimeStamp byAndTimeStamp = blog.getByAndTimeStamp();
		byAndTimeStamp.setCreatedBy(principal.getName());
		byAndTimeStamp.setCreatedTs(new Timestamp(new Date().getTime()));
		byAndTimeStamp.setModifiedBy(principal.getName());
		byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));
		blog.setStatus(Constants._PUBLISH);
		blogService.update(blog);
		try {
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		return "blogList";
	}

	/*************************
	 * Online Test Crud Ends
	 ***********************************/


}
