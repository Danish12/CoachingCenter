package com.fagnum.services.dao;

import com.fagnum.services.model.Subject;

public interface SubjectDao extends AbstractDao<Subject, String> {
	public Subject findSubject(String name);

}
