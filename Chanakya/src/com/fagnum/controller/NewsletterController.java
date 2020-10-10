package com.fagnum.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fagnum.services.model.ByAndTimeStamp;
import com.fagnum.services.model.Newsletter;
import com.fagnum.services.service.NewsletterService;
import com.fagnum.services.util.MailThread;

@Controller
public class NewsletterController {

	NewsletterService newsletterService = AppController.getNewsletterService();
	
	@RequestMapping(value="/saveNewsletter",method = RequestMethod.POST)
	public @ResponseBody String saveNewsletter(HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		Newsletter  newsletter = new Newsletter();
		try{
			ResourceBundle resource=ResourceBundle.getBundle("application");
			String emailId = request.getParameter("emailId");
			
			if(emailId != null && !emailId.equals("")) {
				newsletter.setEmailId(emailId);
			}else {
				newsletter.setEmailId("NA");
			}
			newsletter.setStatus("Active");
			newsletter.setReason("NA");
			ByAndTimeStamp byAndTimeStamp = new ByAndTimeStamp();
			byAndTimeStamp.setCreatedBy(emailId);
			byAndTimeStamp.setCreatedTs(new Timestamp(new Date().getTime()));
			byAndTimeStamp.setModifiedBy(emailId);
			byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));
			newsletter.setByAndTimeStamp(byAndTimeStamp);
			
			Newsletter newsletterCheck = newsletterService.getEntityByEmailId(Newsletter.class, emailId);
			if(newsletterCheck == null) {
				newsletter = newsletterService.save(newsletter);
				jsonObject.put("status", true);
				jsonObject.put("messageOne", "Thanks for signing up to Fagnum newsletter.");
				jsonObject.put("messageTwo", "An email has been sent for the same.");
				String subject = resource.getString("name")+" : Welcome to our Newsletter";
				String message = "<html><body>"
						     + "Hey User" +"<br><br>"
						     + "Thanks for signing up to Fagnum newsletter.<br>"
						     + "<br>Regards,"+"<br>"
						     + "Team Fagnum,"+"<br>"
							 + "Email: "+resource.getString("care")+"<br>"
							 + "Note : If you find a message wrongly classified as spam, you can unmark the message. "
							 + "Just select the message, and click the Not Spam button that appears at the top and bottom of your "
							 + "current view. Unmarking a message will automatically move it to your inbox."
							 + "</body></html>";
				
				MailThread send = new MailThread(emailId, subject, message);
				send.start();
			}else {
				jsonObject.put("status", false);
				jsonObject.put("messageOne", "Problem in emailId. Please try again later.");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return jsonObject.toString();
	}
	
}
