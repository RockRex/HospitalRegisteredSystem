package com.hlzn.HRS.service;

import java.util.List;

import com.hlzn.HRS.dao.NoticeDao;
import com.hlzn.HRS.entities.Notice;

public class NoticeService
{
	private NoticeDao noticeDao;
	
	public List<Notice> getAllNotice()
	{
		return noticeDao.getAllNotice();
	}
	public Notice getNotice(Integer id)
	{
		return noticeDao.getNotice(id);
	}
	public void delNotice(Integer id)
	{
		noticeDao.delNotice(id);
	}
	public void saveOrUpdate(Notice n)
	{
		noticeDao.saveOrUpdate(n);
	}
	public List<Notice> getSomeNotice(String k1,String k2)
	{
		return noticeDao.getSomeNotice(k1,k2);
	}
	//*****
	public NoticeDao getNoticeDao()
	{
		return noticeDao;
	}

	public void setNoticeDao(NoticeDao noticeDao)
	{
		this.noticeDao = noticeDao;
	}
	
}
