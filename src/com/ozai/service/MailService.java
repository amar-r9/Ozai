package com.ozai.service;

public interface MailService {

	public boolean sendMail(String subject, String Text, String recipient,boolean multipleRecipients,String mailTitle);

}