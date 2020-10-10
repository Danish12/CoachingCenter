package com.fagnum.services.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fagnum.services.dao.AnswerDao;
import com.fagnum.services.model.Answer;
import com.fagnum.services.service.AnswerService;

@Service("answerService")
public class AnswerServiceImpl extends AbstractServiceImpl<Answer, String> implements AnswerService {

	@Autowired
	@Qualifier("answerDao")
	private AnswerDao answerDao;


}
