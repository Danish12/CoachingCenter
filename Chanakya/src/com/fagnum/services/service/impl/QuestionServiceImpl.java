package com.fagnum.services.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fagnum.services.dao.QuestionDao;
import com.fagnum.services.model.Question;
import com.fagnum.services.service.QuestionService;

@Service("questionService")
public class QuestionServiceImpl extends AbstractServiceImpl<Question, String> implements QuestionService {

	@Autowired
	@Qualifier("questionDao")
	private QuestionDao questionDao;


}
