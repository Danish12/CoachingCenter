package com.fagnum.services.util;

import javax.servlet.http.HttpServletRequest;

import com.fagnum.services.model.Course;
import com.fagnum.services.model.SpringUser;
import com.fagnum.services.model.User;

public class UserUtil {
  public static boolean isPrime(HttpServletRequest request, Course course){
	  boolean isPrime = false;
		
		User currentUser = SpringUser.getCurrentUser();
		if (currentUser != null) {
			if(currentUser.getCourse().contains(course.getCourseId())){
				isPrime = true;	
			}
		}
		
		return isPrime;
  }
}
