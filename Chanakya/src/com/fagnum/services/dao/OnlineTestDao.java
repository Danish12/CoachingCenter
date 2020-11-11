package com.fagnum.services.dao;

import com.fagnum.services.model.OnlineTest;


import java.util.List;

public interface OnlineTestDao extends AbstractDao<OnlineTest, String> {

    List<OnlineTest> findByCourseAndSubject(String courseId, String subjectId, String startIndex, String pageSize);

    List<OnlineTest> findByCourse(String courseId, String startIndex, String pageSize);
}
