package com.fagnum.test;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.fagnum.services.model.Blog;
import com.fagnum.services.service.BlogService;
import com.fagnum.services.util.Constants;

public class TwitterTweetTest {

	@Autowired
	public static ClassPathXmlApplicationContext appContext = null;
	
	public static void main(String [] args) {
		
		appContext = new ClassPathXmlApplicationContext(new String[] {"main/resources/applicationContext.xml"});
		BlogService blogService = (BlogService) appContext.getBean("blogService");
		Blog blog = new Blog();
		
		List<Object> parameterList = new ArrayList<Object>();
		parameterList.add("how");
		parameterList.add(Constants._PUBLISH);
		String query = new String("from Blog blog where blog.title LIKE ? and blog.status = ? order by blog.blogId desc");
		List<Blog> list = blogService.getDynamicList(parameterList, query);
		for (Blog Blog2 : list) {
			blog = Blog2;
		}
		
		System.out.println("BlogTest.main() : "+blog.getTitle());
	}
}
