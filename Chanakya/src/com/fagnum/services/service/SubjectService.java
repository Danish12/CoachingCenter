package com.fagnum.services.service;

import com.fagnum.services.model.Subject;

public interface SubjectService extends AbstractService<Subject, String> {
	public Subject findSubject(String name);

}
