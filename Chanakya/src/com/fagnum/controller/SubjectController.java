package com.fagnum.controller;

import java.security.Principal;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

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
import com.fagnum.services.service.SubjectService;

@Controller
public class SubjectController {

	SubjectService subjectService = AppController.getSubjectService();
	BlogService blogService = AppController.getBlogService();

	/******************************
	 * Course Subject Starts
	 *************************************/

	@RequestMapping("/subject")
	public String masterCrudSubject(HttpServletRequest request) {

		List<Subject> subjects = subjectService.getList(Subject.class, "0", "100");
		request.setAttribute("subjects", subjects);
		return "/crud/masterCrudSubject";
	}
	
	@RequestMapping(value = "/listSubject")
	public @ResponseBody String listSubject(HttpServletRequest request) {
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();
		String startIndex = request.getParameter("jtStartIndex");
		String pageSize = request.getParameter("jtPageSize");

		List<Subject> listSubjects = subjectService.getList(Subject.class, startIndex, pageSize);

		for (Subject subject : listSubjects) {
			jsonArray.put(convertToJson(subject));
		}
		jsonObject.put("Records", jsonArray);
		jsonObject.put("Result", "OK");
		jsonObject.put("TotalRecordCount", subjectService.getTableRowCount(Subject.class));

		return jsonObject.toString();
	}

	@RequestMapping(value = "/addSubject", method = RequestMethod.POST)
	public @ResponseBody String addSubject(@ModelAttribute("addSubject") Subject subject, BindingResult result,
			SessionStatus status, HttpServletRequest request, Principal principal) {
		JSONObject jsonObject = new JSONObject();
		try {

			ByAndTimeStamp byAndTimeStamp = new ByAndTimeStamp();

			byAndTimeStamp.setCreatedBy(principal.getName());
			byAndTimeStamp.setCreatedTs(new Timestamp(new Date().getTime()));
			byAndTimeStamp.setModifiedBy(principal.getName());
			byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));

			subject.setByAndTimeStamp(byAndTimeStamp);
			subject = subjectService.save(subject);

			jsonObject.put("Record", subject);
			jsonObject.put("Result", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			jsonObject.put("Result", "Error");
			jsonObject.put("Message", "Unable to add Subject please try again." + e.getMessage());
		}
		return jsonObject.toString();

	}

	@RequestMapping(value = "/editSubject", method = RequestMethod.POST)
	public @ResponseBody String editSubject(@ModelAttribute("addSubject") Subject subject, BindingResult result,
			SessionStatus status, HttpServletRequest request, Principal principal) {
		JSONObject jsonObject = new JSONObject();
		try {
			Subject subject2 = subjectService.read(Subject.class, subject.getSubjectId());
			subject2.setName(subject.getName());
			subject2.setUrl(subject.getUrl());
			ByAndTimeStamp byAndTimeStamp = subject2.getByAndTimeStamp();
			byAndTimeStamp.setModifiedBy(principal.getName());
			byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));

			subject2.setByAndTimeStamp(byAndTimeStamp);

			subjectService.update(subject2);
			jsonObject.put("Record", subject2);
			jsonObject.put("Result", "OK");

		} catch (Exception e) {
			e.printStackTrace();
			jsonObject.put("Result", "Error");
			jsonObject.put("Message", "Unable to update Subject please try again.");
		}
		return jsonObject.toString();

	}

	private JSONObject convertToJson(Subject subject) {
		JSONObject object = new JSONObject();
		object.put("SubjectId", subject.getSubjectId());
		object.put("name", subject.getName());
		object.put("url", subject.getUrl());

		object.put("action", "<div class='col-lg-2'><div class='form-group'>"
				+ "<a class='btn btn-primary btn pull-left' data-toggle='modal' href='#searchModal' style='color: white; padding: 0px 6px;' "
				+ "onclick='loadSubjectDetail(\"" + subject.getSubjectId() + "\", \"" + subject.getName() 
				+ "\", \"" +subject.getUrl() + "\");'> Update</a></div></div>");

		return object;
	}

	/******************************
	 * Subject CRUD Ends
	 *************************************/
}
