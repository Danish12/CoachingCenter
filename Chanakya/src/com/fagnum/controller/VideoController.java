package com.fagnum.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.Principal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fagnum.services.model.ByAndTimeStamp;
import com.fagnum.services.model.Course;
import com.fagnum.services.model.Subject;
import com.fagnum.services.model.Video;
import com.fagnum.services.service.CategoryService;
import com.fagnum.services.service.CourseService;
import com.fagnum.services.service.SubjectService;
import com.fagnum.services.service.VideoService;

@Controller
@RequestMapping

public class VideoController {

	private String fileUploadDirectory = "/chanakya";
	CategoryService categoryService = AppController.getCategoryService();
	CourseService courseService = AppController.getCourseService();
	SubjectService subjectService = AppController.getSubjectService();
	VideoService videoService = AppController.getVideoService();

	@RequestMapping("/videos")
	public String index(HttpServletRequest request) {
		request.setAttribute("courses", courseService.getAllList(Course.class));
		request.setAttribute("subjects", subjectService.getAllList(Subject.class));

		return "/crud/masterCrudVideo";
	}

	@RequestMapping("/videos2")
	public String videoUpload2() {
		return "videoUpload2";
	}

	@RequestMapping("/watch-videos")
	public String watchVideos(HttpServletRequest request) {

		request.setAttribute("videos", videoService.getAllList(Video.class));
		request.setAttribute("courses", courseService.getAllList(Course.class));

		return "videosDetails";
	}

	@RequestMapping("/watch-videos/{courseName}")
	public String watchVideosCourse(@PathVariable("courseName") String courseName, HttpServletRequest request) {

		Course course = courseService.findCourse(courseName);
		if (null == course) {
			return "errorPage";
		}

		request.setAttribute("videos", videoService.findByCourse(course.getCourseId(), "0", "10"));
		request.setAttribute("course", course);

		return "videosDetails";
	}

	@RequestMapping("/watch-videos/{courseName}/{subjectName}")
	public String watchVideosCourseSubject(@PathVariable("courseName") String courseName,
			@PathVariable("subjectName") String subjectName, HttpServletRequest request) {

		Course course = courseService.findCourse(courseName);
		if (null == course) {
			return "errorPage";
		}

		Subject subject = subjectService.findSubject(subjectName);

		request.setAttribute("videos",
				videoService.findByCourseAndSubject(course.getCourseId(), subject.getSubjectId(), "0", "10"));
		request.setAttribute("course", course);

		return "videosDetails";
	}

	@RequestMapping("/load-video")
	public String loadVideo(HttpServletRequest request) {

		request.setAttribute("videos", videoService.getAllList(Video.class));

		return "videosDetails";
	}

