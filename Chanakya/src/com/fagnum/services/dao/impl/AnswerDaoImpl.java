package com.fagnum.services.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fagnum.services.dao.AnswerDao;
import com.fagnum.services.model.Answer;

@Repository("answerDao")
public class AnswerDaoImpl extends AbstractDaoImpl<Answer, String> implements AnswerDao {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
}
