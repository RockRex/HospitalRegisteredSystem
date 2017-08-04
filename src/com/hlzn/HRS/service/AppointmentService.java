package com.hlzn.HRS.service;

import java.util.List;

import com.hlzn.HRS.dao.AppointmentDao;
import com.hlzn.HRS.entities.Appointment;
import com.hlzn.HRS.entities.Doctor;
import com.hlzn.HRS.entities.Patient;

public class AppointmentService
{
	private AppointmentDao appointmentDao;

	public List<Appointment> getAppointmentByPatient(Integer id)
	{
		return appointmentDao.getAppointmentByPatient(id);
	}

	public void cancelApp(Integer id)
	{
		Appointment a = appointmentDao.getAppointment(id);
		if (a != null)
		{
			// a.setAppointmentStatus("取消预约");
			/**
			 * 取消预约就直接把这一条预约删掉吧，完成预约的话就是改状态 因为取消预约会增加名额，完成预约则不会
			 */
			appointmentDao.delAppointment(a.getAppointmentId());
		}
	}

	public List<Appointment> getAllApp()
	{
		return appointmentDao.getAllAppointment();
	}
	public boolean checkingSameApp(Integer doctorID,Integer patientID,String date)
	{
		System.out.println("服务层："+doctorID);
		System.out.println("服务层："+patientID);
		System.out.println("服务层："+date);
		List<Appointment> list=appointmentDao.getDocAppByDate(doctorID,date);
		int flag=0;
		if(list.size()==0)
		{
			flag=0;
		}
		else
		{
			for (int i=0;i<list.size();i++)
			{
				Patient p=list.get(i).getPatient();
				if(p.getPatientId().equals(patientID))
				{
					flag=1;
				}
			}
		}
		if(flag==1)
			return true;
		else
			return false;
	}

	public List<Appointment> getWaitApp()
	{
		return appointmentDao.getWaitAppointment();
	}

	public List<Appointment> getDoneApp()
	{
		return appointmentDao.getDoneAppointment();
	}
	
	public List<Appointment> getWaitAppByDoc(Integer id)
	{
		return appointmentDao.getWaitAppointmentByDoc(id);
	}

	public List<Appointment> getDoneAppByDoc(Integer id)
	{
		return appointmentDao.getDoneAppointmentByDoc(id);
	}

	public List<Appointment> getSomeApp(String k1, String k2, String k3,
			String k4)
	{
		// System.out.println(k1+" "+k2+" "+k3);
		return appointmentDao.getSearch(k1, k2, k3, k4);
	}
	public List<Appointment> getSomeApp2(String k1, String k2, String k3,
			String k4)
	{
		// System.out.println(k1+" "+k2+" "+k3);
		return appointmentDao.getSearch2(k1, k2, k3, k4);
	}
	public Appointment getAppointment(Integer id)
	{
		return appointmentDao.getAppointment(id);
	}

	public void saveOrUpdate(Appointment a)
	{
		appointmentDao.saveOrUpdate(a);
	}

	// ******
	public AppointmentDao getAppointmentDao()
	{
		return appointmentDao;
	}

	public void setAppointmentDao(AppointmentDao appointmentDao)
	{
		this.appointmentDao = appointmentDao;
	}

}
