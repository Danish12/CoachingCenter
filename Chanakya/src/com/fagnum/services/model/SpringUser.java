package com.fagnum.services.model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

public class SpringUser extends org.springframework.security.core.userdetails.User implements UserDetails {

	private static final long serialVersionUID = 1L;
	private com.fagnum.services.model.User user;

	public SpringUser(User user) {
		super(user.getEmailId(), user.getPassword(), getAuthorities(user.getUserType()));
		this.user = user;

	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "UserImpl [user=" + user + ", getAuthorities()=" + getAuthorities() + "]";
	}

	public static Collection<GrantedAuthority> getAuthorities(String role) {
		List<GrantedAuthority> authList = new ArrayList<GrantedAuthority>(2);
		authList.add(new SimpleGrantedAuthority(role));
		return authList;
	}

	public static User getCurrentUser() {
		SpringUser user = null;
		try {
			user = (SpringUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		} catch (java.lang.ClassCastException e) {
			return null;
		}
		return user.getUser();
	}
}
