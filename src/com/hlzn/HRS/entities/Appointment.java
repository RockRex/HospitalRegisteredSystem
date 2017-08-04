package com.hlzn.HRS.entities;

/**
 * Appointment entity. @author MyEclipse Persistence Tools
 */

public class Appointment implements java.io.Serializable
{

	// Fields

	private Integer appointmentId;
	private Patient patient;
	private Doctor doctor;
	private String appointmentDate;
	private String appointmentNum;
	private String appointmentStatus;
	private String appointmentRemark;

	// Constructors

	/** default constructor */
	public Appointment()
	{
	}

	/** minimal constructor */
	public Appointment(Integer appointmentId)
	{
		this.appointmentId = appointmentId;
	}

	/** full constructor */

	public Appointment(Integer appointmentId, Patient patient, Doctor doctor,
			String appointmentDate, String appointmentNum,
			String appointmentStatus, String appointmentRemark)
	{
		super();
		this.appointmentId = appointmentId;
		this.patient = patient;
		this.doctor = doctor;
		this.appointmentDate = appointmentDate;
		this.appointmentNum = appointmentNum;
		this.appointmentStatus = appointmentStatus;
		this.appointmentRemark = appointmentRemark;
	}

	// Property accessors

	public Integer getAppointmentId()
	{
		return this.appointmentId;
	}

	public void setAppointmentId(Integer appointmentId)
	{
		this.appointmentId = appointmentId;
	}

	public Patient getPatient()
	{
		return this.patient;
	}

	public void setPatient(Patient patient)
	{
		this.patient = patient;
	}

	public Doctor getDoctor()
	{
		return this.doctor;
	}

	public void setDoctor(Doctor doctor)
	{
		this.doctor = doctor;
	}

	public String getAppointmentDate()
	{
		return this.appointmentDate;
	}

	public void setAppointmentDate(String appointmentDate)
	{
		this.appointmentDate = appointmentDate;
	}

	public String getAppointmentStatus()
	{
		return this.appointmentStatus;
	}

	public void setAppointmentStatus(String appointmentStatus)
	{
		this.appointmentStatus = appointmentStatus;
	}

	public String getAppointmentRemark()
	{
		return appointmentRemark;
	}

	public void setAppointmentRemark(String appointmentRemark)
	{
		this.appointmentRemark = appointmentRemark;
	}

	public String getAppointmentNum()
	{
		return appointmentNum;
	}

	public void setAppointmentNum(String appointmentNum)
	{
		this.appointmentNum = appointmentNum;
	}

}