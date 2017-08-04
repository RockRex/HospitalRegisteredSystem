package com.hlzn.HRS.service;

import com.hlzn.HRS.dao.HospitalDao;
import com.hlzn.HRS.entities.Hospital;

public class HospitalService
{
	private HospitalDao hospitalDao;
	public Hospital getHospital()
	{
		return hospitalDao.getHospital();
	}
	public void saveOrUpdate(Hospital h){
		 hospitalDao.saveOrUpdate(h);
	}
	public HospitalDao getHospitalDao()
	{
		return hospitalDao;
	}

	public void setHospitalDao(HospitalDao hospitalDao)
	{
		this.hospitalDao = hospitalDao;
	}
	
}
