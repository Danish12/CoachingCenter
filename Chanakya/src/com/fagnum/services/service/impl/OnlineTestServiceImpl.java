package com.fagnum.services.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fagnum.services.dao.OnlineTestDao;
import com.fagnum.services.model.OnlineTest;
import com.fagnum.services.service.OnlineTestService;

import java.util.List;

@Service("onlineTestService")
public class OnlineTestServiceImpl extends AbstractServiceImpl<OnlineTest, String> implements OnlineTestService {

	@Autowired
	@Qualifier("onlineTestDao")
	private OnlineTestDao onlineTestDao;

	@Override
	public List<OnlineTest> findByCourse(String courseId, String startIndex, String pageSize) {
		return onlineTestDao.findByCourse(courseId, startIndex, pageSize);
	}

	@Override
	public List<OnlineTest> findByCourseAndSubject(String courseId, String subjectId, String startIndex, String pageSize) {
		return onlineTestDao.findByCourseAndSubject(courseId, subjectId, startIndex, pageSize);
	}
}
