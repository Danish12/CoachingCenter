package com.fagnum.services.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fagnum.services.dao.GenreDao;
import com.fagnum.services.model.Genre;
import com.fagnum.services.service.GenreService;

@Service("genreService")
public class GenreServiceImpl extends AbstractServiceImpl<Genre, String> implements GenreService {

	@Autowired
	@Qualifier("genreDao")
	private GenreDao genreDao;
	
}
