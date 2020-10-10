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
import com.fagnum.services.model.Category;
import com.fagnum.services.service.CategoryService;

@Controller
public class CategoryController {
	
	CategoryService categoryService = AppController.getCategoryService();

	/****************************** Category Crud Starts *************************************/
	
	@RequestMapping("/category")
	public String masterCrudCategory(HttpServletRequest request) {
		return "masterCrudCategory";
	}
	
	@RequestMapping(value = "/listCategory")
	public @ResponseBody String listCategory(HttpServletRequest request) {
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();
		String startIndex = request.getParameter("jtStartIndex");
		String pageSize = request.getParameter("jtPageSize");

		List<Category> listCategory = categoryService.getList(Category.class, startIndex, pageSize);
		
		for (Category category : listCategory) {
			jsonArray.put(convertToJson(category));
		}
		jsonObject.put("Records", jsonArray);
		jsonObject.put("Result", "OK");
		jsonObject.put("TotalRecordCount", categoryService.getTableRowCount(Category.class));
		return jsonObject.toString();
	}

	@RequestMapping(value = "/addCategory", method = RequestMethod.POST)
	public @ResponseBody String addCategory(@ModelAttribute("addCategory") Category category, BindingResult result, SessionStatus status,
			HttpServletRequest request, Principal principal) {
		JSONObject jsonObject = new JSONObject();
		ByAndTimeStamp byAndTimeStamp = new ByAndTimeStamp();
		try {

			byAndTimeStamp.setCreatedBy(principal.getName());
			byAndTimeStamp.setCreatedTs(new Timestamp(new Date().getTime()));
			byAndTimeStamp.setModifiedBy(principal.getName());
			byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));

			category.setByAndTimeStamp(byAndTimeStamp);
			category = categoryService.save(category);

			jsonObject.put("Record", category);
			jsonObject.put("Result", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			jsonObject.put("Result", "Error");
			jsonObject.put("Message", "Unable to add category please try again.");
		}
		return jsonObject.toString();

	}

	@RequestMapping(value = "/editCategory", method = RequestMethod.POST)
	public @ResponseBody String editCategory(@ModelAttribute("addCategory") Category category, BindingResult result, SessionStatus status,
			HttpServletRequest request, Principal principal) {
		JSONObject jsonObject = new JSONObject();
		try {
			Category category2 = categoryService.read(Category.class, category.getCategoryId());
			ByAndTimeStamp byAndTimeStamp = category2.getByAndTimeStamp();
			byAndTimeStamp.setModifiedBy(principal.getName());
			byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));
			
			category.setByAndTimeStamp(byAndTimeStamp);

			categoryService.update(category);
			jsonObject.put("Record", category);
			jsonObject.put("Result", "OK");

		} catch (Exception e) {
			e.printStackTrace();
			jsonObject.put("Result", "Error");
			jsonObject.put("Message", "Unable to update category please try again.");
		}
		return jsonObject.toString();

	}

	private JSONObject convertToJson(Category category) {
		JSONObject object = new JSONObject();
		object.put("categoryId", category.getCategoryId());
		object.put("name", category.getName());
		object.put("url", category.getUrl());
		object.put("title", category.getTitle());
		object.put("metaDescription", category.getMetaDescription());
		object.put("status", category.getStatus());
		object.put("action", "<div class='col-lg-2'><div class='form-group'>"
				+ "<a class='btn btn-primary btn pull-left' data-toggle='modal' href='#searchModal' style='color: white; padding: 0px 6px;' "
				+ "onclick='loadCategoryDetail(\""+category.getCategoryId()+"\", \""+category.getName()+"\", \""+category.getUrl()+"\", "
				+ "\""+category.getStatus()+"\", \""+category.getMetaDescription()+"\", \""+category.getTitle()+"\")'> Update Category</a></div></div>");
		return object;
	}
	
	/****************************** Category Crud Ends *************************************/
}
