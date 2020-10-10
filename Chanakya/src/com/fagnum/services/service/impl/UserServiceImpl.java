package com.fagnum.services.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fagnum.services.dao.UserDao;
import com.fagnum.services.model.User;
import com.fagnum.services.service.UserService;

@Service("userService")
public class UserServiceImpl extends AbstractServiceImpl<User,String> implements UserService {
	@Autowired
	@Qualifier("userDao")
	private UserDao userDao;

	@Override
	public List<User> isAuthenticate(String email, String password) {
		return userDao.isAuthenticate(email, password);
	}

	@Override
	public User findUserByEmail(String emailId) {
		return userDao.findUsersByEmail(emailId);
	}

	@Override
	public boolean checkEmailId(String emailId) {
		return userDao.checkEmailId(emailId);
	}

	@Override
	public boolean delete(String emailId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int updateStatus(String emailId) {
		return userDao.updateStatus(emailId);
	}

	@Override
	public List<User> getUserOfCompany(String companyId) {
		return userDao.getUserOfCompany(companyId);
	}

}
