package com.fagnum.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.security.Principal;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fagnum.services.model.ByAndTimeStamp;
import com.fagnum.services.model.Images;
import com.fagnum.services.service.ImageService;

@Controller
public class ImageUploadController {

	@Autowired
	ServletContext context;

	ImageService imageService = AppController.getImageService();

	@RequestMapping("/images")
	public String masterCrudImages(HttpServletRequest request) {

		List<Images> images = imageService.getList(Images.class, "0", "100");
		request.setAttribute("images", images);
		return "/crud/masterCrudImages";
	}

	@RequestMapping(value = "/listImages")
	public @ResponseBody String listCourse(HttpServletRequest request) {
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();
		String startIndex = request.getParameter("jtStartIndex");
		String pageSize = request.getParameter("jtPageSize");

		List<Images> listImages = imageService.getList(Images.class, startIndex, pageSize);

		for (Images image : listImages) {
			jsonArray.put(convertToJson(image));
		}
		jsonObject.put("Records", jsonArray);
		jsonObject.put("Result", "OK");
		jsonObject.put("TotalRecordCount", imageService.getTableRowCount(Images.class));

		return jsonObject.toString();
	}

	@RequestMapping(value = "/addImages", method = RequestMethod.POST)
	public  String addCourse(@ModelAttribute("addImages") Images images,
			@RequestParam("upload") MultipartFile file, Principal principal) {
		JSONObject jsonObject = new JSONObject();
		ByAndTimeStamp byAndTimeStamp = new ByAndTimeStamp();
		try {

			JSONObject saveImage = saveImage(file);
			images.setUrl(saveImage.getString("url"));
			
			images.setType("HOME_SLIDER");

			byAndTimeStamp.setCreatedBy(principal.getName());
			byAndTimeStamp.setCreatedTs(new Timestamp(new Date().getTime()));
			byAndTimeStamp.setModifiedBy(principal.getName());
			byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));

			images.setByAndTimeStamp(byAndTimeStamp);
			images = imageService.save(images);

			jsonObject.put("Record", images);
			jsonObject.put("Result", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			jsonObject.put("Result", "Error");
			jsonObject.put("Message", "Unable to add Course please try again.");
		}
		return "/crud/masterCrudImages";

	}

	@RequestMapping(value = "/deleteImage", method = RequestMethod.GET)
	public String deleteImage(@ModelAttribute("imageId") String imageId) {
		JSONObject jsonObject = new JSONObject();
		try {

			Images image = imageService.read(Images.class, imageId);
			imageService.delete(image);
			jsonObject.put("Result", "OK");

		} catch (Exception e) {
			e.printStackTrace();
			jsonObject.put("Result", "Error");
			jsonObject.put("Message", "Unable to update Course please try again.");
		}
		return "/crud/masterCrudImages";

	}

	private JSONObject convertToJson(Images image) {
		JSONObject object = new JSONObject();
		object.put("CourseId", image.getImageId());
		object.put("description", image.getDescription());
		object.put("url", image.getUrl());
		object.put("action",
				"<div class='col-lg-2'><div class='form-group'>"
						+ "<a class='btn btn-primary btn pull-left' data-toggle='modal' href='deleteImage?imageId=" +
						image.getImageId()+"' style='color: white; padding: 0px 6px;' "
						+ "\" )'>Delete</a></div></div>");
		return object;
	}

	@RequestMapping(value = "/ImageUploader/upload", method = RequestMethod.POST)
	public @ResponseBody String saveImages(HttpServletRequest request, @RequestParam("upload") MultipartFile file) {

		return saveImage(file).toString();

	}

	private JSONObject saveImage(MultipartFile file) {
		JSONObject jsonObject = new JSONObject();
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				jsonObject.put("fileName", file.getOriginalFilename());

				String fileDIR = context.getInitParameter("dir");

				File dir = new File(fileDIR);
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath() + File.separator + file.getOriginalFilename());
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
				jsonObject.put("uploaded", "1");
				jsonObject.put("url", "/blogImage?file=" + file.getOriginalFilename());
			} catch (Exception e) {
				jsonObject.put("uploaded", "0");
				jsonObject.put("responseText", "You failed to upload " + file.getName() + " => " + e.getMessage());
			}
		} else {
			jsonObject.put("uploaded", "0");
		}
		return jsonObject;

	}

}
