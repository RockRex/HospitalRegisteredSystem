package com.hlzn.HRS.action;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import com.hlzn.HRS.entities.Department;
import com.hlzn.HRS.entities.Doctor;
import com.hlzn.HRS.entities.Workforce;
import com.hlzn.HRS.service.DepartmentService;
import com.hlzn.HRS.service.DoctorService;
import com.hlzn.HRS.service.WorkforceService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public class WorkforceAction extends ActionSupport implements RequestAware,
		ModelDriven<Workforce>, Preparable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private DoctorService doctorService;
	private WorkforceService workforceService;
	private Workforce model;
	private InputStream inputStream;
	private int id;
	private Map<String, Object> request;

	
	public String list()
	{
		List<Workforce> list = workforceService.getAllWorkforce();
		request.put("workforces", list);
		request.put("doctors", doctorService.getAllDoctor());
		return "list";
	}
	
	public String delete()
	{
		try
		{
			workforceService.delWorkforce(id);

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
		request.put("doctors", doctorService.getAllDoctor());
		return "input";
	}

	public void prepareInput()
	{
		System.out.println(id + "*********");
		model = workforceService.getWorkforce(id);

	}
	public String add()
	{
		
		return "input";
	}

	public void prepareAdd()
	{
		model = new Workforce();
		request.put("doctors", doctorService.getAllDoctor());

	}
	public String save()
	{
		workforceService.saveOrUpdate(model);
		return "success";
	}

	public void prepareSave()
	{
		if (model.getWorkforceId() == null)
		{
			model = new Workforce();
		}
		else
		{
			model = workforceService.getWorkforce(id);
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
		request.put("workforces", workforceService.getSomeWorkforce(key1, key2));
		return "list";
	}
	private String getParam(String key)
	{
		return ServletActionContext.getRequest().getParameter(key);
	}
	///*****个人的*********************
	public String myWorkforce()
	{
		Doctor d =doctorService.getMyDoctor();
		request.put("workforces", workforceService.getWorkforceByDoc(d.getDoctorId()));
		return "myWorkforce";
	}
	public String myadd()
	{
		
		return "myinput";
	}

	public void prepareMyadd()
	{
		model = new Workforce();
		model.setDoctor(doctorService.getMyDoctor());

	}
	
	public String mysave()
	{
		model.setDoctor(doctorService.getMyDoctor());
		workforceService.saveOrUpdate(model);
		return "mysuccess";
	}

	public void prepareMysave()
	{
		
		if (model.getWorkforceId() == null)
		{
			model = new Workforce();
		}
		else
		{
			model = workforceService.getWorkforce(id);
		}
		
	}
	public String mysearch()
	{
		String key1=new String();
		key1=doctorService.getMyDoctor().getDoctorName();
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
		request.put("workforces", workforceService.getSomeWorkforce2(key1, key2));
		return "myWorkforce";
	}
	// ********
	public InputStream getInputStream()
	{
		return inputStream;
	}
	
	public void setModel(Workforce model)
	{
		this.model = model;
	}

	public void setWorkforceService(WorkforceService workforceService)
	{
		this.workforceService = workforceService;
	}

	public WorkforceService getWorkforceService()
	{
		return workforceService;
	}

	public void setDoctorService(DoctorService doctorService)
	{
		this.doctorService = doctorService;
	}

	public DoctorService getDoctorService()
	{
		return doctorService;
	}

	

	public void setId(int id)
	{
		this.id = id;
	}

	public int getId()
	{
		return id;
	}

	@Override
	public void setRequest(Map<String, Object> arg0)
	{
		this.request = arg0;
	}

	@Override
	public void prepare() throws Exception
	{
		// TODO Auto-generated method stub
	}

	@Override
	public Workforce getModel()
	{
		// TODO Auto-generated method stub
		return model;
	}
}
