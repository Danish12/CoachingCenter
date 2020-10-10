package com.fagnum.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.fagnum.controller.AppController;
import com.fagnum.services.model.ByAndTimeStamp;
import com.fagnum.services.model.Blogger;
import com.fagnum.services.service.BlogService;
import com.fagnum.services.service.BloggerService;

@Controller
public class BloggerController {

	BloggerService bloggerService = AppController.getBloggerService();
	BlogService blogService = AppController.getBlogService();
	
	@RequestMapping("/blogger")
	public String bloggerList(HttpServletRequest request) {
		return "masterCrudBlogger";
	}
	@RequestMapping("/dashBoardBlogger")
	public String dashboardBlogger() {
		return "dashBoardBlogger";
	}
	@RequestMapping("/bloggerInfo")
	public String bloggerInfo() {
		return "bloggerInfo";
	}

	@RequestMapping(value = "/listBlogger")
	public @ResponseBody String listBlogger(HttpServletRequest request) {
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();
		String startIndex = request.getParameter("jtStartIndex");
		String pageSize = request.getParameter("jtPageSize");
		String name = request.getParameter("name");
		String value = request.getParameter("value");
		List<Blogger> list = null;
		if(value != null && !value.equals(",,")) {
			list = bloggerService.getDynamicListByLike("Blogger", name, value, startIndex, pageSize);
		} else {
			list = bloggerService.getList(Blogger.class, startIndex, pageSize);
		}
		for (Blogger blogger : list) {
			jsonArray.put(convertToJson(blogger));
		}
		jsonObject.put("Records", jsonArray);
		jsonObject.put("Result", "OK");
		jsonObject.put("TotalRecordCount", bloggerService.getTableRowCount(Blogger.class));
		return jsonObject.toString();
	}

