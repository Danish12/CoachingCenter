package com.fagnum.controller;

import java.security.Principal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.ResourceBundle;

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

import com.fagnum.services.model.Blog;
import com.fagnum.services.model.Leaderboard;
import com.fagnum.services.model.ByAndTimeStamp;
import com.fagnum.services.service.BlogService;
import com.fagnum.services.service.LeaderboardService;
import com.fagnum.services.util.Constants;

@Controller
public class LeaderboardController {

	LeaderboardService leaderboardService = AppController.getLeaderboardService();
	BlogService blogService = AppController.getBlogService();
	
	@RequestMapping("/article-writing-contest")
	public String leaderboard(HttpServletRequest request) {
		return "leaderboard";
	}
	
	@RequestMapping(value = "/listLeaderboardWinner")
	public @ResponseBody String listLeaderboardWinner(HttpServletRequest request) {
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();
		String startIndex = request.getParameter("jtStartIndex");
		String pageSize = request.getParameter("jtPageSize");

		List<Object> parameterList = new ArrayList<Object>();
		parameterList.add(Constants._ACTIVE);
		String query = new String("from Leaderboard leaderboard where leaderboard.status = ? order by leaderboard.point desc");
		List<Leaderboard> listLeaderboard = leaderboardService.getDynamicList(parameterList, query, startIndex, pageSize);
		
		for (Leaderboard leaderboard : listLeaderboard) {
			jsonArray.put(convertToJson(leaderboard));
		}
		jsonObject.put("Records", jsonArray);
		jsonObject.put("Result", "OK");
		jsonObject.put("TotalRecordCount", leaderboardService.getLeaderboardCount(Constants._ACTIVE));
		return jsonObject.toString();
	}
	
	@RequestMapping("/masterCrudLeaderboard")
	public String masterCrudLeaderboard(HttpServletRequest request) {
		return "masterCrudLeaderboard";
	}

	/****************************** Leaderboard Crud Starts *************************************/
	
	@RequestMapping(value = "/listLeaderboard")
	public @ResponseBody String listLeaderboard(HttpServletRequest request) {
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();
		String startIndex = request.getParameter("jtStartIndex");
		String pageSize = request.getParameter("jtPageSize");

		List<Object> parameterList = new ArrayList<Object>();
		parameterList.add(Constants._ACTIVE);
		String query = new String("from Leaderboard leaderboard where leaderboard.status = ? order by leaderboard.point desc");
		List<Leaderboard> listLeaderboard = leaderboardService.getDynamicList(parameterList, query, startIndex, pageSize);
		
		for (Leaderboard leaderboard : listLeaderboard) {
			jsonArray.put(convertToJson(leaderboard));
		}
		jsonObject.put("Records", jsonArray);
		jsonObject.put("Result", "OK");
		jsonObject.put("TotalRecordCount", leaderboardService.getLeaderboardCount(Constants._ACTIVE));
		return jsonObject.toString();
	}

	@RequestMapping(value = "/addLeaderboard", method = RequestMethod.POST)
	public @ResponseBody String addLeaderboard(@ModelAttribute("addLeaderboard") Leaderboard leaderboard, BindingResult result, SessionStatus status,
			HttpServletRequest request, Principal principal) {
		JSONObject jsonObject = new JSONObject();
		ByAndTimeStamp byAndTimeStamp = new ByAndTimeStamp();
		try {
			String share = request.getParameter("share");
			String view = request.getParameter("view");
			String critics = request.getParameter("critics");
			String referral = request.getParameter("referral");
			String blogId = request.getParameter("blogId");
			String contestNumber = request.getParameter("contestNumber");
			String awardedMoney = request.getParameter("awardedMoney");
			
			Blog blog = blogService.read(Blog.class, blogId);
			leaderboard.setBlog(blog);
			leaderboard.setShare(Integer.parseInt(share));
			leaderboard.setView(Integer.parseInt(view));
			leaderboard.setCritics(Integer.parseInt(critics));
			leaderboard.setReferral(Integer.parseInt(referral));
			leaderboard.setContestNumber(Integer.parseInt(contestNumber));
			leaderboard.setAwardedMoney(Integer.parseInt(awardedMoney));
			leaderboard.setPoint((2*leaderboard.getShare()) + leaderboard.getView() + leaderboard.getCritics() + (50*leaderboard.getReferral()));
			
			byAndTimeStamp.setCreatedBy(principal.getName());
			byAndTimeStamp.setCreatedTs(new Timestamp(new Date().getTime()));
			byAndTimeStamp.setModifiedBy(principal.getName());
			byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));

			leaderboard.setByAndTimeStamp(byAndTimeStamp);
			leaderboard = leaderboardService.save(leaderboard);

