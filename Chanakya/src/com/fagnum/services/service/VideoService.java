package com.fagnum.services.service;

import java.util.List;

import com.fagnum.services.model.Video;

public interface VideoService extends AbstractService<Video, String> {

	public List<Video> findByCourse(String courseId, String startIndex, String pageSize);

	public List<Video> findByCourseAndSubject(String courseId, String subjectId, String startIndex, String pageSize);

}
