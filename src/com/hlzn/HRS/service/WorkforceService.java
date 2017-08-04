package com.hlzn.HRS.service;

import java.util.List;

import com.hlzn.HRS.dao.DepartmentDao;
import com.hlzn.HRS.dao.WorkforceDao;
import com.hlzn.HRS.entities.Appointment;
import com.hlzn.HRS.entities.Department;
import com.hlzn.HRS.entities.Doctor;
import com.hlzn.HRS.entities.Workforce;

public class WorkforceService
{
	private WorkforceDao workforceDao;

	public void delWorkforce(Integer id)
	{
		workforceDao.delWorkforce(id);
	}
	
	public void cancelApp(Appointment a)
	{
		Doctor d= a.getDoctor();
		List<Workforce> list =workforceDao.getWorkforceByDoc(d.getDoctorId());
		for (Workforce workforce : list)
		{
			if(workforce.getWorkforceDate().equals(a.getAppointmentDate()))
			{
				int x=workforce.getWorkforceAppNum();
				x=x-1;
				workforce.setWorkforceAppNum(x);
				workforceDao.saveOrUpdate(workforce);
			}
		}
	}
	public List<Workforce> getAllWorkforce()
	{
		return workforceDao.getAllWorkforce();
	}

	public List<Workforce> getSomeWorkforce(String k1, String k2)
	{
		// System.out.println("***"+k1+"***"+k2);
		return workforceDao.getSomeWorkforce(k1, k2);
	}
	
	public List<Workforce> getSomeWorkforce2(String k1, String k2)
	{
		// System.out.println("***"+k1+"***"+k2);
		return workforceDao.getSomeWorkforce2(k1, k2);
	}

	public List<Workforce> getWorkforceByDate(String date)
	{
		return workforceDao.getWorkforceByDate(date);
	}

	public List<Workforce> getWorkforceByDoc(Integer id)
	{
		return workforceDao.getWorkforceByDoc(id);
	}

	public void saveOrUpdate(Workforce w)
	{
		workforceDao.saveOrUpdate(w);
	}

	public Workforce getWorkforce(Integer id)
	{
		return workforceDao.getWorkforce(id);
	}

	public void setWorkforceDao(WorkforceDao workforceDao)
	{
		this.workforceDao = workforceDao;
	}
}
