package com.ozai.service;

import java.util.List;

import com.ozai.model.B2B_Details;
import com.ozai.model.B2C_Details;
import com.ozai.model.B2C_ElectricityBill;
import com.ozai.model.B2C_Rents;
import com.ozai.model.B2C_SecurityDeposit;

public interface B2BService {

	public boolean addUserAsResident(B2B_Details details);

}
