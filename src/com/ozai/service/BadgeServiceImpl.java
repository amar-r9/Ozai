package com.ozai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ozai.dao.BadgeDAO;
import com.ozai.model.Badges;

@Service
public class BadgeServiceImpl implements BadgeService {

	@Autowired
	BadgeDAO badgeDAO;

	@Override
	public List<Badges> getBadgeList() {
		return badgeDAO.getBadgeList();
	}

}
