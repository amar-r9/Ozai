package com.ozai.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ozai.dao.MailDAO;

@Service
public class MailServiceImpl implements MailService {

	@Autowired
	MailDAO mailDAO;

	@Override
	public boolean sendMail(String subject, String Text, String recipient,boolean multipleRecipients,String mailTitle) {

		return mailDAO.sendMail(subject, Text, recipient,multipleRecipients,mailTitle);
	}

}