			jsonObject.put("Record", leaderboard);
			jsonObject.put("Result", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			jsonObject.put("Result", "ERROR");
			jsonObject.put("Message", "Unable to add leaderboard please try again.");
		}
		return jsonObject.toString();

	}

	@RequestMapping(value = "/editLeaderboard", method = RequestMethod.POST)
	public @ResponseBody String editLeaderboard(@ModelAttribute("addLeaderboard") Leaderboard leaderboard, BindingResult result, SessionStatus status,
			HttpServletRequest request, Principal principal) {
		JSONObject jsonObject = new JSONObject();
		try {
			Leaderboard leaderboard2 = leaderboardService.read(Leaderboard.class, leaderboard.getLeaderboardId());
			ByAndTimeStamp byAndTimeStamp = leaderboard2.getByAndTimeStamp();
			byAndTimeStamp.setModifiedBy(principal.getName());
			byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));
			
			String share = request.getParameter("share");
			String view = request.getParameter("view");
			String critics = request.getParameter("critics");
			String referral = request.getParameter("referral");
			String contestNumber = request.getParameter("contestNumber");
			String awardedMoney = request.getParameter("awardedMoney");
			String blogId = request.getParameter("blogId");
			
			Blog blog = blogService.read(Blog.class, blogId);
			leaderboard.setBlog(blog);
			leaderboard.setShare(Integer.parseInt(share));
			leaderboard.setView(Integer.parseInt(view));
			leaderboard.setCritics(Integer.parseInt(critics));
			leaderboard.setReferral(Integer.parseInt(referral));
			leaderboard.setContestNumber(Integer.parseInt(contestNumber));
			leaderboard.setAwardedMoney(Integer.parseInt(awardedMoney));
			leaderboard.setPoint((2*leaderboard.getShare()) + leaderboard.getView() + leaderboard.getCritics() + (50*leaderboard.getReferral()));
			
			leaderboard.setByAndTimeStamp(byAndTimeStamp);

			leaderboardService.update(leaderboard);
			jsonObject.put("Record", leaderboard);
			jsonObject.put("Result", "OK");

		} catch (Exception e) {
			e.printStackTrace();
			jsonObject.put("Result", "ERROR");
			jsonObject.put("Message", "Unable to update leaderboard please try again.");
		}
		return jsonObject.toString();

	}

	private JSONObject convertToJson(Leaderboard leaderboard) {
		ResourceBundle resource = ResourceBundle.getBundle("application");
		JSONObject object = new JSONObject();
		object.put("leaderboardId", leaderboard.getLeaderboardId());
		object.put("share", leaderboard.getShare());
		object.put("view", leaderboard.getView());
		object.put("critics", leaderboard.getCritics());
		object.put("averageTime", leaderboard.getAverageTime());
		object.put("referral", leaderboard.getReferral());
		object.put("point", leaderboard.getPoint());
		object.put("status", leaderboard.getStatus());
		object.put("title", leaderboard.getBlog().getTitle());
		object.put("awardedMoney", leaderboard.getAwardedMoney());
		object.put("contestNumber", leaderboard.getContestNumber());
		object.put("standing", leaderboard.getStanding());
		object.put("author", "<div class='col-lg-2'><div class='form-group'>"
				+ "<a href='"+resource.getString("siteUrl")+"author/"+ leaderboard.getBlog().getBloggerUrl() +"' style='color:black;' target='_blank'>"
				+leaderboard.getBlog().getBlogger().getName()+"</a></div></div>");
		object.put("url", "<div class='col-lg-2'><div class='form-group'>"
				+ "<a href='"+resource.getString("siteUrl")+"blog/"+ leaderboard.getBlog().getUrl() +"' style='color:black;' target='_blank'>"
				+leaderboard.getBlog().getTitle()+"</a></div></div>");
		object.put("action", "<div class='col-lg-2'><div class='form-group'>"
				+ "<a class='btn btn-primary btn pull-left' data-toggle='modal' href='#searchModal' style='color: white; padding: 0px 6px;' "
				+ "onclick='loadLeaderboardDetail(\""+leaderboard.getLeaderboardId()+"\", \""+leaderboard.getShare()+"\", "
				+ "\""+leaderboard.getView()+"\", \""+leaderboard.getStatus()+"\", \""+leaderboard.getBlog().getBlogId()+"\", "
				+ "\""+leaderboard.getCritics()+"\", \""+leaderboard.getReferral()+"\", \""+leaderboard.getAwardedMoney()+"\", "
				+ "\""+leaderboard.getContestNumber()+"\", \""+leaderboard.getAverageTime()+"\", \""+leaderboard.getStanding()+"\")'>"
				+ "Update Leaderboard</a></div></div>");
		return object;
	}
	
	/****************************** Leaderboard Crud Ends *************************************/
	
}
