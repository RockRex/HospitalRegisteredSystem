package com.hlzn.HRS.dao;

import java.util.List;

import org.hibernate.HibernateException;

import com.hlzn.HRS.entities.Permission;
import com.hlzn.HRS.entities.RolePermission;

public class RolePermissionDao extends BaseDao
{
	public RolePermission getRolePermission(Integer rpId)
	{
		String hql = "FROM RolePermission rp where rp.rpId = " + rpId;
		List<RolePermission> list = getSession().createQuery(hql).list();
		if (list.size() > 0)
		{
			return list.get(0);
		} else
			return null;
	}

	public List<RolePermission> getAllRolePermission()
	{
		String hql = "FROM RolePermission";
		return getSession().createQuery(hql).list();
	}
	
	public List<RolePermission> getPermissionByRole(Integer id)
	{
		String hql = "FROM RolePermission rp LEFT OUTER JOIN FETCH rp.userRole " +
				"LEFT OUTER JOIN FETCH rp.permission " +
				"where rp.userRole.userRoleId = "+id;
		List<RolePermission> list = null;
		try
		{
			list = getSession().createQuery(hql).list();
		} catch (HibernateException e)
		{
			e.printStackTrace();
		}
		System.out.println("1212");
		return list;
	}
	
	public boolean check(Integer r, String p)
	{
		String hql = "FROM RolePermission rp LEFT OUTER JOIN FETCH rp.userRole " +
				"LEFT OUTER JOIN FETCH rp.permission " +
				"where rp.userRole.userRoleId = "+r+
				" and rp.permission.permissionName = '"+p+"'";
		List<RolePermission> list=getSession().createQuery(hql).list();
		if (list.size() > 0)
		{
			return true;
		} else
			return false;
	}
	
	public RolePermission getByRP(Integer r, String p)
	{
		String hql = "FROM RolePermission rp LEFT OUTER JOIN FETCH rp.userRole " +
				"LEFT OUTER JOIN FETCH rp.permission " +
				"where rp.userRole.userRoleId = "+r+
				" and rp.permission.permissionName = '"+p+"'";
		List<RolePermission> list=getSession().createQuery(hql).list();
		if (list.size() > 0)
		{
			return list.get(0);
		} else
			return null;
	}

	// 删除对象
	public void delRolePermission(Integer rpId)
	{
		String hql = "DELETE FROM RolePermission rp where rp.rpId = " + rpId;
		getSession().createQuery(hql).executeUpdate();
	}

	// 保存或修改对象
	public void saveOrUpdate(RolePermission rp)
	{
		getSession().saveOrUpdate(rp);
	}
}
