package com.ozai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ozai.beans.MessageBean;
import com.ozai.dao.MiscDAO;
import com.ozai.model.ConsultDoctor;
import com.ozai.model.Talent;

@Service
public class MiscServiceImpl implements MiscService {

	@Autowired
	MiscDAO miscDao;

	@Override
	public List<ConsultDoctor> getGynicMessages(String type, int limit, int offset) {
		return miscDao.getGynicMessages(type, limit, offset);
	}

	@Override
	public List<ConsultDoctor> getPsychicMessages(String type, int limit, int offset) {
		return miscDao.getPsychicMessages(type, limit, offset);
	}

	@Override
	public List<ConsultDoctor> getUserMessages(String type, int user_id) {
		return miscDao.getUserMessages(type, user_id);
	}

	@Override
	public String getRecentMessage(String type, int user_id) {
		return miscDao.getRecentMessage(type, user_id);
	}

	@Override
	public boolean saveMessage(ConsultDoctor message) {
		return miscDao.saveMessage(message);
	}

	@Override
	public List<ConsultDoctor> getRecentMessages(int user_id, String type, int limit, int offset) {
		return miscDao.getRecentMessages(user_id, type, limit, offset);
	}

	@Override
	public boolean selectEntry(int id, String comment, String admin) {
		return miscDao.selectEntry(id, comment, admin);
	}

	@Override
	public List<Talent> getEntriesByOption(String option) {
		return miscDao.getEntriesByOption(option);
	}

	@Override
	public boolean rejectEntry(int id, String admin) {
		return miscDao.rejectEntry(id, admin);
	}
}
