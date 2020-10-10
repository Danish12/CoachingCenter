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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.fagnum.services.model.ByAndTimeStamp;
import com.fagnum.services.model.TwitterTweet;
import com.fagnum.services.service.TwitterTweetService;

@Controller
public class TwitterTweetController {
	
	TwitterTweetService twitterTweetService = AppController.getTwitterTweetService();

	/****************************** TwitterTweet Crud Starts *************************************/
	
	@RequestMapping("/twitterTweet")
	public String masterCrudTwitterTweet(HttpServletRequest request) {
		return "masterCrudTwitterTweet";
	}
	
	@RequestMapping(value = "/listTwitterTweet")
	public @ResponseBody String listTwitterTweet(HttpServletRequest request) {
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();
		String startIndex = request.getParameter("jtStartIndex");
		String pageSize = request.getParameter("jtPageSize");

		List<TwitterTweet> listTwitterTweet = twitterTweetService.getList(TwitterTweet.class, startIndex, pageSize);
		
		for (TwitterTweet twitterTweet : listTwitterTweet) {
			jsonArray.put(convertToJson(twitterTweet));
		}
		jsonObject.put("Records", jsonArray);
		jsonObject.put("Result", "OK");
		jsonObject.put("TotalRecordCount", twitterTweetService.getTableRowCount(TwitterTweet.class));
		return jsonObject.toString();
	}

	@RequestMapping(value = "/addTwitterTweet", method = RequestMethod.POST)
	public @ResponseBody String addTwitterTweet(@ModelAttribute("addTwitterTweet") TwitterTweet twitterTweet, BindingResult result, SessionStatus status,
			HttpServletRequest request, Principal principal) {
		JSONObject jsonObject = new JSONObject();
		ByAndTimeStamp byAndTimeStamp = new ByAndTimeStamp();
		try {

			byAndTimeStamp.setCreatedBy(principal.getName());
			byAndTimeStamp.setCreatedTs(new Timestamp(new Date().getTime()));
			byAndTimeStamp.setModifiedBy(principal.getName());
			byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));

			twitterTweet.setByAndTimeStamp(byAndTimeStamp);
			twitterTweet = twitterTweetService.save(twitterTweet);

			jsonObject.put("Record", twitterTweet);
			jsonObject.put("Result", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			jsonObject.put("Result", "Error");
			jsonObject.put("Message", "Unable to add twitterTweet please try again.");
		}
		return jsonObject.toString();

	}

	@RequestMapping(value = "/editTwitterTweet", method = RequestMethod.POST)
	public @ResponseBody String editTwitterTweet(@ModelAttribute("addTwitterTweet") TwitterTweet twitterTweet, BindingResult result, SessionStatus status,
			HttpServletRequest request, Principal principal) {
		JSONObject jsonObject = new JSONObject();
		try {
			TwitterTweet twitterTweet2 = twitterTweetService.read(TwitterTweet.class, twitterTweet.getTwitterTweetId());
			ByAndTimeStamp byAndTimeStamp = twitterTweet2.getByAndTimeStamp();
			byAndTimeStamp.setModifiedBy(principal.getName());
			byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));
			
			twitterTweet.setByAndTimeStamp(byAndTimeStamp);

			twitterTweetService.update(twitterTweet);
			jsonObject.put("Record", twitterTweet);
			jsonObject.put("Result", "OK");

		} catch (Exception e) {
			e.printStackTrace();
			jsonObject.put("Result", "Error");
			jsonObject.put("Message", "Unable to update twitterTweet please try again.");
		}
		return jsonObject.toString();

	}

	private JSONObject convertToJson(TwitterTweet twitterTweet) {
		JSONObject object = new JSONObject();
		object.put("twitterTweetId", twitterTweet.getTwitterTweetId());
		object.put("link", twitterTweet.getLink());
		object.put("tweet", twitterTweet.getTweet());
		object.put("tweetOwner", twitterTweet.getTweetOwner());
		object.put("status", twitterTweet.getStatus());
		object.put("action", "<div class='col-lg-2'><div class='form-group'>"
				+ "<a class='btn btn-primary btn pull-left' data-toggle='modal' href='#searchModal' style='color: white; padding: 0px 6px;' "
				+ "onclick='loadTwitterTweetDetail(\""+twitterTweet.getTwitterTweetId()+"\",\""+twitterTweet.getLink()+"\",\""+twitterTweet.getTweet()+"\", "
				+ "\""+twitterTweet.getStatus()+"\", \""+twitterTweet.getTweetOwner()+"\")'> Update Twitter Tweet</a></div></div>");
		return object;
	}
	
	/****************************** TwitterTweet Crud Ends *************************************/
}
