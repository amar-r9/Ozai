package com.ozai.dao;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Repository;

@Repository
public class MailDAOImpl implements MailDAO {

	@Autowired
	private JavaMailSender mailSender;

	@Override
	public boolean sendMail(String subject, String Text, String recipient,
			boolean multipleRecipients,String mailTitle) {

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message);
			
			
			helper.setFrom("contact@ozailiving.com", mailTitle);

			if (multipleRecipients) {
				helper.setTo(recipient.split(",", -1));
			} else {
				helper.setTo(recipient);
			}
			helper.setSubject(subject);
			helper.setText(Text, true);

			mailSender.send(message);

			return true;
		} catch (Exception exception) {
			exception.printStackTrace();
			return false;
		}
	}

}
