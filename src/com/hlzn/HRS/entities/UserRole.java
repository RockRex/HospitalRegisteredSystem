package com.hlzn.HRS.entities;

import java.util.HashSet;
import java.util.Set;

/**
 * UserRole entity. @author MyEclipse Persistence Tools
 */

public class UserRole implements java.io.Serializable
{

	// Fields

	private Integer userRoleId;
	private String userTypeName;
	private Set doctors = new HashSet(0);
	private Set rolePermissions = new HashSet(0);

	// Constructors

	/** default constructor */
	public UserRole()
	{
	}

	/** minimal constructor */
	public UserRole(Integer userRoleId, String userTypeName)
	{
		this.userRoleId = userRoleId;
		this.userTypeName = userTypeName;
	}

	/** full constructor */
	
	public UserRole(Integer userRoleId, String userTypeName, Set doctors,
			Set rolePermissions)
	{
		this.userRoleId = userRoleId;
		this.userTypeName = userTypeName;
		this.doctors = doctors;
		this.rolePermissions = rolePermissions;
	}
	

	// Property accessors

	public Integer getUserRoleId()
	{
		return this.userRoleId;
	}

	public void setUserRoleId(Integer userRoleId)
	{
		this.userRoleId = userRoleId;
	}

	public String getUserTypeName()
	{
		return this.userTypeName;
	}

	public void setUserTypeName(String userTypeName)
	{
		this.userTypeName = userTypeName;
	}

	public Set getDoctors()
	{
		return this.doctors;
	}

	public void setDoctors(Set doctors)
	{
		this.doctors = doctors;
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