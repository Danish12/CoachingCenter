package com.fagnum.services.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fagnum.services.dao.DocumentMediaDao;
import com.fagnum.services.model.DocumentMedia;
import com.fagnum.services.service.DocumentMediaService;

@Service("documentMediaService")
public class DocumentMediaServiceImpl extends AbstractServiceImpl<DocumentMedia, String> implements DocumentMediaService {

	@Autowired
	@Qualifier("documentMediaDao")
	private DocumentMediaDao documentMediaDao;


}
