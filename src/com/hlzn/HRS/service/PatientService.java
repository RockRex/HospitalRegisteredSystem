package com.hlzn.HRS.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.hlzn.HRS.dao.PatientDao;
import com.hlzn.HRS.entities.Patient;

public class PatientService
{
	private PatientDao patientDao;
	public Patient getPatient(Integer id)
	{
		return patientDao.getPatient(id);
	}
	//往缓存中存一个Patient
	
	public void setPatient(Patient p)
	{
		HttpServletRequest request;
		request = ServletActionContext.getRequest();
		request.getSession().setAttribute("MyPatient", p.getPatientId());
	}
	//从缓存中取当前登录的Patient
	public Patient getMyPatient()
	{
		HttpServletRequest request;
		request = ServletActionContext.getRequest();
		Integer p =(Integer) request.getSession().getAttribute("MyPatient");
		if(p!=null)
			return patientDao.getPatient(p);
		else
			return null;
	}
	//清除缓存
	public void clean()
	{
		HttpServletRequest request;
		request = ServletActionContext.getRequest();
		request.getSession().removeAttribute("MyPatient");
	}
	//保存或者修改
	public void saveOrUpdate(Patient p)
	{
		patientDao.saveOrUpdate(p);
	}
	public List<Patient> getAllPatient()
	{
		return patientDao.getAllPatient();
	}
	public List<Patient> getSomePatient(String k)
	{
		return patientDao.getSomePatient(k);
	}
	public void delPatient(Integer id)
	{
		patientDao.delPatient(id);
	}
	public boolean ldIsValid(Integer id){
		return patientDao.getPatient(id) == null;
	}
	//***
	public PatientDao getPatientDao()
	{
		return patientDao;
	}

	public void setPatientDao(PatientDao patientDao)
	{
		this.patientDao = patientDao;
	}
	
}
