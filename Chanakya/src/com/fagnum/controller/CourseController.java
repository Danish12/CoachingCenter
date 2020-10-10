package com.fagnum.controller;

import java.security.Principal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.fagnum.services.model.Blog;
import com.fagnum.services.model.ByAndTimeStamp;
import com.fagnum.services.model.Course;
import com.fagnum.services.model.Subject;
import com.fagnum.services.service.BlogService;
import com.fagnum.services.service.CourseService;
import com.fagnum.services.service.SubjectService;

@Controller
public class CourseController extends BaseAppController{

	CourseService courseService = AppController.getCourseService();
	SubjectService subjectService = AppController.getSubjectService();
	BlogService blogService = AppController.getBlogService();
	
	@RequestMapping("/course/{courseName}")
	public String getBlogPreview(@PathVariable("courseName") String courseName, HttpServletRequest request) {
		
		Course course = courseService.findCourse(courseName);
		if(null == course){
			return "errorPage";
		}
		
		List<Blog> blogs  = blogService.findByCourse(course.getCourseId(), "0", "10");

		request.setAttribute("blogs", blogs);
		request.setAttribute("course", course);

		return "courseDetails";
	}
	
	
	
	@RequestMapping("/course/{courseName}/{subjectName}")
	public String getBlogPreviewBySubjects(@PathVariable("courseName") String courseName,
			@PathVariable("subjectName") String subjectName, HttpServletRequest request) {

		Course course = courseService.findCourse(courseName);
		if (null == course) {
			return "errorPage";
		}

		Subject subject = subjectService.findSubject(subjectName);
		List<String> subjectIds = new ArrayList<>();
		subjectIds.add(subject.getSubjectId());

		List<Blog> blogs = blogService.findByCourseAndSubject(course.getCourseId(), subjectIds, "0", "10");

		request.setAttribute("blogs", blogs);
		request.setAttribute("course", course);

		return "courseDetails";
	}
	

	/******************************
	 * Course Crud Starts
	 *************************************/

	@RequestMapping("/course")
	public String masterCrudCourse(HttpServletRequest request) {

		List<Subject> subjects = subjectService.getList(Subject.class, "0", "100");
		request.setAttribute("subjects", subjects);
		return "masterCrudCourse";
	}

	@RequestMapping(value = "/listCourse")
	public @ResponseBody String listCourse(HttpServletRequest request) {
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();
		String startIndex = request.getParameter("jtStartIndex");
		String pageSize = request.getParameter("jtPageSize");

		List<Course> listCourse = courseService.getList(Course.class, startIndex, pageSize);

		for (Course Course : listCourse) {
			jsonArray.put(convertToJson(Course));
		}
		jsonObject.put("Records", jsonArray);
		jsonObject.put("Result", "OK");
		jsonObject.put("TotalRecordCount", courseService.getTableRowCount(Course.class));

		return jsonObject.toString();
	}
	
	@RequestMapping(value = "/addCourse", method = RequestMethod.POST)
	public @ResponseBody String addCourse(@ModelAttribute("addCourse") Course course, BindingResult result,
			SessionStatus status, HttpServletRequest request, Principal principal) {
		JSONObject jsonObject = new JSONObject();
		ByAndTimeStamp byAndTimeStamp = new ByAndTimeStamp();
		try {

			String subjectStr[] = request.getParameterValues("subject[]");

			Set<Subject> subjects = new java.util.HashSet<>();
			for (String subj : subjectStr) {
				subjects.add(subjectService.read(Subject.class, subj));
			}
			course.setSubjects(subjects);

			byAndTimeStamp.setCreatedBy(principal.getName());
			byAndTimeStamp.setCreatedTs(new Timestamp(new Date().getTime()));
			byAndTimeStamp.setModifiedBy(principal.getName());
			byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));

			course.setByAndTimeStamp(byAndTimeStamp);
			course = courseService.save(course);

			jsonObject.put("Record", course);
			jsonObject.put("Result", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			jsonObject.put("Result", "Error");
			jsonObject.put("Message", "Unable to add Course please try again.");
		}
		return jsonObject.toString();

	}

	@RequestMapping(value = "/getSubjectOptions", method = RequestMethod.POST)
	public @ResponseBody String getSubjectOptions(SessionStatus status, HttpServletRequest request,
			Principal principal) {
		JSONObject jsonObject = new JSONObject();
		try {

			JSONArray jsonArray = new JSONArray();

			List<Subject> subjects = subjectService.getList(Subject.class, "0", "100");
			for (Subject subject : subjects) {
				JSONObject jsonObjectTemp = new JSONObject();
				jsonObject.put("DisplayText", subject.getName());
				jsonObject.put("Value", subject.getSubjectId());
				jsonArray.put(jsonObjectTemp);

			}

			jsonObject.put("Options", jsonArray);
			jsonObject.put("Result", "OK");

		} catch (Exception e) {
			e.printStackTrace();
			jsonObject.put("Result", "Error");
			jsonObject.put("Message", "Unable to update Course please try again.");
		}
		return jsonObject.toString();

	}

	@RequestMapping(value = "/editCourse", method = RequestMethod.POST)
	public @ResponseBody String editCourse(@ModelAttribute("addCourse") Course course, BindingResult result,
			SessionStatus status, HttpServletRequest request, Principal principal) {
		JSONObject jsonObject = new JSONObject();
		try {
			ByAndTimeStamp byAndTimeStamp = new ByAndTimeStamp();
			byAndTimeStamp.setModifiedBy(principal.getName());
			byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));

			course.setByAndTimeStamp(byAndTimeStamp);

			String subjectStr[] = request.getParameterValues("subject[]");

			Set<Subject> subjects = new java.util.HashSet<>();
			for (String subj : subjectStr) {
				subjects.add(subjectService.read(Subject.class, subj));
			}
			course.setSubjects(subjects);

			courseService.update(course);
			jsonObject.put("Record", course);
			jsonObject.put("Result", "OK");

		} catch (Exception e) {
			e.printStackTrace();
			jsonObject.put("Result", "Error");
			jsonObject.put("Message", "Unable to update Course please try again.");
		}
		return jsonObject.toString();

	}

	private JSONObject convertToJson(Course course) {
		JSONObject object = new JSONObject();
		object.put("CourseId", course.getCourseId());
		object.put("name", course.getName());
		object.put("status", course.getStatus());
		object.put("price", course.getPrice());
		String subjectStr = "";
		String subjectId = "";
		for (Subject subject : course.getSubjects()) {
			subjectStr = subjectStr + "," + subject.getName();
			subjectId = subjectId + "," + subject.getSubjectId();
		}
		object.put("Subject", subjectStr);
		object.put("action",
				"<div class='col-lg-2'><div class='form-group'>"
						+ "<a class='btn btn-primary btn pull-left' data-toggle='modal' href='#searchModal' style='color: white; padding: 0px 6px;' "
						+ "onclick='loadCourseDetail(\"" + course.getCourseId() + "\", \"" + course.getName() + "\""
						+ ", " + "\"" + subjectStr + "\", \"" + subjectId + "\", \""+ course.getPrice() + "\" )'>Update</a></div></div>");
		return object;
	}

	/******************************
	 * Course Crud Ends
	 *************************************/
}
