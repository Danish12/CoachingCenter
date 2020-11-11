package com.fagnum.controller;

import java.security.Principal;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.fagnum.services.model.ByAndTimeStamp;
import com.fagnum.services.model.Facebook;
import com.fagnum.services.service.FacebookService;

@Controller
public class FacebookController {

	FacebookService facebookService = AppController.getFacebookService();

	/****************************** Facebook Crud Starts *************************************/
	
	@RequestMapping("/facebook")
	public String masterCrudFacebook(HttpServletRequest request) {
		return "masterCrudFacebook";
	}
	
	@RequestMapping(value = "/listFacebook")
	public @ResponseBody String listFacebook(HttpServletRequest request) throws JSONException {
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();
		String startIndex = request.getParameter("jtStartIndex");
		String pageSize = request.getParameter("jtPageSize");

		List<Facebook> listFacebook = facebookService.getList(Facebook.class, startIndex, pageSize);
		
		for (Facebook facebook : listFacebook) {
			jsonArray.put(convertToJson(facebook));
		}
		jsonObject.put("Records", jsonArray);
		jsonObject.put("Result", "OK");
		jsonObject.put("TotalRecordCount", facebookService.getTableRowCount(Facebook.class));
		return jsonObject.toString();
	}

	@RequestMapping(value = "/addFacebook", method = RequestMethod.POST)
	public @ResponseBody String addFacebook(@ModelAttribute("addFacebook") Facebook facebook, BindingResult result, SessionStatus status,
			HttpServletRequest request, Principal principal) throws JSONException {
		JSONObject jsonObject = new JSONObject();
		ByAndTimeStamp byAndTimeStamp = new ByAndTimeStamp();
		try {

			byAndTimeStamp.setCreatedBy(principal.getName());
			byAndTimeStamp.setCreatedTs(new Timestamp(new Date().getTime()));
			byAndTimeStamp.setModifiedBy(principal.getName());
			byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));

			facebook.setByAndTimeStamp(byAndTimeStamp);
			facebook = facebookService.save(facebook);

			jsonObject.put("Record", facebook);
			jsonObject.put("Result", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			jsonObject.put("Result", "Error");
			jsonObject.put("Message", "Unable to add facebook please try again.");
		}
		return jsonObject.toString();

	}

	@RequestMapping(value = "/editFacebook", method = RequestMethod.POST)
	public @ResponseBody String editFacebook(@ModelAttribute("addFacebook") Facebook facebook, BindingResult result, SessionStatus status,
			HttpServletRequest request, Principal principal) throws JSONException {
		JSONObject jsonObject = new JSONObject();
		try {
			Facebook facebook2 = facebookService.read(Facebook.class, facebook.getFacebookId());
			ByAndTimeStamp byAndTimeStamp = facebook2.getByAndTimeStamp();
			byAndTimeStamp.setModifiedBy(principal.getName());
			byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));
			
			facebook.setByAndTimeStamp(byAndTimeStamp);

			facebookService.update(facebook);
			jsonObject.put("Record", facebook);
			jsonObject.put("Result", "OK");

		} catch (Exception e) {
			e.printStackTrace();
			jsonObject.put("Result", "Error");
			jsonObject.put("Message", "Unable to update facebook please try again.");
		}
		return jsonObject.toString();

	}

	private JSONObject convertToJson(Facebook facebook) throws JSONException {
		JSONObject object = new JSONObject();
		object.put("facebookId", facebook.getFacebookId());
		object.put("groupName", facebook.getGroupName());
		object.put("groupLink", facebook.getGroupLink());
		object.put("type", facebook.getType());
		object.put("status", facebook.getStatus());
		object.put("action", "<div class='col-lg-2'><div class='form-group'>"
				+ "<a class='btn btn-primary btn pull-left' data-toggle='modal' href='#searchModal' style='color: white; padding: 0px 6px;' "
				+ "onclick='loadFacebookDetail(\""+facebook.getFacebookId()+"\",\""+facebook.getGroupName()+"\",\""+facebook.getGroupLink()+"\", "
				+ "\""+facebook.getType()+"\", \""+facebook.getStatus()+"\")'> Update Facebook</a></div></div>");
		return object;
	}
	
	/****************************** Facebook Crud Ends *************************************/
	
}
