package com.hlzn.HRS.entities;

import java.util.HashSet;
import java.util.Set;

/**
 * Permission entity. @author MyEclipse Persistence Tools
 */

public class Permission implements java.io.Serializable
{

	// Fields

	private Integer permissionId;
	private String permissionName;
	private Set rolePermissions = new HashSet(0);

	// Constructors

	/** default constructor */
	public Permission()
	{
	}

	/** minimal constructor */
	public Permission(Integer permissionId, String permissionName)
	{
		this.permissionId = permissionId;
		this.permissionName = permissionName;
	}

	/** full constructor */
	public Permission(Integer permissionId, String permissionName,
			Set rolePermissions)
	{
		this.permissionId = permissionId;
		this.permissionName = permissionName;
		this.rolePermissions = rolePermissions;
	}

	// Property accessors

	public Integer getPermissionId()
	{
		return this.permissionId;
	}

	public void setPermissionId(Integer permissionId)
	{
		this.permissionId = permissionId;
	}

	public String getPermissionName()
	{
		return this.permissionName;
	}

	public void setPermissionName(String permissionName)
	{
		this.permissionName = permissionName;
	}

	public Set getRolePermissions()
	{
		return this.rolePermissions;
	}

	public void setRolePermissions(Set rolePermissions)
	{
		this.rolePermissions = rolePermissions;
	}

}