package com.fagnum.services.service;

import java.util.List;

import com.fagnum.services.model.User;

public interface UserService extends AbstractService<User,String> {
	
	List<User> isAuthenticate(String email, String password);
	
	boolean checkEmailId(String emailId);
	
	boolean delete(String emailId);
	
	int updateStatus(String emailId);

	User findUserByEmail(String emailId);
	
	List<User> getUserOfCompany(String companyId);
	
}
