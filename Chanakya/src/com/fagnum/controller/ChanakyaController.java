package com.fagnum.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.Principal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fagnum.comparator.BloggerSorter;
import com.fagnum.services.model.Blog;
import com.fagnum.services.model.Blogger;
import com.fagnum.services.model.ByAndTimeStamp;
import com.fagnum.services.model.Enquiry;
import com.fagnum.services.model.SpringUser;
import com.fagnum.services.model.Subject;
import com.fagnum.services.model.User;
import com.fagnum.services.service.BlogService;
import com.fagnum.services.service.BloggerService;
import com.fagnum.services.service.EnquiryService;
import com.fagnum.services.service.SubjectService;
import com.fagnum.services.util.Constants;

@Controller
public class ChanakyaController extends BaseAppController{

	BlogService blogService = AppController.getBlogService();
	BloggerService bloggerService = AppController.getBloggerService();
	EnquiryService enquiryService = AppController.getEnquiryService();
	SubjectService subjectService = AppController.getSubjectService();

	@RequestMapping("/blocked")
	public String blocked(HttpServletRequest request) {
		return "blocked";
	}

	@RequestMapping("/writeForUs/")
	public String writeForUs(HttpServletRequest request) {
		return "writeForUs";
	}

	@RequestMapping("/short-movie-contest/")
	public String shortMovieContest(HttpServletRequest request) {
		return "shortMovieContest";
	}

	@RequestMapping("/")
	public String home(HttpServletRequest request) {
		String page = "home";
		request.setAttribute("home", "true");

		User currentUser = SpringUser.getCurrentUser();
		if (currentUser != null) {
			request.getSession().setAttribute("user", currentUser);
		}
		Subject currentAffair = subjectService.findSubject("CURRENT_AFFAIRS") ;
		Subject noticeBoard = subjectService.findSubject("NOTICE") ;
		List<Blog> currentAffairs  = blogService.findBySubject(currentAffair.getSubjectId(), "0", "5");
		List<Blog> notices  = blogService.findBySubject(noticeBoard.getSubjectId(), "0", "5");
		request.setAttribute("notices", notices);
		request.setAttribute("currentAffairs", currentAffairs);
		return page;
	}

