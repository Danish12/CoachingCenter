package com.fagnum.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ResourceBundle;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fagnum.services.model.DocumentMedia;
import com.fagnum.services.service.DocumentMediaService;
import com.fagnum.services.service.OnlineTestService;

@Controller
public class ImageUploadController {

	@Autowired
	ServletContext context;
	
	ResourceBundle resource = ResourceBundle.getBundle("application");
	DocumentMediaService documentMediaService = AppController.getDocumentMediaService();
	
	@RequestMapping(value = "/BCKImageUploader/upload", method = RequestMethod.POST)
	public @ResponseBody String saveBCKNewsletter(HttpServletRequest request, @RequestParam("upload") MultipartFile file) {

		JSONObject jsonObject = new JSONObject();
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				jsonObject.put("fileName", file.getOriginalFilename());
				
				DocumentMedia documnet = new DocumentMedia();
				documnet.setDocument(bytes);
				
				DocumentMedia document = documentMediaService.save(documnet);

				jsonObject.put("uploaded", "1");
				jsonObject.put("url", resource.getString("site.url.for.image") + "/blogImage?file=" + document);
			} catch (Exception e) {
				jsonObject.put("uploaded", "0");
				jsonObject.put("responseText", "You failed to upload " + file.getName() + " => " + e.getMessage());
			}
		} else {
			jsonObject.put("uploaded", "0");
		}
		return jsonObject.toString();
	}

	@RequestMapping(value = "/ImageUploader/upload", method = RequestMethod.POST)
	public @ResponseBody String saveNewsletter(HttpServletRequest request, @RequestParam("upload") MultipartFile file) {

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
				jsonObject.put("url", resource.getString("site.url.for.image") + "/blogImage?file=" + file.getOriginalFilename());
			} catch (Exception e) {
				jsonObject.put("uploaded", "0");
				jsonObject.put("responseText", "You failed to upload " + file.getName() + " => " + e.getMessage());
			}
		} else {
			jsonObject.put("uploaded", "0");
		}
		return jsonObject.toString();
	}
	
	

}