	@RequestMapping(value = "/oneBlogger", method = RequestMethod.POST)
	public void loadBloggerDetail(HttpServletRequest request, HttpServletResponse response) {
		try { 
			JSONArray array = new JSONArray();
			JSONObject object = new JSONObject();
			String bloggerId = request.getParameter("bloggerId");
			List<Blogger> listBlogger = new ArrayList<Blogger>();
			if(bloggerId != null && bloggerId.length()> 0){
				listBlogger.add(bloggerService.read(Blogger.class,bloggerId));
				object.put("blogger", listBlogger);
			}
			array.put(object);
			String jsonString = JSONValue.toJSONString(array);
			response.getWriter().print(jsonString);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/addBlogger", method = RequestMethod.POST)
	public @ResponseBody String addBlogger(@ModelAttribute("addBlogger") Blogger blogger, BindingResult result, SessionStatus status,
			HttpServletRequest request, Principal principal) {
		JSONObject jsonObject = new JSONObject();
		ByAndTimeStamp byAndTimeStamp = new ByAndTimeStamp();
		try {
			byAndTimeStamp.setCreatedBy(principal.getName());
			byAndTimeStamp.setCreatedTs(new Timestamp(new Date().getTime()));
			byAndTimeStamp.setModifiedBy(principal.getName());
			byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));

			blogger.setByAndTimeStamp(byAndTimeStamp);
			blogger = bloggerService.save(blogger);

			jsonObject.put("Record", blogger);
			jsonObject.put("Result", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			jsonObject.put("Result", "ERROR");
			jsonObject.put("Message", "Unable to add blogger please try again.");
		}
		return jsonObject.toString();

	}

	@RequestMapping(value = "/editBlogger", method = RequestMethod.POST)
	public @ResponseBody String editBlogger(@ModelAttribute("addBlogger") Blogger blogger, BindingResult result, SessionStatus status,
			HttpServletRequest request, Principal principal) {
		JSONObject jsonObject = new JSONObject();
		try {
			Blogger blogger2 = bloggerService.read(Blogger.class, blogger.getBloggerId());
			ByAndTimeStamp byAndTimeStamp = blogger2.getByAndTimeStamp();
			byAndTimeStamp.setModifiedBy(principal.getName());
			byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));
			blogger.setByAndTimeStamp(byAndTimeStamp);

			bloggerService.update(blogger);
			jsonObject.put("Record", blogger);
			jsonObject.put("Result", "OK");

		} catch (Exception e) {
			e.printStackTrace();
			jsonObject.put("Result", "ERROR");
			jsonObject.put("Message", "Unable to update blogger please try again.");
		}
		return jsonObject.toString();

	}

	@RequestMapping(value = "/deleteBlogger", method = RequestMethod.POST)
	public @ResponseBody String deleteBlogger(@ModelAttribute("addBlogger") Blogger blogger, BindingResult result, SessionStatus status,
			HttpServletRequest request, HttpSession session) {
		JSONObject jsonObject = new JSONObject();
		try {
			bloggerService.delete(blogger);
			jsonObject.put("Result", "OK");
		} catch (Exception e) {
			jsonObject.put("Result", "ERROR");
		}
		return jsonObject.toString();

	}
	
	private JSONObject convertToJson(Blogger blogger) {
		JSONObject object = new JSONObject();
		object.put("bloggerId", blogger.getBloggerId());
		object.put("name", blogger.getName());
		object.put("url", blogger.getUrl());
		object.put("emailId", blogger.getEmailId());
		object.put("contactNumber", blogger.getContactNumber());
		object.put("bio", blogger.getBio());
		object.put("city", blogger.getCity());
		object.put("profilePic", blogger.getProfilePic());
		object.put("gender", blogger.getGender());
		object.put("type", blogger.getType());
		object.put("review", blogger.getReview());
		object.put("promote", blogger.getPromote());
		object.put("linkedinProfile", blogger.getLinkedinProfile());
		object.put("facebookProfile", blogger.getFacebookProfile());
		object.put("twitterProfile", blogger.getTwitterProfile());
		object.put("joiningDate", blogger.getJoiningDate());
		object.put("blogLink", blogger.getBlogLink());
		object.put("metaKeyword", blogger.getMetaKeyword());
		object.put("leavingDate", blogger.getLeavingDate());
		object.put("referredBy", blogger.getReferredBy());
		object.put("status",blogger.getStatus());
		object.put("action", "<div class='col-lg-2'><div class='form-group'>"
				+ "<a class='btn btn-primary btn pull-left' data-toggle='modal' href='#searchModal' style='color: white; padding: 0px 6px;' "
				+ "onclick='loadBloggerDetail(\""+blogger.getBloggerId()+"\")'>"
				+ "Update Blogger</a></div></div>");
		return object;
	}
	
	@RequestMapping(value = "/account", method = RequestMethod.GET)
	public String account(HttpServletRequest request) {
		request.setAttribute("type", request.getParameter("type"));
		return "dashBoardBlogger";
	}
	
	@RequestMapping(value = "/getProfile", method = RequestMethod.GET)
	public void getProfile(HttpServletRequest request, HttpServletResponse response, HttpSession session, Principal principal) {
		JSONArray array = new JSONArray();
		String jsonString = new String();
		List<Blogger> bloggerList = new ArrayList<Blogger>();
		Blogger blogger = bloggerService.getEntityByEmailId(Blogger.class, principal.getName());
		if (blogger != null) {
			bloggerList.add(blogger);
		}
		array.put(bloggerList);
		jsonString = JSONValue.toJSONString(array);
		try {
			response.getWriter().print(jsonString);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/saveProfile", method = RequestMethod.POST)
	public void saveProfile(HttpServletRequest request, HttpServletResponse response, Principal principal) throws IOException {
		Blogger blogger = bloggerService.getEntityByEmailId(Blogger.class, principal.getName());
		ByAndTimeStamp byAndTimeStamp = blogger.getByAndTimeStamp();
		String updateBio = request.getParameter("updateBio");
		if (updateBio != null && !updateBio.equals("")) {
			String bio = request.getParameter("bio");
			blogger.setBio(bio);
		} else {
			String name = request.getParameter("name");
			String contactNumber = request.getParameter("contactNumber");
			String altContactNumber = request.getParameter("altContactNumber");
			String facebookProfile = request.getParameter("facebookProfile");
			String twitterProfile = request.getParameter("twitterProfile");
			String linkedinProfile = request.getParameter("linkedinProfile");
			if (name != null && !name.equals("")) {
				blogger.setName(name);
			}
			if (contactNumber != null && !contactNumber.equals("")) {
				blogger.setContactNumber(contactNumber);
			}
			if (altContactNumber != null && !altContactNumber.equals("")) {
				blogger.setAltContactNumber(altContactNumber);
			}
			if (facebookProfile != null && !facebookProfile.equals("")) {
				blogger.setFacebookProfile(facebookProfile);
			}
			if (twitterProfile != null && !twitterProfile.equals("")) {
				blogger.setTwitterProfile(twitterProfile);
			}
			if (linkedinProfile != null && !linkedinProfile.equals("")) {
				blogger.setLinkedinProfile(linkedinProfile);
			}
		}
		try {
			byAndTimeStamp.setModifiedBy(principal.getName());
			byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));
			blogger.setByAndTimeStamp(byAndTimeStamp);
			bloggerService.update(blogger);
			response.getWriter().print(true);
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print(false);
		} 
	}
	
	@RequestMapping(value = "/bloggerImageSubmit", method = RequestMethod.POST)
	public ModelAndView bloggerImageSubmit(HttpServletRequest request, @RequestParam("profileImage") MultipartFile profileImage, Principal principal) {
		Blogger blogger = bloggerService.getEntityByEmailId(Blogger.class, principal.getName());
		ByAndTimeStamp byAndTimeStamp = blogger.getByAndTimeStamp();
		String fileName = profileImage.getOriginalFilename();
		if (!profileImage.isEmpty()) {
			try {
				byte[] bytes = profileImage.getBytes();
				// Creating the directory to store file
				File dir = new File(File.separator + "opt" + File.separator + "tomcat7" + File.separator + "FagnumImage" + File.separator + "bloggerImage");
				if (!dir.exists())
					dir.mkdirs();
				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath() + File.separator + fileName);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (fileName != null && !fileName.equals("")) {
			blogger.setProfilePic("bloggerImage?" + profileImage.getOriginalFilename());
		}
		ModelAndView modelView = new ModelAndView(new RedirectView("account"));
		try {
			byAndTimeStamp.setModifiedBy(principal.getName());
			byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));
			blogger.setByAndTimeStamp(byAndTimeStamp);
			bloggerService.update(blogger);
			modelView.addObject("type", "imageType");
		} catch (Exception e) {
			e.printStackTrace();
			modelView.addObject("status", "false");
		}
		return modelView;
	}
	
	@RequestMapping(value = "/imageChangedsuccessfully", method = RequestMethod.GET)
	public String imageChangedsuccessfully(HttpServletRequest request) {
		request.setAttribute("imageChangedsuccessfully", request.getParameter("status"));
		return "dashBoardBlogger";
	}
	
	@RequestMapping(value = "/hireWriter", method = RequestMethod.GET)
	public String hireWriter(HttpServletRequest request) {
		List<Blogger> listBlogger = new ArrayList<Blogger>();
		List<Object> listString =  blogService.getBloggerBlogCount("blogId");
		Iterator<Object> iterator = listString.iterator();
		while(iterator.hasNext()) {
			Object row[] = (Object[]) iterator.next();
			Blogger blogger = bloggerService.read(Blogger.class, row[0].toString());
			blogger.setNoOfArticle(Integer.parseInt(row[2].toString()));
			listBlogger.add(blogger);
		}
		request.setAttribute("listBlogger", listBlogger);
		return "hireWriter";
	}
}
