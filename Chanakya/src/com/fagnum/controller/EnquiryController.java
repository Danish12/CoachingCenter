package com.fagnum.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fagnum.services.model.Enquiry;
import com.fagnum.services.service.EnquiryService;

@Controller
public class EnquiryController {

	EnquiryService enquiryService = AppController.getEnquiryService();

	/******************************
	 * Course Subject Starts
	 *************************************/

	@RequestMapping("/enquiry")
	public String masterCrudSubject(HttpServletRequest request) {

		return "/crud/masterCrudEnquiry";
	}

	@RequestMapping(value = "/listEnquiry")
	public @ResponseBody String listSubject(HttpServletRequest request) {
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();
		String startIndex = request.getParameter("jtStartIndex");
		String pageSize = request.getParameter("jtPageSize");

		List<Enquiry> enquiries = enquiryService.getList(Enquiry.class, startIndex, startIndex + pageSize);

		for (Enquiry enquiry : enquiries) {
			jsonArray.put(convertToJson(enquiry));
		}
		jsonObject.put("Records", jsonArray);
		jsonObject.put("Result", "OK");
		jsonObject.put("TotalRecordCount", enquiryService.getTableRowCount(Enquiry.class));

		return jsonObject.toString();
	}

	private JSONObject convertToJson(Enquiry enquiry) {
		JSONObject object = new JSONObject();
		object.put("EnquiryId", enquiry.getEnquiryId());
		object.put("name", enquiry.getName());
		object.put("date", enquiry.getDate());
		object.put("contactNumber", enquiry.getContactNumber());
		object.put("emailId", enquiry.getEmailId());

		return object;
	}

}
