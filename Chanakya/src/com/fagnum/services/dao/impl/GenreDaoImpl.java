package com.fagnum.services.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.fagnum.services.dao.GenreDao;
import com.fagnum.services.model.Genre;

@Repository("genreDao")
public class GenreDaoImpl extends AbstractDaoImpl<Genre, String> implements GenreDao {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
}
