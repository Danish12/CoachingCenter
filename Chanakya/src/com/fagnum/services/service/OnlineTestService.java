package com.fagnum.services.service;

import com.fagnum.services.model.OnlineTest;


import java.util.List;

public interface OnlineTestService extends AbstractService<OnlineTest, String> {

    List<OnlineTest> findByCourse(String courseId, String startIndex, String pageSize);
    List<OnlineTest> findByCourseAndSubject(String courseId, String subjectId, String startIndex, String pageSize);
}
