package com.fagnum.controller;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.fagnum.services.model.SpringUser;
import com.fagnum.services.model.User;
import com.fagnum.services.service.UserService;

public class UserLoginController implements UserDetailsService {

	private UserService userService = AppController.getUserService();

	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {

		User user = userService.findUserByEmail(userName);
		UserDetails userDetails = new SpringUser(user);
		return userDetails;
	}
}
