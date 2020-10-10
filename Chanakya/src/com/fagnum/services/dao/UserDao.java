package com.fagnum.services.dao;

import java.util.List;

import com.fagnum.services.model.User;

public interface UserDao extends AbstractDao<User,String> {

	List<User> isAuthenticate(String email, String password);

	boolean checkEmailId(String emailId);

	boolean delete(String emailId);

	int updateStatus(String emailId);

	User findUsersByEmail(String emailId);
	
	List<User> getUserOfCompany(String companyId);
	
}
