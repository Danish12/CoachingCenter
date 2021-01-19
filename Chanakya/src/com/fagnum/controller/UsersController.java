package com.fagnum.controller;

import java.io.IOException;
import java.math.BigInteger;
import java.security.NoSuchAlgorithmException;
import java.security.Principal;
import java.security.SecureRandom;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.fagnum.services.model.ByAndTimeStamp;
import com.fagnum.services.model.Course;
import com.fagnum.services.model.User;
import com.fagnum.services.service.CourseService;
import com.fagnum.services.service.UserService;
import com.fagnum.services.util.Constants;
import com.fagnum.services.util.EncryptedPasswordGenerator;
import com.fagnum.services.util.MailThread;

@Controller
public class UsersController {

	private UserService userService = AppController.getUserService();

	@RequestMapping(value = "/signup",method=RequestMethod.POST)
	public @ResponseBody String signupSubmit(HttpServletRequest request, Principal principal) throws NoSuchAlgorithmException {
		ResourceBundle resource = ResourceBundle.getBundle("application");
		//String accountActivationURL = resource.getString("siteUrl");
		JSONObject jsonObject = new JSONObject();
		User users = new User();
		String emailId = request.getParameter("emailId");
		String password = request.getParameter("password");
		String encryptedPassword = null;
		try {
			if(password != null && !password.equals("")) {
				encryptedPassword = EncryptedPasswordGenerator.encryptedPassword(password);
			}
			users.setEmailId(emailId);
			users.setPassword(encryptedPassword);
			users.setUserType("ROLE_ENDUSER");
			users.setStatus("InActive");

			ByAndTimeStamp byAndTimeStamp = new ByAndTimeStamp();
			byAndTimeStamp.setCreatedBy(emailId);
			byAndTimeStamp.setCreatedTs(new Timestamp(new Date().getTime()));
			byAndTimeStamp.setModifiedBy(emailId);
			byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));

			users.setByAndTimeStamp(byAndTimeStamp);
			users = userService.save(users);
			
			if(users != null) {
				jsonObject.put("status", true);
				jsonObject.put("messageOne", "You are successfully registered with us.");
				jsonObject.put("messageTwo", "An email has been sent to your email id for account verification.");
				String subject = resource.getString("name") + " : Registration Confirmation for " + emailId;
				String message = "<html><body>" 
						+ "Dear User<br><br>" 
						+ "Welcome to "+resource.getString("name")+".com<br> "
						+ "You are successfully registered with us.<br><br>"
						/*+ "Click on the below link to activate your " + resource.getString("name") + " account."
						+ "<br><br>" + "<a href=" + accountActivationURL + "/userRegistered?emailId=" + emailId + ">" + accountActivationURL
						+ "/userRegistered?emailId=" + emailId + "</a><br><br>" */
						+ "Team," + "<br>" 
						+ resource.getString("name") + "<br>" 
						+ "Email:" + resource.getString("care") + "<br>" + "</body></html>";
				MailThread send = new MailThread(emailId, subject, message);
				send.start();
			}else {
				jsonObject.put("status", false);
				jsonObject.put("messageOne", "Problem in saving records. Please try again later.");
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonObject.toString();
	}

