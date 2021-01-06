package com.fagnum.controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.fagnum.services.service.AccessDetailsService;
import com.fagnum.services.service.AnswerService;
import com.fagnum.services.service.BlogService;
import com.fagnum.services.service.BloggerService;
import com.fagnum.services.service.CategoryService;
import com.fagnum.services.service.CourseService;
import com.fagnum.services.service.DeactivateService;
import com.fagnum.services.service.DocumentMediaService;
import com.fagnum.services.service.EnquiryService;
import com.fagnum.services.service.FacebookService;
import com.fagnum.services.service.GenreService;
import com.fagnum.services.service.ImageService;
import com.fagnum.services.service.LeaderboardService;
import com.fagnum.services.service.NewsletterService;
import com.fagnum.services.service.OnlineTestService;
import com.fagnum.services.service.QuestionService;
import com.fagnum.services.service.SubjectService;
import com.fagnum.services.service.TwitterTweetService;
import com.fagnum.services.service.UserService;
import com.fagnum.services.service.VideoService;

public class AppController {

	private static ApplicationContext appContext = new ClassPathXmlApplicationContext(new String[] {"applicationContext.xml"});

	private static BlogService blogService;
	private static DocumentMediaService documentMediaService;
	private static BloggerService bloggerService;
	private static CategoryService categoryService;
	private static FacebookService facebookService;
	private static GenreService genreService;
	private static TwitterTweetService twitterTweetService;
	private static DeactivateService deactivateService;
	private static EnquiryService enquiryService;
	private static LeaderboardService leaderboardService;
	private static NewsletterService newsletterService;
	private static UserService userService;
	private static AccessDetailsService accessDetailsService;
	private static CourseService courseService;
	private static SubjectService subjectService;
	private static OnlineTestService onlineTestService;
	private static AnswerService answerService;
	private static QuestionService questionService;
	private static VideoService videoService;
	private static ImageService imageService;

	public static ImageService getImageService() {
		if (imageService == null) {
			imageService = (ImageService) appContext.getBean("imageService");
		}
		return imageService;
	}
	
	public static VideoService getVideoService() {
		if (videoService == null) {
			videoService = (VideoService) appContext.getBean("videoService");
		}
		return videoService;
	}
	
	public static DocumentMediaService getDocumentMediaService() {
		if (documentMediaService == null) {
			documentMediaService = (DocumentMediaService) appContext.getBean("documentMediaService");
		}
		return documentMediaService;
	}
	
	public static OnlineTestService getOnlineTestService() {
		if (onlineTestService == null) {
			onlineTestService = (OnlineTestService) appContext.getBean("onlineTestService");
		}
		return onlineTestService;
	}
	
	public static AnswerService getAnswerService() {
		if (answerService == null) {
			answerService = (AnswerService) appContext.getBean("answerService");
		}
		return answerService;
	}
	
	public static QuestionService getQuestionService() {
		if (questionService == null) {
			questionService = (QuestionService) appContext.getBean("questionService");
		}
		return questionService;
	}
	
	public static SubjectService getSubjectService() {
		if (subjectService == null) {
			subjectService = (SubjectService) appContext.getBean("subjectService");
		}
		return subjectService;
	}

	public static CourseService getCourseService() {
		if (courseService == null) {
			courseService = (CourseService) appContext.getBean("courseService");
		}
		return courseService;
	}

	public static TwitterTweetService getTwitterTweetService() {
		if (twitterTweetService == null) {
			twitterTweetService = (TwitterTweetService) appContext.getBean("twitterTweetService");
		}
		return twitterTweetService;
	}
	
	public static GenreService getGenreService() {
		if (genreService == null) {
			genreService = (GenreService) appContext.getBean("genreService");
		}
		return genreService;
	}
	
	public static CategoryService getCategoryService() {
		if (categoryService == null) {
			categoryService = (CategoryService) appContext.getBean("categoryService");
		}
		return categoryService;
	}
	
	public static UserService getUserService() {
		if (userService == null) {
			userService = (UserService) appContext.getBean("userService");
		}
		return userService;
	}

	public static DeactivateService getDeactivateService() {
		if (deactivateService == null) {
			deactivateService = (DeactivateService) appContext.getBean("deactivateService");
		}
		return deactivateService;
	}

	public static BlogService getBlogService() {
		if (blogService == null) {
			blogService = (BlogService) appContext.getBean("blogService");
		}
		return blogService;
	}

	public static NewsletterService getNewsletterService() {
		if (newsletterService == null) {
			newsletterService = (NewsletterService) appContext.getBean("newsletterService");
		}
		return newsletterService;
	}

	public static BloggerService getBloggerService() {
		if (bloggerService == null) {
			bloggerService = (BloggerService) appContext.getBean("bloggerService");
		}
		return bloggerService;
	}

	public static LeaderboardService getLeaderboardService() {
		if (leaderboardService == null) {
			leaderboardService = (LeaderboardService) appContext.getBean("leaderboardService");
		}
		return leaderboardService;
	}
	
	public static EnquiryService getEnquiryService() {
		if (enquiryService == null) {
			enquiryService = (EnquiryService) appContext.getBean("enquiryService");
		}
		return enquiryService;
	}
	
	public static AccessDetailsService getAccessDetailsService() {
		if (accessDetailsService == null) {
			accessDetailsService = (AccessDetailsService) appContext.getBean("accessDetailsService");
		}
		return accessDetailsService;
	}
	
	public static FacebookService getFacebookService() {
		if (facebookService == null) {
			facebookService = (FacebookService) appContext.getBean("facebookService");
		}
		return facebookService;
	}
}
