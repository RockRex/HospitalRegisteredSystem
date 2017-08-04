package com.hlzn.HRS.entities;

import java.util.HashSet;
import java.util.Set;

/**
 * Doctor entity. @author MyEclipse Persistence Tools
 */

public class Doctor implements java.io.Serializable
{

	// Fields

	private Integer doctorId;
	private UserRole userRole;
	private Department department;
	private String doctorPassword;
	private String doctorName;
	private String doctorSex;
	private String doctorAge;
	private String doctorTel;
	private String doctorTitle;
	private String doctorImg;
	private String doctorIdcard;
	private String doctorRemark;
	private Set workforces = new HashSet(0);
	private Set appointments = new HashSet(0);

	// Constructors

	/** default constructor */
	public Doctor()
	{
	}

	/** minimal constructor */
	public Doctor(Integer doctorId)
	{
		this.doctorId = doctorId;
	}

	/** full constructor */
	public Doctor(Integer doctorId, UserRole userRole, Department department,
			String doctorPassword, String doctorName, String doctorSex,
			String doctorAge, String doctorTel, String doctorTitle,
			String doctorImg, String doctorIdcard, String doctorRemark,
			Set workforces, Set appointments)
	{
		this.doctorId = doctorId;
		this.userRole = userRole;
		this.department = department;
		this.doctorPassword = doctorPassword;
		this.doctorName = doctorName;
		this.doctorSex = doctorSex;
		this.doctorAge = doctorAge;
		this.doctorTel = doctorTel;
		this.doctorTitle = doctorTitle;
		this.doctorImg = doctorImg;
		this.doctorIdcard = doctorIdcard;
		this.doctorRemark = doctorRemark;
		this.workforces = workforces;
		this.appointments = appointments;
	}

	// Property accessors

	public Integer getDoctorId()
	{
		return this.doctorId;
	}

	public void setDoctorId(Integer doctorId)
	{
		this.doctorId = doctorId;
	}

	public UserRole getUserRole()
	{
		return this.userRole;
	}

	public void setUserRole(UserRole userRole)
	{
		this.userRole = userRole;
	}

	public Department getDepartment()
	{
		return this.department;
	}

	public void setDepartment(Department department)
	{
		this.department = department;
	}

	public String getDoctorPassword()
	{
		return this.doctorPassword;
	}

	public void setDoctorPassword(String doctorPassword)
	{
		this.doctorPassword = doctorPassword;
	}

	public String getDoctorName()
	{
		return this.doctorName;
	}

	public void setDoctorName(String doctorName)
	{
		this.doctorName = doctorName;
	}

	public String getDoctorSex()
	{
		return this.doctorSex;
	}

	public void setDoctorSex(String doctorSex)
	{
		this.doctorSex = doctorSex;
	}

	public String getDoctorAge()
	{
		return this.doctorAge;
	}

	public void setDoctorAge(String doctorAge)
	{
		this.doctorAge = doctorAge;
	}

	public String getDoctorTel()
	{
		return this.doctorTel;
	}

	public void setDoctorTel(String doctorTel)
	{
		this.doctorTel = doctorTel;
	}

	public String getDoctorTitle()
	{
		return this.doctorTitle;
	}

	public void setDoctorTitle(String doctorTitle)
	{
		this.doctorTitle = doctorTitle;
	}

	public String getDoctorImg()
	{
		return this.doctorImg;
	}

	public void setDoctorImg(String doctorImg)
	{
		this.doctorImg = doctorImg;
	}

	public String getDoctorIdcard()
	{
		return this.doctorIdcard;
	}

	public void setDoctorIdcard(String doctorIdcard)
	{
		this.doctorIdcard = doctorIdcard;
	}

	public String getDoctorRemark()
	{
		return this.doctorRemark;
	}

	public void setDoctorRemark(String doctorRemark)
	{
		this.doctorRemark = doctorRemark;
	}

	public Set getWorkforces()
	{
		return this.workforces;
	}

	public void setWorkforces(Set workforces)
	{
		this.workforces = workforces;
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