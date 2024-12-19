package com.ozai.dao;

import java.util.List;

import com.ozai.model.ConsultDoctor;
import com.ozai.model.Talent;

public interface MiscDAO {

	public List<ConsultDoctor> getGynicMessages(String type, int limit, int offset);

	public List<ConsultDoctor> getPsychicMessages(String type, int limit, int offset);

	public List<ConsultDoctor> getUserMessages(String type, int user_id);

	public String getRecentMessage(String type, int user_id);

	public boolean saveMessage(ConsultDoctor message);

	public List<ConsultDoctor> getRecentMessages(int user_id, String type, int limit, int offset);

	public boolean selectEntry(int id, String comment, String admin);

	public List<Talent> getEntriesByOption(String option);

	public boolean rejectEntry(int id, String admin);
	
}
