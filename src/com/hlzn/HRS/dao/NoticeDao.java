package com.hlzn.HRS.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.hlzn.HRS.entities.Notice;

public class NoticeDao extends BaseDao
{
	public Notice getNotice(Integer noticeId)
	{
		String hql = "FROM Notice n where n.noticeId = " + noticeId;
		List<Notice> list = getSession().createQuery(hql).list();
		if (list.size() > 0)
		{
			return list.get(0);
		} else
			return null;
	}

	public List<Notice> getAllNotice()
	{
		String hql = "FROM Notice";
		return getSession().createQuery(hql).list();
	}
	public List<Notice> getSomeNotice(String k1,String k2)
	{
		DetachedCriteria dc = DetachedCriteria.forClass(Notice.class);
		if (k1 != "null" && k1 != "")
		{
			dc.add(Restrictions.like("noticeTitle","%"+ k1+"%"));
		}
		if (k2 != "null" && k2 != "")
		{
			dc.add(Restrictions.eq("noticeSavetime", k2));
		}
		Criteria c = dc.getExecutableCriteria(this.getSession());
		List<Notice> list=c.list();
		return list;
	}
	// 删除对象
	public void delNotice(Integer noticeId)
	{
		String hql = "DELETE FROM Notice n where n.noticeId = " + noticeId;
		getSession().createQuery(hql).executeUpdate();
	}

	// 保存或修改对象
	public void saveOrUpdate(Notice n)
	{
		getSession().saveOrUpdate(n);
	}
}
