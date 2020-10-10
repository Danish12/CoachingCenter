package com.fagnum.services.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fagnum.services.dao.SubjectDao;
import com.fagnum.services.model.Subject;
import com.fagnum.services.service.SubjectService;

@Service("subjectService")
public class SubjectServiceImpl extends AbstractServiceImpl<Subject, String> implements SubjectService {

	@Autowired
	@Qualifier("subjectDao")
	private SubjectDao subjectDao;

	@Override
	public Subject findSubject(String name) {
		return subjectDao.findSubject(name);
	}

}