	@RequestMapping(value = "/userRegistered", method = RequestMethod.GET)
	public String successfullyRegistered(Model model, Map<String, Object> orderMap, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		try {
			String emailId = request.getParameter("emailId");
			int i = userService.updateStatus(emailId);
			if (i > 0) {
				model.addAttribute("successfullyRegistered", "true");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "login";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logoutForm(Model model, @ModelAttribute("users") User users, BindingResult result, Map<String, Object> listMap, SessionStatus status,
			HttpServletRequest request, HttpSession session) {
		session = request.getSession(false);
		session.invalidate();
		model.addAttribute("users", users);
		ModelAndView modelView = new ModelAndView(new RedirectView(""));
		return modelView;

	}

	@RequestMapping(value = "/checkEmailId", method = RequestMethod.POST)
	public void checkEmailId(HttpServletRequest request, HttpServletResponse response) {
		String emailId = request.getParameter("emailId");
		boolean status = userService.checkEmailId(emailId);
		try {
			if (status) {
				response.getWriter().print(true);
			} else {
				response.getWriter().print(false);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value="/forgotPassword",method = RequestMethod.POST)
	public @ResponseBody String sendChangePasswordLink(HttpServletRequest request, HttpServletResponse response,HttpSession session) {
		JSONObject jsonObject = new JSONObject();
		try{
			ResourceBundle resource=ResourceBundle.getBundle("application");
			String accountActivationURL = resource.getString("siteUrl");
			String emailId = request.getParameter("emailId");
			SecureRandom random = new SecureRandom();
			String tempPassword = new BigInteger(15, random).toString();
			String encPassword = EncryptedPasswordGenerator.encryptedPassword(tempPassword);
			
			User user = userService.getEntityByEmailId(User.class, emailId);
			user.setPassword(encPassword);
			
			ByAndTimeStamp byAndTimeStamp = user.getByAndTimeStamp();
			byAndTimeStamp.setModifiedBy(emailId);
			byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));
			
			user = userService.update(user);
			if(user != null) {
				jsonObject.put("status", true);
				jsonObject.put("messageOne", "Your new password has been successfully generated.");
				jsonObject.put("messageTwo", "An email has been sent to your email id with new password.");
				String subject = resource.getString("name")+" : Temporary password for " + emailId;
				String message = "<html><body>"
						     + "Dear User" 
						     +"<br>Your temporary password has been generated.<br>"
						     + "EmailId : "+emailId+"<br>"
						     + "Temporary Password : "+tempPassword+"<br>"
						     + "<br>Regards,"+"<br>"
						     + "<a href="+accountActivationURL+">"
							 + resource.getString("name")+"</a>"+"<br>"
							 + "Email: "+resource.getString("care")+"<br><br>"
							 + "Note : If you find a message wrongly classified as spam, you can unmark the message. "
							 + "Just select the message, and click the Not Spam button that appears at the top and bottom of your "
							 + "current view. Unmarking a message will automatically move it to your inbox."
							 + "</body></html>";
				
				MailThread send = new MailThread(emailId, subject, message);
				send.start();
			}else {
				jsonObject.put("status", false);
				jsonObject.put("messageOne", "Problem in generating password. Please try again later.");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return jsonObject.toString();
		//return "redirect:/query?q=Thymeleaf Is Great!";
	}

	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	public @ResponseBody String changePassword(HttpServletRequest request, Principal principal) throws IOException {
		JSONArray array = new JSONArray();
		JSONObject object = new JSONObject();
		String emailId = principal.getName();
		String newPassword = request.getParameter("newPassword");
		try {
			if(newPassword != null && !"".equals(newPassword)) {
				newPassword = EncryptedPasswordGenerator.encryptedPassword(newPassword);
			}
			User user = userService.findUserByEmail(emailId);
			user.setPassword(newPassword);
			
			ByAndTimeStamp byAndTimeStamp = user.getByAndTimeStamp();
			byAndTimeStamp.setModifiedBy(emailId);
			byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));
			user.setByAndTimeStamp(byAndTimeStamp);
			user = userService.update(user);
			if(user != null) {
				object.put("status", "true");
				object.put("message", Constants._PASSWORD_SUCCESS);
			}else {
				object.put("status", "false");
				object.put("message", Constants._PASSWORD_FAILURE);
			}
			array.put(object);
		} catch (Exception e) {
			e.printStackTrace();
			object.put("status", "false");
			object.put("message", Constants._PASSWORD_FAILURE);
			array.put(object);
		}
		return JSONValue.toJSONString(array);
	}

	@RequestMapping(value = "/dashBoardUser", method = RequestMethod.GET)
	public String dashBoardUser(HttpServletRequest request) {
		request.setAttribute("notTransparent", "true");
		return "dashBoardUser";
	}
	
	@RequestMapping(value = "/userProfile", method = RequestMethod.POST)
	public @ResponseBody String userProfile(HttpServletRequest request, Principal principal) {
		JSONArray array = new JSONArray();
		try {
			List<User> listUser = userService.getEntityListByEmailId(User.class, principal.getName(), null);
			if(!listUser.isEmpty() && listUser != null) {
				array.put(listUser);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JSONValue.toJSONString(array);
	}
	
	@RequestMapping(value = "/addUpdateUser", method = RequestMethod.POST)
	public @ResponseBody String addUpdateUser(HttpServletRequest request, Principal principal) {
		JSONObject object = new JSONObject();
		try {
			
			DateFormat format = new SimpleDateFormat("dd-mm-yyyy");
			String userId = request.getParameter("UserId");
			String name = request.getParameter("name");
			String mobileNumber = request.getParameter("mobile");
			String emailId = request.getParameter("emailAddress");
			String subscriptionStartDate = request.getParameter("startDate");
			String subscriptionEndDate = request.getParameter("endDate");
			String status = request.getParameter("status");
			String password = request.getParameter("password");
			String courses = request.getParameter("courses[]");

			User user = new User();
			if(null != userId){
				user = userService.read(User.class, userId);
			}
			
			user.setName(name);
			user.setContactNumber(mobileNumber);
			user.setEmailId(emailId);
			user.setStartDate(new java.sql.Date(format.parse(subscriptionStartDate).getTime()));
			user.setEndDate(new java.sql.Date(format.parse(subscriptionEndDate).getTime()));
			user.setStatus(status);
			user.setCourse(courses);
			user.setPassword(password);
			user.setUserType("USER");
			
			if(null != userId){
				user = userService.update(user);
			}else{
				user = userService.save(user);
			}
			
			object.put("Record", user);
			object.put("Result", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			object.put("Result", "Error");
			object.put("Message", "Unable to add Course please try again." + e.getMessage());
		}
		return JSONValue.toJSONString(object);
	}

	@RequestMapping("/users")
	public String user(HttpServletRequest request) {
		request.setAttribute("courses", courseService.getAllList(Course.class));
		return "/crud/masterCrudUsers";
	}

	@RequestMapping(value="/listUser")
	public @ResponseBody String listUserDetails(HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		String startIndex = request.getParameter("jtStartIndex");
		String pageSize = request.getParameter("jtPageSize");
		JSONArray jsonArray = new JSONArray();
		
		for (User user : userService.getList(User.class,startIndex,pageSize)) {
			if(!"ROLE_SUPER_ADMIN".equals(user.getUserType())){
				jsonArray.put(user.toJSON());	
			}
		}
		jsonObject.put("Records", jsonArray);
		
		jsonObject.put("Result","OK"); 
		jsonObject.put("TotalRecordCount", userService.getTableRowCount(User.class));
		return jsonObject.toString();
	}
	
	@RequestMapping(value = "/loadUserDetails")
	public @ResponseBody String loadUserDetails(HttpServletRequest request) {

		String UserId = request.getParameter("UserId");
		User onlineTest = userService.read(User.class, UserId);
		return onlineTest.toJSON().toString();
	}
	
	CourseService courseService = AppController.getCourseService();
	
}
