package com.hlzn.HRS.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.hlzn.HRS.entities.Doctor;

public class DoctorDao extends BaseDao
{
	public Doctor getDoctor(Integer doctorId)
	{
		String hql = "FROM Doctor d LEFT OUTER JOIN FETCH d.department" +
				" LEFT OUTER JOIN FETCH d.userRole where d.doctorId = "
				+ doctorId;
		List<Doctor> list =getSession().createQuery(hql).list();
		if(list.size()>0)
		{
			return list.get(0);
		}
		else
			return null;
	}

	public List<Doctor> getAllDoctor()
	{
		String hql = "FROM Doctor d LEFT OUTER JOIN FETCH d.department" +
				" LEFT OUTER JOIN FETCH d.userRole";
		return getSession().createQuery(hql).list();
	}
	public List<Doctor> getSearchDoctor(String key)
	{
		String hql = "FROM Doctor as d LEFT OUTER JOIN FETCH d.userRole where d.doctorName like '%"+key+"%'";
		return getSession().createQuery(hql).list();
	}
	public List<Doctor> getSomeDoctor(String k1,String k2)
	{
		DetachedCriteria dc = DetachedCriteria.forClass(Doctor.class).createAlias("department", "dp").createAlias("userRole", "ur");
		if (k1 != "null" && k1 != "")
		{
			dc.add(Restrictions.like("doctorName", "%"+ k1+"%"));
		}
		if (k2 != "null" && k2 != "")
		{
			dc.add(Restrictions.or(Restrictions.like("dp.departmentName","%"+ k2+"%"),
					Restrictions.like("dp.departmentType","%"+ k2+"%")));
		}
		
		Criteria c = dc.getExecutableCriteria(this.getSession());
		List<Doctor> list=c.list();
		return list;
	}
	public List<Doctor> getDoctorsByDepart(Integer id)
	{
		String hql = "FROM Doctor d LEFT OUTER JOIN FETCH d.department " +
				"LEFT OUTER JOIN FETCH d.userRole " +
				"where d.department.departmentId = "+id;
		return getSession().createQuery(hql).list();
	}
	public List<Doctor> getByRole(Integer id)
	{
		String hql = "FROM Doctor d LEFT OUTER JOIN FETCH d.department " +
				"LEFT OUTER JOIN FETCH d.userRole " +
				"where d.userRole.userRoleId = "+id;
		return getSession().createQuery(hql).list();
	}
	// 删除对象
	public void delDoctor(Integer doctorId)
	{
		String hql = "DELETE FROM Doctor d LEFT OUTER JOIN FETCH d.userRole where d.doctorId = "
				+ doctorId;
		getSession().createQuery(hql).executeUpdate();
	}

	// 保存或修改对象
	public void saveOrUpdate(Doctor d)
	{
		getSession().saveOrUpdate(d);
	}
}
