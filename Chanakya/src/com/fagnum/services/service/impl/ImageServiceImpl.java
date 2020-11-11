package com.fagnum.services.service.impl;

import com.fagnum.services.dao.ImageDao;
import com.fagnum.services.model.Images;
import com.fagnum.services.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("imageService")
public class ImageServiceImpl extends AbstractServiceImpl<Images, String> implements ImageService {

	@Autowired
	@Qualifier("imageDao")
	private ImageDao imageDao;

	@Override
	public List<Images> findByImage(String type) {
		return imageDao.findByImage(type);
	}

}
