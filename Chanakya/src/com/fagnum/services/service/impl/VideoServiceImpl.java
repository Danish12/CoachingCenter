package com.fagnum.services.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fagnum.services.dao.VideoDao;
import com.fagnum.services.model.Video;
import com.fagnum.services.service.VideoService;

@Service("videoService")
public class VideoServiceImpl extends AbstractServiceImpl<Video, String> implements VideoService {

	@Autowired
	@Qualifier("videoDao")
	private VideoDao videoDao;

	@Override
	public List<Video> findByCourse(String courseId, String startIndex, String pageSize) {
		return videoDao.findByCourse(courseId, startIndex, pageSize);
	}

	@Override
	public List<Video> findByCourseAndSubject(String courseId, String subjectId, String startIndex, String pageSize) {
		return videoDao.findByCourseAndSubject(courseId, subjectId, startIndex, pageSize);
	}

}
