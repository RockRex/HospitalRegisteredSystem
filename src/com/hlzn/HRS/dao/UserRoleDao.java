package com.hlzn.HRS.dao;

import java.util.List;

import com.hlzn.HRS.entities.UserRole;

public class UserRoleDao extends BaseDao
{
	public UserRole getUserRole(Integer userRoleId)
	{
		String hql = "FROM UserRole u where u.userRoleId = " + userRoleId;
		List<UserRole> list = getSession().createQuery(hql).list();
		if (list.size() > 0)
		{
			return list.get(0);
		} else
			return null;
	}

	public List<UserRole> getAllUserRole()
	{
		String hql = "FROM UserRole";
		return getSession().createQuery(hql).list();
	}

	// 删除对象
	public void delUserRole(Integer userRoleId)
	{
		String hql = "DELETE FROM UserRole u where u.userRoleId = " + userRoleId;
		getSession().createQuery(hql).executeUpdate();
	}

	// 保存或修改对象
	public void saveOrUpdate(UserRole u)
	{
		getSession().saveOrUpdate(u);
	}
}