	@RequestMapping(value = "/loadMore", method = RequestMethod.GET)
	public void loadMore(Model model, Map<String, Object> map, HttpServletRequest request,
			HttpServletResponse response) {
		JSONArray array = new JSONArray();
		int length = Integer.parseInt(request.getParameter("length"));
		List<Object> parameterList = new ArrayList<Object>();
		parameterList.add(Constants._PUBLISH);
		String query = new String("from Blog blog where blog.status = ? order by blog.blogId desc");
		List<Blog> listBlogs = blogService.getDynamicList(parameterList, query, String.valueOf(length), "16");
		request.setAttribute("blogs", listBlogs);
		request.setAttribute("matches", listBlogs.size());

		for (Blog blog : listBlogs) {
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("title", blog.getTitle());
			jsonObj.put("image", blog.getBlogImage());
			jsonObj.put("url", blog.getUrl());
			jsonObj.put("date", blog.getDate());
			jsonObj.put("name", blog.getBlogger().getName());

			array.put(jsonObj);
		}

		try {
			String jsonString = JSONValue.toJSONString(array);
			response.getWriter().print(jsonString);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/searchResultBlogger", method = RequestMethod.GET)
	public String searchResultBlogger(Model model, Map<String, Object> map, HttpServletRequest request) {
		String name = request.getParameter("name");
		name = name + "," + "promote";
		String value = request.getParameter("city");
		value = value + "," + "Yes";
		List<Blogger> listBlogger = null;
		if (value != null && value != "") {
			listBlogger = bloggerService.getDynamicListByLike("Blogger", name, value, null, null);
		} else {
			listBlogger = bloggerService.getAllList(Blogger.class);
		}
		for (Blogger blogger : listBlogger) {
			List<Object> listString = blogService.getBloggerBlogCount(blogger.getUrl());
			Iterator<Object> iterator = listString.iterator();
			while (iterator.hasNext()) {
				Object row[] = (Object[]) iterator.next();
				blogger.setNoOfArticle(Integer.parseInt(row[2].toString()));
			}
		}
		BloggerSorter bloggerSorter = new BloggerSorter(listBlogger);
		bloggerSorter.getSortedBloggerByArticle();
		// request.setAttribute("count", result);
		// request.setAttribute("matches", caAddressMap.size() + length);
		// request.setAttribute("area", area);
		request.setAttribute("city", value);
		request.setAttribute("listBlogger", listBlogger);
		// request.setAttribute("citySet", citySet);
		// request.setAttribute("areaSet", areaSet);
		return "hireWriter";
	}

	@RequestMapping("/voice/")
	public String voice(HttpServletRequest request) {
		List<Object> parameterList = new ArrayList<Object>();
		parameterList.add(Constants._STARTUP_VOICE);
		parameterList.add(Constants._PUBLISH);
		String query = new String(
				"from Blog as blog where blog.blogType = ? and blog.status = ? order by blog.blogId desc");
		List<Blog> list = blogService.getDynamicList(parameterList, query);
		request.setAttribute("blogs", list);
		return "blogType";
	}


	@RequestMapping("/writer-words/")
	public String writerWords(HttpServletRequest request) {
		List<Object> parameterList = new ArrayList<Object>();
		parameterList.add(Constants._WRITER_WORDS);
		parameterList.add(Constants._PUBLISH);
		String query = new String(
				"from Blog as blog where blog.blogType = ? and blog.status = ? order by blog.blogId desc");
		List<Blog> list = blogService.getDynamicList(parameterList, query);
		request.setAttribute("blogs", list);
		return "blogType";
	}

	@RequestMapping("/how-tips-why/")
	public String howAndTips(HttpServletRequest request) {
		List<Object> parameterList = new ArrayList<Object>();
		parameterList.add(Constants._HOW_TIPS_WHY);
		parameterList.add(Constants._PUBLISH);
		String query = new String(
				"from Blog as blog where blog.blogType = ? and blog.status = ? order by blog.blogId desc");
		List<Blog> list = blogService.getDynamicList(parameterList, query);
		request.setAttribute("blogs", list);
		return "blogType";
	}

	@RequestMapping("/others/")
	public String others(HttpServletRequest request) {
		List<Object> parameterList = new ArrayList<Object>();
		parameterList.add(Constants._OTHERS);
		parameterList.add(Constants._PUBLISH);
		String query = new String(
				"from Blog as blog where blog.blogType = ? and blog.status = ? order by blog.blogId desc");
		List<Blog> list = blogService.getDynamicList(parameterList, query);
		request.setAttribute("blogs", list);
		return "blogType";
	}

/*	@RequestMapping("/videos/")
	public String videos(HttpServletRequest request) {
		return "videos";
	}*/

	@RequestMapping("/aboutUs/")
	public String aboutUs(HttpServletRequest request) {
		request.setAttribute("notTransparent", "true");
		return "aboutUs";
	}

	@RequestMapping("/contact/")
	public String contactUs(HttpServletRequest request) {
		request.setAttribute("notTransparent", "true");
		return "contact";
	}

	@RequestMapping("/login/")
	public String login(HttpServletRequest request) {
		request.setAttribute("notTransparent", "true");
		return "login";
	}

	@RequestMapping("/termsAndConditions/")
	public String termsAndConditions(HttpServletRequest request) {
		request.setAttribute("notTransparent", "true");
		return "termsAndConditions";
	}

	@RequestMapping("/privacyPolicy/")
	public String privacyPolicy(HttpServletRequest request) {
		request.setAttribute("notTransparent", "true");
		return "privacyPolicy";
	}

	@RequestMapping("/disclaimer/")
	public String disclaimer(HttpServletRequest request) {
		request.setAttribute("notTransparent", "true");
		return "disclaimer";
	}

	@RequestMapping("/sitemap/")
	public String sitemap(HttpServletRequest request) {
		request.setAttribute("blogs", blogService.getBlogListByStatusAndBlogIdDesc(Constants._PUBLISH));
		return "blog";
	}

	@SuppressWarnings("unused")
	@RequestMapping(value = "/sendEnquiry", method = RequestMethod.POST)
	public @ResponseBody String sendEnquiry(HttpServletRequest request, Principal principal)
			throws NoSuchAlgorithmException {
		ResourceBundle resource = ResourceBundle.getBundle("application");
		// String accountActivationURL = resource.getString("siteUrl");
		JSONObject jsonObject = new JSONObject();

		String emailId = request.getParameter("emailId");
		String contactNumber = request.getParameter("contactNumber");
		String name = request.getParameter("name");
		String message = request.getParameter("message");

		Enquiry enquiry = new Enquiry();
		enquiry.setName(name);
		enquiry.setEmailId(emailId);
		enquiry.setMessage(message);
		enquiry.setContactNumber(contactNumber);
		enquiry.setDate(new java.sql.Date(new java.util.Date().getTime()));

		ByAndTimeStamp byAndTimeStamp = new ByAndTimeStamp();
		byAndTimeStamp.setCreatedBy(emailId);
		byAndTimeStamp.setCreatedTs(new Timestamp(new Date().getTime()));
		byAndTimeStamp.setModifiedBy(emailId);
		byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));

		enquiry.setByAndTimeStamp(byAndTimeStamp);
		try {
			enquiry = enquiryService.save(enquiry);
			jsonObject.put("status", true);
			jsonObject.put("messageOne", "Thank you for your response. Will come back to you soon.)");
			jsonObject.put("messageTwo", "");
			String subject = "Enquiry from " + emailId;
			String emailMessage = "<html><body>" + "Enquiry from User<br><br>" + "Name " + name + "<br> " + "Email Id "
					+ emailId + "<br> " + "Contact Number " + contactNumber + "<br> " + "Message " + message + "<br> "
					+ "<br><br>Regards," + "<br>Team " + resource.getString("name") + "<br>" + "Email:"
					+ resource.getString("care") + "<br>" + "</body></html>";
			/*MailThread send = new MailThread("care@fagnum.com", subject, emailMessage);
			send.start();*/
		} catch (Exception e) {
			e.printStackTrace();
			jsonObject.put("status", false);
			jsonObject.put("messageOne", "Problem in saving records. Please try again later.");
			jsonObject.put("messageTwo", "");
		}
		return jsonObject.toString();
	}
}