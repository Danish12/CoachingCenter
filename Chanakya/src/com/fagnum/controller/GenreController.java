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
import com.fagnum.services.model.Genre;
import com.fagnum.services.service.GenreService;

@Controller
public class GenreController {
	
	GenreService genreService = AppController.getGenreService();

	/****************************** Genre Crud Starts *************************************/
	
	@RequestMapping("/genre")
	public String masterCrudGenre(HttpServletRequest request) {
		return "masterCrudGenre";
	}
	
	@RequestMapping(value = "/listGenre")
	public @ResponseBody String listGenre(HttpServletRequest request) {
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();
		String startIndex = request.getParameter("jtStartIndex");
		String pageSize = request.getParameter("jtPageSize");

		List<Genre> listGenre = genreService.getList(Genre.class, startIndex, pageSize);
		
		for (Genre genre : listGenre) {
			jsonArray.put(convertToJson(genre));
		}
		jsonObject.put("Records", jsonArray);
		jsonObject.put("Result", "OK");
		jsonObject.put("TotalRecordCount", genreService.getTableRowCount(Genre.class));
		return jsonObject.toString();
	}

	@RequestMapping(value = "/addGenre", method = RequestMethod.POST)
	public @ResponseBody String addGenre(@ModelAttribute("addGenre") Genre genre, BindingResult result, SessionStatus status,
			HttpServletRequest request, Principal principal) {
		JSONObject jsonObject = new JSONObject();
		ByAndTimeStamp byAndTimeStamp = new ByAndTimeStamp();
		try {

			byAndTimeStamp.setCreatedBy(principal.getName());
			byAndTimeStamp.setCreatedTs(new Timestamp(new Date().getTime()));
			byAndTimeStamp.setModifiedBy(principal.getName());
			byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));

			genre.setByAndTimeStamp(byAndTimeStamp);
			genre = genreService.save(genre);

			jsonObject.put("Record", genre);
			jsonObject.put("Result", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			jsonObject.put("Result", "Error");
			jsonObject.put("Message", "Unable to add genre please try again.");
		}
		return jsonObject.toString();

	}

	@RequestMapping(value = "/editGenre", method = RequestMethod.POST)
	public @ResponseBody String editGenre(@ModelAttribute("addGenre") Genre genre, BindingResult result, SessionStatus status,
			HttpServletRequest request, Principal principal) {
		JSONObject jsonObject = new JSONObject();
		try {
			Genre genre2 = genreService.read(Genre.class, genre.getGenreId());
			ByAndTimeStamp byAndTimeStamp = genre2.getByAndTimeStamp();
			byAndTimeStamp.setModifiedBy(principal.getName());
			byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));
			
			genre.setByAndTimeStamp(byAndTimeStamp);

			genreService.update(genre);
			jsonObject.put("Record", genre);
			jsonObject.put("Result", "OK");

		} catch (Exception e) {
			e.printStackTrace();
			jsonObject.put("Result", "Error");
			jsonObject.put("Message", "Unable to update genre please try again.");
		}
		return jsonObject.toString();

	}

	private JSONObject convertToJson(Genre genre) {
		JSONObject object = new JSONObject();
		object.put("genreId", genre.getGenreId());
		object.put("name", genre.getName());
		object.put("url", genre.getUrl());
		object.put("status", genre.getStatus());
		object.put("action", "<div class='col-lg-2'><div class='form-group'>"
				+ "<a class='btn btn-primary btn pull-left' data-toggle='modal' href='#searchModal' style='color: white; padding: 0px 6px;' "
				+ "onclick='loadGenreDetail(\""+genre.getGenreId()+"\", \""+genre.getName()+"\", \""+genre.getUrl()+"\", "
				+ "\""+genre.getStatus()+"\")'> Update Genre</a></div></div>");
		return object;
	}
	
	/****************************** Genre Crud Ends *************************************/
}
