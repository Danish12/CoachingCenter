package com.fagnum.services.service;

import com.fagnum.services.model.Images;

import java.util.List;

public interface ImageService extends AbstractService<Images, String> {

	public List<Images> findByImage(String type);

}
