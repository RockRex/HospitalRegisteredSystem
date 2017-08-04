package com.hlzn.HRS.entities;

/**
 * Workforce entity. @author MyEclipse Persistence Tools
 */

public class Workforce implements java.io.Serializable
{

	// Fields

	private Integer workforceId;
	private Doctor doctor;
	private String workforceDate;
	private Integer workforcePatNum;
	private Integer workforceAppNum;

	// Constructors

	/** default constructor */
	public Workforce()
	{
		workforceAppNum=0;
	}

	/** minimal constructor */
	public Workforce(Integer workforceId)
	{
		this.workforceId = workforceId;
		this.workforceAppNum=0;
	}
	

	public Workforce(Integer workforceId, Doctor doctor, String workforceDate,
			Integer workforcePatNum, Integer workforceAppNum)
	{
		super();
		this.workforceId = workforceId;
		this.doctor = doctor;
		this.workforceDate = workforceDate;
		this.workforcePatNum = workforcePatNum;
		this.workforceAppNum = workforceAppNum;
	}

	/** full constructor */
	public Workforce(Integer workforceId, Doctor doctor, String workforceDate,
			Integer workforcePatNum)
	{
		this.workforceId = workforceId;
		this.doctor = doctor;
		this.workforceDate = workforceDate;
		this.workforcePatNum = workforcePatNum;
		this.workforceAppNum=0;
	}

	// Property accessors

	public Integer getWorkforceId()
	{
		return this.workforceId;
	}

	public void setWorkforceId(Integer workforceId)
	{
		this.workforceId = workforceId;
	}

	public Doctor getDoctor()
	{
		return this.doctor;
	}

	public void setDoctor(Doctor doctor)
	{
		this.doctor = doctor;
	}

	public String getWorkforceDate()
	{
		return this.workforceDate;
	}

	public void setWorkforceDate(String workforceDate)
	{
		this.workforceDate = workforceDate;
	}

	public Integer getWorkforcePatNum()
	{
		return this.workforcePatNum;
	}

	public void setWorkforcePatNum(Integer workforcePatNum)
	{
		this.workforcePatNum = workforcePatNum;
	}

	public Integer getWorkforceAppNum()
	{
		return workforceAppNum;
	}

	public void setWorkforceAppNum(Integer workforceAppNum)
	{
		this.workforceAppNum = workforceAppNum;
	}
	
	
}