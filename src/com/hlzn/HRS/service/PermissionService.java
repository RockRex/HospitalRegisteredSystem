package com.hlzn.HRS.service;

import java.util.List;

import com.hlzn.HRS.dao.PermissionDao;
import com.hlzn.HRS.dao.RolePermissionDao;
import com.hlzn.HRS.dao.UserRoleDao;
import com.hlzn.HRS.entities.Permission;
import com.hlzn.HRS.entities.RolePermission;
import com.hlzn.HRS.entities.UserRole;

public class PermissionService
{
	private UserRoleDao userRoleDao;
	private PermissionDao permissionDao;
	private RolePermissionDao rolePermissionDao;
	//获取所有的角色信息
	public List<UserRole> getAllRoles()
	{
		return userRoleDao.getAllUserRole();
	}
	//获取角色
	public UserRole getRole(int id)
	{
		return userRoleDao.getUserRole(id);
	}
	public void saveRole(UserRole u)
	{
		userRoleDao.saveOrUpdate(u);
	}
	public void delRole(int id)
	{
		userRoleDao.delUserRole(id);
	}
	
	//获取对应权限
	public List<RolePermission> showPermissions(Integer id)
	{
		return rolePermissionDao.getPermissionByRole(id);
	}
	
	
	//增
	public void newPermissions(Integer r, String pNN)
	{
		if(rolePermissionDao.check(r, pNN)==false)
		{
			UserRole u=userRoleDao.getUserRole(r);
			Permission p=permissionDao.getPermissionByName(pNN);
			RolePermission rp= new RolePermission();
			rp.setUserRole(u);
			rp.setPermission(p);
			rolePermissionDao.saveOrUpdate(rp);
		}
	}
	//删
	public void delPermissions(Integer r, String p)
	{
		if(rolePermissionDao.check(r, p)==true)
		{
			RolePermission rp=rolePermissionDao.getByRP(r, p);
			rolePermissionDao.delRolePermission(rp.getRpId());
		}
	}
	//*********GETTER&SETTER******************************
	
	public void setUserRoleDao(UserRoleDao userRoleDao)
	{
		this.userRoleDao = userRoleDao;
	}

	public void setPermissionDao(PermissionDao permissionDao)
	{
		this.permissionDao = permissionDao;
	}
	public void setRolePermissionDao(RolePermissionDao rolePermissionDao)
	{
		this.rolePermissionDao = rolePermissionDao;
	}
	
	
	
	
}
