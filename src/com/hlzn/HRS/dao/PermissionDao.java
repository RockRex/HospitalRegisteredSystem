package com.hlzn.HRS.dao;

import java.util.List;

import org.hibernate.HibernateException;

import com.hlzn.HRS.entities.Permission;

public class PermissionDao extends BaseDao
{
	public Permission getPermission(Integer permissionId)
	{
		String hql = "FROM Permission p where p.permissionId = " + permissionId;
		List<Permission> list = getSession().createQuery(hql).list();
		if (list.size() > 0)
		{
			return list.get(0);
		} else
			return null;
	}
	
	public Permission getPermissionByName(String permissionName)
	{
		String hql = "FROM Permission p where p.permissionName = '" + permissionName+"'";
		List<Permission> list = getSession().createQuery(hql).list();
		if (list.size() > 0)
		{
			return list.get(0);
		} else
			return null;
	}

	public List<Permission> getAllPermission()
	{
		String hql = "FROM Permission";
		return getSession().createQuery(hql).list();
	}
	
	// 删除对象
	public void delPermission(Integer permissionId)
	{
		String hql = "DELETE FROM Permission p where p.permissionId = " + permissionId;
		getSession().createQuery(hql).executeUpdate();
	}

	// 保存或修改对象
	public void saveOrUpdate(Permission p)
	{
		getSession().saveOrUpdate(p);
	}
}
