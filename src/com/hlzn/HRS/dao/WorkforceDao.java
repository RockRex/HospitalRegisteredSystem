package com.hlzn.HRS.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.hlzn.HRS.entities.Workforce;

public class WorkforceDao extends BaseDao
{
	public Workforce getWorkforce(Integer workforceId)
	{
		String hql = "FROM Workforce w where w.workforceId = " + workforceId;
		List<Workforce> list = getSession().createQuery(hql).list();
		if (list.size() > 0)
		{
			return list.get(0);
		} else
			return null;
	}

	public List<Workforce> getAllWorkforce()
	{
		String hql = "FROM Workforce w LEFT OUTER JOIN FETCH w.doctor";
		//String hql = "FROM Workforce";
		return getSession().createQuery(hql).list();
	}
	
	public List<Workforce> getWorkforceByDoc(Integer id)
	{
		String hql = "FROM Workforce w LEFT OUTER JOIN FETCH w.doctor" +
				" where w.doctor.doctorId="+id;
		
		return getSession().createQuery(hql).list();
	}
	public List<Workforce> getSomeWorkforce(String k1,String k2)
	{
		DetachedCriteria dc = DetachedCriteria.forClass(Workforce.class).createAlias("doctor", "d");
		if (k1 != "null" && k1 != "")
		{
			dc.add(Restrictions.like("d.doctorName","%"+ k1+"%"));
		}
		if (k2 != "null" && k2 != "")
		{
			dc.add(Restrictions.eq("workforceDate", k2));
		}
		Criteria c = dc.getExecutableCriteria(this.getSession());
		List<Workforce> list=c.list();
		return list;
	}
	
	public List<Workforce> getSomeWorkforce2(String k1,String k2)
	{
		DetachedCriteria dc = DetachedCriteria.forClass(Workforce.class).createAlias("doctor", "d");
		if (k1 != "null" && k1 != "")
		{
			dc.add(Restrictions.eq("d.doctorName",k1));
		}
		if (k2 != "null" && k2 != "")
		{
			dc.add(Restrictions.eq("workforceDate", k2));
		}
		Criteria c = dc.getExecutableCriteria(this.getSession());
		List<Workforce> list=c.list();
		return list;
	}
	
	public List<Workforce> getWorkforceByDate(String date)
	{
		String hql = "FROM Workforce w LEFT OUTER JOIN FETCH w.doctor" +
				" where w.workforceDate='"+date+"'";
		
		return getSession().createQuery(hql).list();
	}
	// 删除对象
	public void delWorkforce(Integer workforceId)
	{
		String hql = "DELETE FROM Workforce w where w.workforceId = " + workforceId;
		getSession().createQuery(hql).executeUpdate();
	}

	// 保存或修改对象
	public void saveOrUpdate(Workforce w)
	{
		getSession().saveOrUpdate(w);
	}
}
