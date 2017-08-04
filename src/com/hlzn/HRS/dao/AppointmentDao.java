package com.hlzn.HRS.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.hlzn.HRS.entities.Appointment;

public class AppointmentDao extends BaseDao
{
	public Appointment getAppointment(Integer appointmentId)
	{
		String hql = "FROM Appointment a where a.appointmentId = "
				+ appointmentId;
		List<Appointment> list = getSession().createQuery(hql).list();
		if (list.size() > 0)
		{
			return list.get(0);
		} else
			return null;
	}

	public List<Appointment> getAllAppointment()
	{
		String hql = "FROM Appointment a LEFT OUTER JOIN FETCH a.patient "
				+ "LEFT OUTER JOIN FETCH a.doctor "
				+ "LEFT OUTER JOIN FETCH a.doctor.department ";
		return getSession().createQuery(hql).list();
	}

	public List<Appointment> getAppointmentByPatient(Integer id)
	{
		String hql = "FROM Appointment a LEFT OUTER JOIN FETCH a.patient "
				+ "LEFT OUTER JOIN FETCH a.doctor "
				+ "LEFT OUTER JOIN FETCH a.doctor.department "
				+ "where a.patient.patientId = " + id
				+ " and a.appointmentStatus='待诊'";
		return getSession().createQuery(hql).list();
	}

	public List<Appointment> getWaitAppointment()
	{
		String hql = "FROM Appointment a LEFT OUTER JOIN FETCH a.patient "
				+ "LEFT OUTER JOIN FETCH a.doctor "
				+ "LEFT OUTER JOIN FETCH a.doctor.department "
				+ "where a.appointmentStatus='待诊'";
		return getSession().createQuery(hql).list();
	}

	public List<Appointment> getDoneAppointment()
	{
		String hql = "FROM Appointment a LEFT OUTER JOIN FETCH a.patient "
				+ "LEFT OUTER JOIN FETCH a.doctor "
				+ "LEFT OUTER JOIN FETCH a.doctor.department "
				+ "where a.appointmentStatus='完成'";
		return getSession().createQuery(hql).list();
	}

	public List<Appointment> getWaitAppointmentByDoc(Integer id)
	{
		String hql = "FROM Appointment a LEFT OUTER JOIN FETCH a.patient "
				+ "LEFT OUTER JOIN FETCH a.doctor "
				+ "LEFT OUTER JOIN FETCH a.doctor.department "
				+ "where a.doctor.doctorId = " + id
				+ " and a.appointmentStatus='待诊'";
		return getSession().createQuery(hql).list();
	}

	public List<Appointment> getDoneAppointmentByDoc(Integer id)
	{
		String hql = "FROM Appointment a LEFT OUTER JOIN FETCH a.patient "
				+ "LEFT OUTER JOIN FETCH a.doctor "
				+ "LEFT OUTER JOIN FETCH a.doctor.department "
				+ "where a.doctor.doctorId = " + id
				+ " and a.appointmentStatus='完成'";
		return getSession().createQuery(hql).list();
	}
	public List<Appointment> getDocAppByDate(Integer id,String date)
	{
		String hql = "FROM Appointment a LEFT OUTER JOIN FETCH a.patient "
				+ "LEFT OUTER JOIN FETCH a.doctor "
				+ "LEFT OUTER JOIN FETCH a.doctor.department "
				+ "where a.doctor.doctorId = " + id
				+ " and a.appointmentDate='"+date+"'";
		return getSession().createQuery(hql).list();
	}
	

	public List<Appointment> getSearch(String k1, String k2, String k3,
			String k4)
	{
		DetachedCriteria dc = DetachedCriteria.forClass(Appointment.class);
		dc.createAlias("patient", "p");
		dc.createAlias("doctor", "d");
		dc.createAlias("d.department", "dp");
		if (k1 != "null" && k1 != "")
		{
			// System.out.println("------"+k1);
			dc.add(Restrictions.like("d.doctorName", "%" + k1 + "%"));
		}
		if (k2 != "null" && k2 != "")
		{
			dc.add(Restrictions.like("p.patientName", "%" + k2 + "%"));
		}
		if (k3 != "null" && k3 != "")
		{
			dc.add(Restrictions.eq("appointmentDate", k3));
		}
		dc.add(Restrictions.eq("appointmentStatus", k4));
		Criteria c = dc.getExecutableCriteria(this.getSession());
		List<Appointment> list = c.list();
		return list;
	}
	
	public List<Appointment> getSearch2(String k1, String k2, String k3,
			String k4)
	{
		DetachedCriteria dc = DetachedCriteria.forClass(Appointment.class);
		dc.createAlias("patient", "p");
		dc.createAlias("doctor", "d");
		dc.createAlias("d.department", "dp");
		if (k1 != "null" && k1 != "")
		{
			// System.out.println("------"+k1);
			dc.add(Restrictions.eq("d.doctorName", k1));
		}
		if (k2 != "null" && k2 != "")
		{
			dc.add(Restrictions.like("p.patientName", "%" + k2 + "%"));
		}
		if (k3 != "null" && k3 != "")
		{
			dc.add(Restrictions.eq("appointmentDate", k3));
		}
		dc.add(Restrictions.eq("appointmentStatus", k4));
		Criteria c = dc.getExecutableCriteria(this.getSession());
		List<Appointment> list = c.list();
		return list;
	}
	

	// 删除对象
	public void delAppointment(Integer appointmentId)
	{
		String hql = "DELETE FROM Appointment a where a.appointmentId = "
				+ appointmentId;
		getSession().createQuery(hql).executeUpdate();
	}

	// 保存或修改对象
	public void saveOrUpdate(Appointment a)
	{
		getSession().saveOrUpdate(a);
	}
}
