package com.hlzn.HRS.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;

import com.hlzn.HRS.entities.Appointment;
import com.hlzn.HRS.entities.Doctor;
import com.hlzn.HRS.entities.Patient;
import com.hlzn.HRS.service.AppointmentService;
import com.hlzn.HRS.service.DoctorService;
import com.hlzn.HRS.service.PatientService;
import com.hlzn.HRS.service.WorkforceService;
import com.opensymphony.xwork2.ActionSupport;

public class AppointmentAction extends ActionSupport implements RequestAware
{
	private AppointmentService appointmentService;
	private PatientService patientService;
	private Map<String, Object> request;
	private InputStream inputStream;
	private Appointment model;
	private int id;
	private DoctorService doctorService;
	private WorkforceService workforceService;
	public String cancel()
	{
		//记得要验证登录
		menuJudge();		
		try
		{
			
			
			
			Appointment a=appointmentService.getAppointment(id);
			workforceService.cancelApp(a);
			appointmentService.cancelApp(id);
			//奶奶个腿的，取消预约不懂得减人数啊！！
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
		return "cancel";
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
	public String list()
	{
		request.put("appointments",appointmentService.getWaitApp());
		return "list";
	}
	public String record()
	{
		request.put("appointments",appointmentService.getDoneApp());
		return "record";
	}
	public String done()
	{
		try
		{
			model=appointmentService.getAppointment(id);
			model.setAppointmentStatus("完成");
			appointmentService.saveOrUpdate(model);

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
		return "done";
	}
	public String search()
	{
		String key1=new String();
		key1=getParam("key1");
		String key2=new String();
		key2=getParam("key2");
		String key3=new String();
		key3=getParam("key3");
		if(key1==null||key1=="")
		{
			key1="null";
		}
		if(key2==null||key2=="")
		{
			key2="null";
		}
		if(key3==null||key3=="")
		{
			key3="null";
		}
		String key4=getParam("key4");
		request.put("appointments", appointmentService.getSomeApp(key1, key2, key3,key4));
		return "list";
	}
	
	public String myPatient()
	{
		Doctor d=doctorService.getMyDoctor();
		request.put("appointments",appointmentService.getWaitAppByDoc(d.getDoctorId()));
		return "myPatients";
	}
	public String workDone()
	{
		Doctor d=doctorService.getMyDoctor();
		request.put("appointments",appointmentService.getDoneAppByDoc(d.getDoctorId()));
		return "myDone";
	}
	
	public String mysearch()
	{
		String key1=new String();
		key1=doctorService.getMyDoctor().getDoctorName();
		String key2=new String();
		key2=getParam("key2");
		String key3=new String();
		key3=getParam("key3");
		if(key1==null||key1=="")
		{
			key1="null";
		}
		if(key2==null||key2=="")
		{
			key2="null";
		}
		if(key3==null||key3=="")
		{
			key3="null";
		}
		String key4=getParam("key4");
		request.put("appointments", appointmentService.getSomeApp2(key1, key2, key3,key4));
		return "myPatients";
	}
	//**************
	
	public AppointmentService getAppointmentService()
	{
		return appointmentService;
	}
	public void setAppointmentService(AppointmentService appointmentService)
	{
		this.appointmentService = appointmentService;
	}
	public PatientService getPatientService()
	{
		return patientService;
	}
	public void setPatientService(PatientService patientService)
	{
		this.patientService = patientService;
	}
	public void setRequest(Map<String, Object> request)
	{
		this.request = request;
	}
	public InputStream getInputStream()
	{
		return inputStream;
	}
	public void setInputStream(InputStream inputStream)
	{
		this.inputStream = inputStream;
	}
	public Appointment getModel()
	{
		return model;
	}
	public void setModel(Appointment model)
	{
		this.model = model;
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public DoctorService getDoctorService()
	{
		return doctorService;
	}
	public void setDoctorService(DoctorService doctorService)
	{
		this.doctorService = doctorService;
	}
	public WorkforceService getWorkforceService()
	{
		return workforceService;
	}
	public void setWorkforceService(WorkforceService workforceService)
	{
		this.workforceService = workforceService;
	}
	
}
