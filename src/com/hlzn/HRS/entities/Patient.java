package com.hlzn.HRS.entities;

import java.util.HashSet;
import java.util.Set;

/**
 * Patient entity. @author MyEclipse Persistence Tools
 */

public class Patient implements java.io.Serializable
{

	// Fields

	private Integer patientId;
	private String patientPassword;
	private String patientName;
	private String patientAge;
	private String patientSex;
	private String patientTel;
	private String patientIdcard;
	private Set appointments = new HashSet(0);

	// Constructors

	/** default constructor */
	public Patient()
	{
	}

	/** minimal constructor */
	public Patient(Integer patientId)
	{
		this.patientId = patientId;
	}

	/** full constructor */
	public Patient(Integer patientId, String patientPassword,
			String patientName, String patientAge, String patientSex,
			String patientTel, String patientIdcard, Set appointments)
	{
		this.patientId = patientId;
		this.patientPassword = patientPassword;
		this.patientName = patientName;
		this.patientAge = patientAge;
		this.patientSex = patientSex;
		this.patientTel = patientTel;
		this.patientIdcard = patientIdcard;
		this.appointments = appointments;
	}

	// Property accessors

	public Integer getPatientId()
	{
		return this.patientId;
	}

	public void setPatientId(Integer patientId)
	{
		this.patientId = patientId;
	}

	public String getPatientPassword()
	{
		return this.patientPassword;
	}

	public void setPatientPassword(String patientPassword)
	{
		this.patientPassword = patientPassword;
	}

	public String getPatientName()
	{
		return this.patientName;
	}

	public void setPatientName(String patientName)
	{
		this.patientName = patientName;
	}

	public String getPatientAge()
	{
		return this.patientAge;
	}

	public void setPatientAge(String patientAge)
	{
		this.patientAge = patientAge;
	}

	public String getPatientSex()
	{
		return this.patientSex;
	}

	public void setPatientSex(String patientSex)
	{
		this.patientSex = patientSex;
	}

	public String getPatientTel()
	{
		return this.patientTel;
	}

	public void setPatientTel(String patientTel)
	{
		this.patientTel = patientTel;
	}

	public String getPatientIdcard()
	{
		return this.patientIdcard;
	}

	public void setPatientIdcard(String patientIdcard)
	{
		this.patientIdcard = patientIdcard;
	}

	public Set getAppointments()
	{
		return this.appointments;
	}

	public void setAppointments(Set appointments)
	{
		this.appointments = appointments;
	}

}