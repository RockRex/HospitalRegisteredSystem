package com.hlzn.HRS.dao;

import java.util.List;

import com.hlzn.HRS.entities.Patient;

public class PatientDao extends BaseDao
{
	public Patient getPatient(Integer patientId)
	{
		String hql = "FROM Patient p where p.patientId = " + patientId;
		List<Patient> list = getSession().createQuery(hql).list();
		if (list.size() > 0)
		{
			return list.get(0);
		} else
			return null;
	}

	public List<Patient> getAllPatient()
	{
		String hql = "FROM Patient";
		return getSession().createQuery(hql).list();
	}
	
	public List<Patient> getSomePatient(String key)
	{
		String hql = "FROM Patient as p where p.patientName like '%"+key+"%'" +
				" or p.patientIdcard like '%"+key+"%'";
		return getSession().createQuery(hql).list();
	}
	// 删除对象
	public void delPatient(Integer patientId)
	{
		String hql = "DELETE FROM Patient p where p.patientId = " + patientId;
		getSession().createQuery(hql).executeUpdate();
	}

	// 保存或修改对象
	public void saveOrUpdate(Patient p)
	{
		getSession().saveOrUpdate(p);
	}
}
