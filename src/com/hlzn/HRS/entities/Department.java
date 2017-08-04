package com.hlzn.HRS.entities;

import java.util.HashSet;
import java.util.Set;

/**
 * Department entity. @author MyEclipse Persistence Tools
 */

public class Department implements java.io.Serializable
{

	// Fields

	private Integer departmentId;
	private String departmentName;
	private String departmentType;
	private String departmentRemark;
	private Set doctors = new HashSet(0);

	// Constructors

	/** default constructor */
	public Department()
	{
	}

	/** minimal constructor */
	public Department(Integer departmentId)
	{
		this.departmentId = departmentId;
	}

	/** full constructor */
	public Department(Integer departmentId, String departmentName,
			String departmentType, String departmentRemark, Set doctors)
	{
		this.departmentId = departmentId;
		this.departmentName = departmentName;
		this.departmentType = departmentType;
		this.departmentRemark = departmentRemark;
		this.doctors = doctors;
	}

	// Property accessors

	public Integer getDepartmentId()
	{
		return this.departmentId;
	}

	public void setDepartmentId(Integer departmentId)
	{
		this.departmentId = departmentId;
	}

	public String getDepartmentName()
	{
		return this.departmentName;
	}

	public void setDepartmentName(String departmentName)
	{
		this.departmentName = departmentName;
	}

	public String getDepartmentType()
	{
		return this.departmentType;
	}

	public void setDepartmentType(String departmentType)
	{
		this.departmentType = departmentType;
	}

	public String getDepartmentRemark()
	{
		return this.departmentRemark;
	}

	public void setDepartmentRemark(String departmentRemark)
	{
		this.departmentRemark = departmentRemark;
	}

	public Set getDoctors()
	{
		return this.doctors;
	}

	public void setDoctors(Set doctors)
	{
		this.doctors = doctors;
	}

}