package com.hlzn.HRS.entities;

/**
 * RolePermission entity. @author MyEclipse Persistence Tools
 */

public class RolePermission implements java.io.Serializable
{

	// Fields

	private Integer rpId;
	private UserRole userRole;
	private Permission permission;

	// Constructors

	/** default constructor */
	public RolePermission()
	{
	}

	/** full constructor */
	public RolePermission(Integer rpId, UserRole userRole, Permission permission)
	{
		this.rpId = rpId;
		this.userRole = userRole;
		this.permission = permission;
	}

	// Property accessors

	public Integer getRpId()
	{
		return this.rpId;
	}

	public void setRpId(Integer rpId)
	{
		this.rpId = rpId;
	}

	public UserRole getUserRole()
	{
		return this.userRole;
	}

	public void setUserRole(UserRole userRole)
	{
		this.userRole = userRole;
	}

	public Permission getPermission()
	{
		return this.permission;
	}

	public void setPermission(Permission permission)
	{
		this.permission = permission;
	}

}