package com.fagnum.services.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fagnum.services.dao.QuestionDao;
import com.fagnum.services.model.Question;

@Repository("questionDao")
public class QuestionDaoImpl extends AbstractDaoImpl<Question, String> implements QuestionDao {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
}
