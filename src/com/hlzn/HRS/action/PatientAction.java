package com.hlzn.HRS.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;

import com.hlzn.HRS.entities.Appointment;
import com.hlzn.HRS.entities.Department;
import com.hlzn.HRS.entities.Doctor;
import com.hlzn.HRS.entities.Notice;
import com.hlzn.HRS.entities.Patient;
import com.hlzn.HRS.entities.Workforce;
import com.hlzn.HRS.service.AppointmentService;
import com.hlzn.HRS.service.DepartmentService;
import com.hlzn.HRS.service.DoctorService;
import com.hlzn.HRS.service.HospitalService;
import com.hlzn.HRS.service.NoticeService;
import com.hlzn.HRS.service.PatientService;
import com.hlzn.HRS.service.WorkforceService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public class PatientAction extends ActionSupport implements RequestAware,
		ModelDriven<Patient>, Preparable
{
	// patient的登陆、注册、都放在这里了
	// 谁的数据谁负责
	private Map<String, Object> request;
	private PatientService patientService;
	private NoticeService noticeService;
	private HospitalService hospitalService;
	private DoctorService doctorService;
	private Patient model;
	private DepartmentService departmentService;
	private AppointmentService appointmentService;
	private InputStream inputStream;
	private WorkforceService workforceService;
	private int id;
	private int regid;

	public String login()
	{
		Integer username = Integer.parseInt(getParam("username"));
		String password = getParam("password");
		Patient p = patientService.getPatient(username);
		int status = 0;
		if (p == null || !p.getPatientPassword().equals(password))
		{
			status = 1;
			request.put("status", status);
			return "index";
		} else if (p.getPatientPassword().equals(password))
		{
			status = 2;
			request.put("status", status);
			patientService.setPatient(p);
			

		}
		// 装新闻
		request.put("news", noticeService.getAllNotice());
		// 装医生
		request.put("doctors", doctorService.getAllDoctor());
		return "welcome";
	}

	public String quitSystem()
	{
		patientService.clean();
		return "quit";
	}

	public String menuJump()
	{
		String menu = getParam("menuName");
		if (menu.equals("welcome"))
		{
			menuJudge();
			// 装新闻
			request.put("news", noticeService.getAllNotice());
			// 装医生
			request.put("doctors", doctorService.getAllDoctor());
			return "welcome";
		}
		else if (menu.equals("news"))
		{
			menuJudge();
			request.put("news", noticeService.getAllNotice());
			return "news";
		}
		else if (menu.equals("hospital"))
		{
			menuJudge();
			request.put("hospital", hospitalService.getHospital());
			return "hospital";
		}
		else if (menu.equals("searchks"))
		{
			menuJudge();
			// 放置所有科室的list
			request.put("departments", departmentService.getAllDepartment());
			return "searchks";
		}
		else if (menu.equals("index"))
		{
			return "index";
		}
		else if (menu.equals("reg"))
		{
			return "reg";
		}
		else
			return null;
	}

	public void menuJudge()
	{
		Patient p = patientService.getMyPatient();
		if (p != null)
		{
			request.put("status", 2);
		} else
		{
			request.put("status", 0);
		}
	}

	public String infShow()
	{
		return "grinfo";
	}

	public String myAppoint()
	{
		menuJudge();
		// 我的预约
		Patient p = patientService.getMyPatient();
		Integer id = p.getPatientId();
		request.put("appointments",
				appointmentService.getAppointmentByPatient(id));
		return "myyy";
	}

	public void prepareInfShow()
	{
		menuJudge();
		model = patientService.getMyPatient();
	}

	public String search()
	{
		menuJudge();
		// 接收条件
		int i = Integer.parseInt(getParam("key1"));
		String key2 = getParam("key2");
		//System.out.println("传来的" + key2 + "  " + i);
		if (i == 1)
		{
			// 查查科室//填充数据
			request.put("departments", departmentService.searchDepartment(key2));
			return "searchkeshi";
		}
		if (i == 2)
		{
			// 查查医生，填充数据
			request.put("doctors", doctorService.searchDoctors(key2));
			return "searchys";
		}
		return "searchys";
	}

	public String infModify()
	{
		patientService.saveOrUpdate(model);
		return "infModify";
	}

	public String newPatient()
	{
		patientService.saveOrUpdate(model);
		return "index";
	}

	public void prepareNewPatient()
	{
		model = new Patient();
	}

	// *******************zxc的通用套路**************************//
	public String list()
	{
		request.put("patients", patientService.getAllPatient());
		return "list";
	}

	public String delete()
	{
		try
		{
			patientService.delPatient(id);

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
		// System.out.println(id + "*********");
		model = patientService.getPatient(id);
	}

	public void prepareLook()
	{
		// System.out.println(id + "*********");
		model = patientService.getPatient(id);
	}

	public String look()
	{
		return "look";
	}

	public String add()
	{
		request.put("status", 1);
		return "input";
	}

	public void prepareAdd()
	{
		model = new Patient();
	}

	public String save()
	{
		patientService.saveOrUpdate(model);
		return "success";
	}

	public void prepareSave()
	{
		if (model.getPatientId() == null)
		{
			model = new Patient();
		} else
		{
			model = patientService.getPatient(id);
		}
	}

	public String adminSearch()
	{
		String key = getParam("key");
		request.put("patients", patientService.getSomePatient(key));
		return "list";
	}
	//*****终于写到预约了，2017-05-11，ajax输出流
	public String makeAppointment()
	{
		/**
		 * 思路
		 * 1.接过来一个排班信息的id
		 * 2.获取排班信息中的医生id，时间，
		 * 3.由以上两条加上当前的患者，查在预约表里有没有一样的
		 * 4.有相同的就拒绝预约，返回一个错误码，500吧
		 * 
		 * 5.没有相同的话，
		 * 5-1看看当前已预约人数是不是达到上限
		 * 5-1-1达到了，返回一个错误码，501吧
		 * 5-1-2没达到。就新增一个预约表的信息，变当前排班表信息中的已预约人数+1返回502
		 * 成功码就是502
		 * 监控全程，出错就返回404
		 * 困死了................！！
		 * **/
		try
		{
			Workforce workforce=workforceService.getWorkforce(id);
			Doctor d=workforce.getDoctor();
			Patient p=patientService.getMyPatient();
			boolean x=appointmentService.checkingSameApp(
					d.getDoctorId(), p.getPatientId(), 
					workforce.getWorkforceDate());
			if(x==true)//有
			{
				inputStream = new ByteArrayInputStream("500".getBytes("UTF-8"));
			}
			else if(workforce.getWorkforceAppNum()==workforce.getWorkforcePatNum())
			{
				inputStream = new ByteArrayInputStream("501".getBytes("UTF-8"));
			}
			else 
			{
				Appointment a=new Appointment();
				a.setDoctor(d);
				a.setPatient(p);
				a.setAppointmentDate(workforce.getWorkforceDate());
				a.setAppointmentStatus("待诊");
				/**
				 * 建议就诊时间思路
				 * 把排班数分成4份
				 * 
				 * 8:00,10:00,14:00,16:00*/
				int numGet=workforce.getWorkforceAppNum()+1;
				String numStr=""+numGet;
				a.setAppointmentNum(numStr);
				int numline=workforce.getWorkforcePatNum();//上限
				if(numGet>(numline*0.75))
				{
					a.setAppointmentRemark("16:00PM");
				}
				else if(numGet>(numline*0.5))
				{
					a.setAppointmentRemark("14:00AM");
				}
				else if(numGet>(numline*0.25))
				{
					a.setAppointmentRemark("10:00PM");
				}
				else
				{
					a.setAppointmentRemark("08:00AM");
				}
				appointmentService.saveOrUpdate(a);
				//+1
				int num=workforce.getWorkforceAppNum();
				num=num+1;
				workforce.setWorkforceAppNum(num);
				workforceService.saveOrUpdate(workforce);
				inputStream = new ByteArrayInputStream("502".getBytes("UTF-8"));
			}

			
		} catch (Exception e)
		{
			e.printStackTrace();
			try
			{
				inputStream = new ByteArrayInputStream("404".getBytes("UTF-8"));
			} catch (UnsupportedEncodingException e1)
			{
				e1.printStackTrace();
			}
		}
		return "order";
	}
	//ajax动态显示id是否可用
	public String validateId() throws UnsupportedEncodingException
	{
		try
		{
			if(patientService.ldIsValid(regid)){
				inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
			}else{
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8")); 
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
			try
			{
				inputStream = new ByteArrayInputStream("404".getBytes("UTF-8"));
			} catch (UnsupportedEncodingException e1)
			{
				e1.printStackTrace();
			}
		}
		return "regId";
	}
	
	// *******************zxc的通用套路**************************//
	private String getParam(String key)
	{
		return ServletActionContext.getRequest().getParameter(key);
	}

	@Override
	public void setRequest(Map<String, Object> arg0)
	{
		// TODO Auto-generated method stub
		this.request = arg0;

	}

	public PatientService getPatientService()
	{
		return patientService;
	}

	public void setPatientService(PatientService patientService)
	{
		this.patientService = patientService;
	}

	public NoticeService getNoticeService()
	{
		return noticeService;
	}

	public void setNoticeService(NoticeService noticeService)
	{
		this.noticeService = noticeService;
	}

	public HospitalService getHospitalService()
	{
		return hospitalService;
	}

	public void setHospitalService(HospitalService hospitalService)
	{
		this.hospitalService = hospitalService;
	}

	public DoctorService getDoctorService()
	{
		return doctorService;
	}

	public void setDoctorService(DoctorService doctorService)
	{
		this.doctorService = doctorService;
	}

	public Patient getModel()
	{
		return model;
	}

	public void setModel(Patient model)
	{
		this.model = model;
	}

	@Override
	public void prepare() throws Exception
	{
	}

	public DepartmentService getDepartmentService()
	{
		return departmentService;
	}

	public void setDepartmentService(DepartmentService departmentService)
	{
		this.departmentService = departmentService;
	}

	public AppointmentService getAppointmentService()
	{
		return appointmentService;
	}

	public void setAppointmentService(AppointmentService appointmentService)
	{
		this.appointmentService = appointmentService;
	}

	public InputStream getInputStream()
	{
		return inputStream;
	}

	public void setInputStream(InputStream inputStream)
	{
		this.inputStream = inputStream;
	}

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public WorkforceService getWorkforceService()
	{
		return workforceService;
	}

	public void setWorkforceService(WorkforceService workforceService)
	{
		this.workforceService = workforceService;
	}

	public int getRegid()
	{
		return regid;
	}

	public void setRegid(int regid)
	{
		this.regid = regid;
	}
	
}
