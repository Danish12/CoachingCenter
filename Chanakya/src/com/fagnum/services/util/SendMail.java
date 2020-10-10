package com.fagnum.services.util;

import java.io.UnsupportedEncodingException;
import java.util.Properties;
import java.util.ResourceBundle;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {

	public void sendMail(String emailTo, String subject, String messageStr) throws UnsupportedEncodingException, MessagingException {

		ResourceBundle resource = ResourceBundle.getBundle("application");

		if ("isProd".equals(resource.getString("isProd"))) {
			final String username = "care@fagnum.com";
			final String password = "InfoFagnum";

			Properties props = new Properties();

			String host = resource.getString("host");
			props.put("mail.host", host);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", resource.getString("port"));
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.starttls.enable", "true");

			Session session = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username, resource.getString("name")));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailTo));
			message.addRecipients(Message.RecipientType.BCC, InternetAddress.parse("care@fagnum.com"));
			message.addRecipients(Message.RecipientType.BCC, InternetAddress.parse("mohdwasi2903@gmail.com"));
			message.setSubject(subject);
			message.setContent(messageStr, "text/html; charset=utf-8");
			Transport.send(message);
		}

	}

	/*
	 * public static void main(String[] args) { try { new
	 * SendMail().sendMail("mohddanish27744@gmail.com", "DANIS",
	 * "DANISH IS SENDING YOU A MAIL"); } catch (UnsupportedEncodingException |
	 * MessagingException e) { e.printStackTrace(); } }
	 */
}
