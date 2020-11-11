package com.fagnum.services.util;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SessionFactory {

	private static ClassPathXmlApplicationContext appContext = new ClassPathXmlApplicationContext(new String[] {"main/resources/applicationContext.xml"});

	private static org.hibernate.SessionFactory sessionFactory;

	public static org.hibernate.SessionFactory getSessionFactory() {

		if (sessionFactory == null) {
			sessionFactory = (org.hibernate.SessionFactory) appContext.getBean("sessionFactory");
		}
		return sessionFactory;
	}
}
