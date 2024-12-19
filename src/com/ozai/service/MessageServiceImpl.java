package com.ozai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ozai.beans.MessageBean;
import com.ozai.dao.MessageDAO;
import com.ozai.model.Messages;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	MessageDAO messageDao;

	@Override
	public boolean saveMessage(Messages message) {
		return messageDao.saveMessage(message);
	}

	@Override
	public List<Messages> getRecentMessages(int sender_id, int receiver_id, int limit, int offset) {
		return messageDao.getRecentMessages(sender_id, receiver_id, limit, offset);
	}

	@Override
	public boolean likeAMessage(int message_id) {
		return messageDao.likeAMessage(message_id);
	}

	@Override
	public boolean reportAMessage(int message_id) {
		return messageDao.reportAMessage(message_id);
	}

	@Override
	public List<Messages> getUserChats(int user_id, int limit, int offset) {
		return messageDao.getUserChats(user_id, limit, offset);
	}

	@Override
	public List<MessageBean> getUserChatList(int client_id, int user_id, int limit, int offset) {
		return messageDao.getUserChatList(client_id, user_id, limit, offset);
	}

	@Override
	public String getRecentMessage(int id, int receiver_id) {
		return messageDao.getRecentMessage(id, receiver_id);
	}

	@Override
	public Messages getLatestMessage(int id, int receiver_id) {
		return messageDao.getLatestMessage(id, receiver_id);
	}

	
	
}
