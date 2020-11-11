package com.fagnum.services.dao;

import com.fagnum.services.model.Images;

import java.util.List;

public interface ImageDao extends AbstractDao<Images, String> {
	public List<Images> findByImage(String type);

}
