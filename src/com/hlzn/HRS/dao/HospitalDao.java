package com.hlzn.HRS.dao;

import java.util.List;

import com.hlzn.HRS.entities.Hospital;

public class HospitalDao extends BaseDao
{
	public Hospital getHospital()
	{
		String hql = "FROM Hospital h where h.hospitalId = 1";
		List<Hospital> list =getSession().createQuery(hql).list();
		if(list.size()>0)
		{
			return list.get(0);
		}
		else
			return null;
	}

	// 保存或修改对象
	public void saveOrUpdate(Hospital h)
	{
		getSession().saveOrUpdate(h);
	}
}
