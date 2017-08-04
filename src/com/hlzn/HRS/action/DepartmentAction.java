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
import com.hlzn.HRS.entities.Patient;
import com.hlzn.HRS.service.DepartmentService;
import com.hlzn.HRS.service.DoctorService;
import com.hlzn.HRS.service.PatientService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public class DepartmentAction extends ActionSupport implements RequestAware,
		ModelDriven<Department>, Preparable
{

	/**
	 * 
	 */
	
	
	private static final long serialVersionUID = 1L;
	private DepartmentService departmentService;
	private Integer id;
	private InputStream inputStream;
	private Department model;
	private Map<String, Object> request;
	private DoctorService doctorService;
	private PatientService patientService;
	public String list()
	{
		List<Department> list = departmentService.getAllDepartment();
		request.put("departments", list);
		return "list";
	}
	public String delete()
	{
		try
		{
			departmentService.delDepartment(id);

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
		if(id!=null)
		{
			model = departmentService.getDepartment(id);
		}
		else
		{
			model = new Department();
		}

	}
	
	public String add()
	{
		return "input";
	}

	public void prepareAdd()
	{
		model = new Department();

	}
	
	public String save()
	{
		System.out.println(model);
		departmentService.saveOrUpdate(model);
		return "success";
	}

	public void prepareSave()
	{
		if(id==null)
		{
			model = new Department();
		}
		else
		{
			model=departmentService.getDepartment(id);
		}
		
	}
	public String departmentDetail()
	{
		//验证一下用户登录的情况
		menuJudge();
		return "ksinfo";
	}
	public void prepareDepartmentDetail()
	{
		Integer id = Integer.parseInt(getParam("id"));
		model=departmentService.getDepartment(id);
		//填充一下医生信息
		request.put("doctors",doctorService.getDoctorsByDepart(model.getDepartmentId()));
	}
	private String getParam(String key)
	{
		return ServletActionContext.getRequest().getParameter(key);
	}
	public void menuJudge()
	{
		Patient p=patientService.getMyPatient();
		if(p!=null)
		{
			request.put("status",2);
		}
		else
		{
			request.put("status",0);
		}
	}
	public String search()
	{
		String key=getParam("key");
		request.put("departments",departmentService.searchDepartment(key));
		
		return "list";
	}
	
	//**************
	public void setDepartmentService(DepartmentService departmentService)
	{
		this.departmentService = departmentService;
	}
	public void setId(int id)
	{
		this.id = id;
	}

	public int getId()
	{
		return id;
	}

	public InputStream getInputStream()
	{
		return inputStream;
	}

	

	

	@Override
	public void setRequest(Map<String, Object> arg0)
	{
		this.request = arg0;
	}

	

	public void setModel(Department model)
	{
		this.model = model;
	}

	@Override
	public Department getModel()
	{
		// TODO Auto-generated method stub
		return model;
	}

	@Override
	public void prepare() throws Exception
	{
		// TODO Auto-generated method stub
	}
	public DoctorService getDoctorService()
	{
		return doctorService;
	}
	public void setDoctorService(DoctorService doctorService)
	{
		this.doctorService = doctorService;
	}
	public PatientService getPatientService()
	{
		return patientService;
	}
	public void setPatientService(PatientService patientService)
	{
		this.patientService = patientService;
	}
	
}
