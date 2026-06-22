package com.jsp.ojpms.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtil {

	private static final String FROM = "arpitpatidar9179@gmail.com";
	private static final String PASSWORD = "piqehbjlyfhakdad";

	public static void sendEmail(String to, String subject, String textMessage) {

		Properties proObj = new Properties();

		proObj.put("mail.smtp.host", "smtp.gmail.com");
		proObj.put("mail.smtp.port", "587");
		proObj.put("mail.smtp.auth", "true");
		proObj.put("mail.smtp.starttls.enable", "true");

		Session session = Session.getInstance(proObj, new Authenticator() {
			
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				
				return new PasswordAuthentication(FROM,PASSWORD);
			}
			
		});

		try {
			Message message = new MimeMessage(session);
			
			message.setSubject(subject);
			message.setText(textMessage);
			message.setFrom(new InternetAddress(FROM));
			
			RecipientType to2 = Message.RecipientType.TO; 
			
			InternetAddress[] parse = InternetAddress.parse(to);
			
			message.setRecipients(to2, parse);
			
			Transport.send(message);
			
			System.out.println("Email Send SuccessFully.....");
			
		}catch (Exception e) {
			
			e.printStackTrace();
		}
	}

}
