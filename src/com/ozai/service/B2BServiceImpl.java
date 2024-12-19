package com.ozai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ozai.dao.B2BDAO;
import com.ozai.dao.B2CDAO;
import com.ozai.model.B2B_Details;
import com.ozai.model.B2C_Details;
import com.ozai.model.B2C_ElectricityBill;
import com.ozai.model.B2C_Rents;
import com.ozai.model.B2C_SecurityDeposit;


@Service
public class B2BServiceImpl implements B2BService {

	
	@Autowired
	B2BDAO b2bDao;

	@Override
	public boolean addUserAsResident(B2B_Details details) {
		return b2bDao.addUserAsResident(details);
	}

	
	
}
