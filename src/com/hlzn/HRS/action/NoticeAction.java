package com.hlzn.HRS.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;

import com.hlzn.HRS.entities.Notice;
import com.hlzn.HRS.service.NoticeService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public class NoticeAction extends ActionSupport implements RequestAware,
ModelDriven<Notice>, Preparable
{
	private NoticeService noticeService;
	private Map<String, Object> request;
	private Notice model;
	private int id;
	private InputStream inputStream;
	public String noticeDetail()
	{
		return "newsx";
	}
	public void prepareNoticeDetail()
	{
		Integer noticeId = Integer.parseInt(getParam("id"));
		model=noticeService.getNotice(noticeId);
	}
	//*******************zxc的通用套路**************************//
	public String list()
	{
		request.put("notices", noticeService.getAllNotice());
		return "list";
	}
	
	public String delete()
	{
		try
		{
			noticeService.delNotice(id);

			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} catch (Exception e)
		{
			e.printStackTrace();
			try
			{
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			} catch (UnsupportedEncodingException e1)
			{
				e1.printStackTrace();
			}
		}
		return "delete";
	}

	public String input()
	{
		return "input";
	}

	public void prepareInput()
	{
		//System.out.println(id + "*********");
		model = noticeService.getNotice(id);
	}
	
	public void prepareLook()
	{
		//System.out.println(id + "*********");
		model = noticeService.getNotice(id);
	}
	public String look()
	{
		return "look";
	}
	public String add()
	{
		return "input";
	}
	public void prepareAdd()
	{
		model = new Notice();
	}
	public String save()
	{
		noticeService.saveOrUpdate(model);
		return "success";
	}

	public void prepareSave()
	{
		if (model.getNoticeId() == null)
		{
			model = new Notice();
		}
		else
		{
			model = noticeService.getNotice(id);
		}
	}
	
	public String search()
	{
		String key1=new String();
		key1=getParam("key1");
		String key2=new String();
		key2=getParam("key2");
		if(key1==null||key1=="")
		{
			key1="null";
		}
		if(key2==null||key2=="")
		{
			key2="null";
		}
		request.put("notices", noticeService.getSomeNotice(key1, key2));
		return "list";
	}
	private String getParam(String key)
	{
		return ServletActionContext.getRequest().getParameter(key);
	}
	//*******************zxc的通用套路**************************//
	//***
	public NoticeService getNoticeService()
	{
		return noticeService;
	}

	public void setNoticeService(NoticeService noticeService)
	{
		this.noticeService = noticeService;
	}
	@Override
	public void prepare() throws Exception
	{	
	}
	@Override
	public Notice getModel()
	{
		// TODO Auto-generated method stub
		return model;
	}
	@Override
	public void setRequest(Map<String, Object> arg0)
	{
		// TODO Auto-generated method stub
		this.request=arg0;
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public InputStream getInputStream()
	{
		return inputStream;
	}
	public void setInputStream(InputStream inputStream)
	{
		this.inputStream = inputStream;
	}
	
}
