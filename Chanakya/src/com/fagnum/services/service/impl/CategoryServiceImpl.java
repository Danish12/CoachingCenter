package com.fagnum.services.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fagnum.services.dao.CategoryDao;
import com.fagnum.services.model.Category;
import com.fagnum.services.service.CategoryService;

@Service("categoryService")
public class CategoryServiceImpl extends AbstractServiceImpl<Category, String> implements CategoryService {

	@Autowired
	@Qualifier("categoryDao")
	private CategoryDao categoryDao;
	
}
