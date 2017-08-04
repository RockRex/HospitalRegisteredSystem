package com.hlzn.HRS.dao;

import java.util.List;

import com.hlzn.HRS.entities.Department;

public class DepartmentDao extends BaseDao
{
	public Department getDepartment(Integer departmentId)
	{
		String hql = "FROM Department d where d.departmentId = "
				+ departmentId;
		List<Department> list =getSession().createQuery(hql).list();
		if(list.size()>0)
		{
			return list.get(0);
		}
		else
			return null;
	}

	public List<Department> getAllDepartment()
	{
		String hql = "FROM Department";
		return getSession().createQuery(hql).list();
	}
	
	public List<Department> getSearchDepartment(String key)
	{
		String hql = "FROM Department as d where d.departmentName like '%"+key+"%'" +
				" or d.departmentType like '%"+key+"%'";
		return getSession().createQuery(hql).list();
	}
	// 删除对象
	public void delDepartment(Integer departmentId)
	{
		String hql = "DELETE FROM Department d where d.departmentId = "
				+ departmentId;
		getSession().createQuery(hql).executeUpdate();
	}

	// 保存或修改对象
	public void saveOrUpdate(Department d)
	{
		getSession().saveOrUpdate(d);
	}
}