	@RequestMapping(value = "/listVideo", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String listVideo(HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		String startIndex = request.getParameter("jtStartIndex");
		String pageSize = request.getParameter("jtPageSize");

		List<Object> parameterList = new ArrayList<Object>();
		// parameterList.add("ACTIVE");
		// parameterList.add("DEACTIVE");

		// boolean isSearch = ServletRequestUtils.getBooleanParameter(request,
		// "search", false);
		List<Video> list = null;

		String query = "";

		query = new String("from Video");
		list = videoService.getDynamicList(parameterList, query, startIndex, pageSize);

		for (Video video : list) {
			jsonArray.put(video.toJSON());
		}
		jsonObject.put("Records", jsonArray);
		jsonObject.put("Result", "OK");
		jsonObject.put("TotalRecordCount", videoService.getTableRowCount(Video.class));
		return jsonObject.toString();
	}

	@RequestMapping(value = "/loadVideoDetails")
	public @ResponseBody String loadVideoDetails(HttpServletRequest request) {

		String videoId = request.getParameter("videoId");
		Video video = videoService.read(Video.class, videoId);
		return video.toJSON().toString();
	}

	@RequestMapping(value = "/addUpdateVideo")
	public @ResponseBody String addVideo(HttpServletRequest request, Principal principal) {

		org.json.JSONObject jsonObject = new org.json.JSONObject();

		String name = request.getParameter("name");
		String isPrime = request.getParameter("isPrime");
		String status = request.getParameter("status");
		String videoId = request.getParameter("VideoId");
		String[] courses = request.getParameterValues("courses[]");
		String[] subjects = request.getParameterValues("subjects[]");
		String action = request.getParameter("action");
		String videoLocation = request.getParameter("videoLocation");

		Video video = new Video();
		if (videoId != null && !videoId.equals("")) {
			video = videoService.read(Video.class, videoId);

		}
		if (videoLocation != null) {
			video.setVideoLocation(videoLocation);
		}

		video.setIsPrime(Boolean.valueOf(isPrime));
		video.setStatus(status);
		video.setName(name);

		if (null != courses) {
			Set<Course> coursesSet = new java.util.HashSet<>();
			for (String course : courses) {
				coursesSet.add(courseService.read(Course.class, course));
			}
			video.setCourses(coursesSet);
		}

		if (null != subjects) {
			Set<Subject> subjectsSet = new java.util.HashSet<>();
			for (String subject : subjects) {
				subjectsSet.add(subjectService.read(Subject.class, subject));
			}
			video.setSubjects(subjectsSet);
		}

		try {
			ByAndTimeStamp byAndTimeStamp = new ByAndTimeStamp();
			if (action.equals("ADD")) {
				byAndTimeStamp.setCreatedBy("");
				byAndTimeStamp.setCreatedTs(new Timestamp(new Date().getTime()));
				byAndTimeStamp.setModifiedBy("");
				byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));
				video.setByAndTimeStamp(byAndTimeStamp);
				videoService.save(video);
			} else {
				byAndTimeStamp = video.getByAndTimeStamp();
				byAndTimeStamp.setModifiedBy(principal.getName());
				byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));
				video.setByAndTimeStamp(byAndTimeStamp);
				videoService.update(video);
			}
			jsonObject.put("Record", video.toJSON());
			jsonObject.put("Result", "OK");
		} catch (Exception e) {
			jsonObject.put("Result", "Error");
			jsonObject.put("Message", "Unable to add Course please try again." + e.getMessage());
		}

		return jsonObject.toString();

	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST, headers = "Accept=*/*", produces = "application/json")
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody String upload1(MultipartHttpServletRequest request, HttpServletResponse response) {

		org.json.JSONObject jsonObject = new org.json.JSONObject();
		jsonObject.put("resp", "OK");
		Iterator<String> itr = request.getFileNames();
		MultipartFile mpf;

		while (itr.hasNext()) {
			mpf = request.getFile(itr.next());

			String newFilenameBase = UUID.randomUUID().toString();
			String originalFileExtension = mpf.getOriginalFilename()
					.substring(mpf.getOriginalFilename().lastIndexOf("."));
			String newFilename = newFilenameBase + originalFileExtension;
			String storageDirectory = fileUploadDirectory;
			// String contentType = mpf.getContentType();

			File directory = new File(fileUploadDirectory);
			File newFile = new File(storageDirectory + "/" + newFilename);
			if (!directory.exists()) {
				directory.mkdir();
			}
			try {
				mpf.transferTo(newFile);

				/*
				 * String thumbnailFilename = newFilenameBase +
				 * "-thumbnail.png"; File thumbnailFile = new
				 * File(storageDirectory + "/" + thumbnailFilename);
				 */

				jsonObject.put("videoLocation", newFile.getPath());

			} catch (IOException e) {
				e.printStackTrace();
				jsonObject.put("resp", "Error while uploading file " + e.getMessage());
			}

		}
		return jsonObject.toString();
	}

	@RequestMapping(value = "/picture/{id}", method = RequestMethod.GET)
	public void picture(HttpServletResponse response, @PathVariable Long id) {
		File imageFile = new File(fileUploadDirectory + "/" + "test.jpg");
		response.setContentType("");
		response.setContentLength(2345678);
		try {
			InputStream is = new FileInputStream(imageFile);
			IOUtils.copy(is, response.getOutputStream());
		} catch (IOException e) {
		}
	}

	@RequestMapping(value = "/thumbnail/{id}", method = RequestMethod.GET)
	public void thumbnail(HttpServletResponse response, @PathVariable Long id) {
		File imageFile = new File(fileUploadDirectory + "/" + "test.jpg");
		response.setContentType("");
		response.setContentLength(2345678);
		try {
			InputStream is = new FileInputStream(imageFile);
			IOUtils.copy(is, response.getOutputStream());
		} catch (IOException e) {
		}
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	public @ResponseBody List<Map<String, Object>> delete(@PathVariable Long id) {
		List<Map<String, Object>> results = new ArrayList<>();
		Map<String, Object> success = new HashMap<>();
		success.put("success", true);
		results.add(success);
		return results;
	}

}
