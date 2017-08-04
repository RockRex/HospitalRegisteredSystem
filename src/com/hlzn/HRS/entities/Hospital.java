package com.hlzn.HRS.entities;

/**
 * Hospital entity. @author MyEclipse Persistence Tools
 */

public class Hospital implements java.io.Serializable
{

	// Fields

	private Integer hospitalId;
	private String hospitalRemark;

	// Constructors

	/** default constructor */
	public Hospital()
	{
	}

	/** minimal constructor */
	public Hospital(Integer hospitalId)
	{
		this.hospitalId = hospitalId;
	}

	/** full constructor */
	public Hospital(Integer hospitalId, String hospitalRemark)
	{
		this.hospitalId = hospitalId;
		this.hospitalRemark = hospitalRemark;
	}

	// Property accessors

	public Integer getHospitalId()
	{
		return this.hospitalId;
	}

	public void setHospitalId(Integer hospitalId)
	{
		this.hospitalId = hospitalId;
	}

	public String getHospitalRemark()
	{
		return this.hospitalRemark;
	}

	public void setHospitalRemark(String hospitalRemark)
	{
		this.hospitalRemark = hospitalRemark;
	}

}