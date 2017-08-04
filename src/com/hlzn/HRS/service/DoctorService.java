package com.hlzn.HRS.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.hlzn.HRS.dao.DoctorDao;
import com.hlzn.HRS.entities.Doctor;

public class DoctorService
{
	private DoctorDao doctorDao;
	
	public DoctorDao getDoctorDao()
	{
		return doctorDao;
	}

	public void setDoctorDao(DoctorDao doctorDao)
	{
		this.doctorDao = doctorDao;
	}
	//自定义的
	public Doctor getDoctor(Integer doctorId)
	{
		return doctorDao.getDoctor(doctorId);
	}
	public List<Doctor> getAllDoctor()
	{
		return doctorDao.getAllDoctor();
	}
	//往缓存中存一个Doctor
	
	public void setMyDoctor(Doctor d)
	{
		HttpServletRequest request;
		request = ServletActionContext.getRequest();
		request.getSession().setAttribute("MyDoctor", d.getDoctorId());
		request.getSession().setAttribute("MyDoctorName", d.getDoctorName());
	}
	//从缓存中取当前登录的Doctor
	public Doctor getMyDoctor()
	{
		HttpServletRequest request;
		request = ServletActionContext.getRequest();
		int d =(Integer) request.getSession().getAttribute("MyDoctor");
		return this.getDoctor(d);
	}
	//清楚缓存
	public void clean()
	{
		HttpServletRequest request;
		request = ServletActionContext.getRequest();
		request.getSession().removeAttribute("MyDoctor");
	}
	public void delDoctor(Integer id)
	{
		doctorDao.delDoctor(id);
	}
	public void saveOrUpdate(Doctor d)
	{
		doctorDao.saveOrUpdate(d);
	}
	public List<Doctor> searchDoctors(String key)
	{
		return doctorDao.getSearchDoctor(key);
	}
	public List<Doctor> getDoctorsByDepart(Integer id)
	{
		return doctorDao.getDoctorsByDepart(id);
	}
	public List<Doctor> getSomeDoctors(String k1,String k2)
	{
		return doctorDao.getSomeDoctor(k1, k2);
	}
	//验证账户是否可用
	public boolean ldIsValid(Integer id)
	{
		return doctorDao.getDoctor(id) == null;
	}
	//获取对应角色下的医生
	public List<Doctor> getByRole(Integer id)
	{
		return doctorDao.getByRole(id);
	}
}
