package com.fagnum.services.util;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

public class MailThread extends Thread {

	private final int TIMEOUT = 10;
	String emailId, subject, message;

	public MailThread(String emailId, String subject, String message) {
		this.emailId = emailId;
		this.subject = subject;
		this.message = message;
	}

	public void run() {
		try {
			Thread.sleep(TIMEOUT);
			SendMail sendMail = new SendMail();
			sendMail.sendMail(emailId, subject, message);
		} catch (InterruptedException ex) {
			ex.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
