package com.hlzn.HRS.action;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Map;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.hlzn.HRS.entities.Doctor;
import com.hlzn.HRS.entities.Patient;
import com.hlzn.HRS.service.DepartmentService;
import com.hlzn.HRS.service.DoctorService;
import com.hlzn.HRS.service.PatientService;
import com.hlzn.HRS.service.PermissionService;
import com.hlzn.HRS.service.WorkforceService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public class DoctorAction extends ActionSupport implements SessionAware,
		RequestAware, ModelDriven<Doctor>, Preparable
{
	// 这个类负责对医生用户的登录
	private Map<String, Object> request;
	private DoctorService doctorService;
	private Integer doctorId;
	private int id;
	private InputStream inputStream;
	private String doctorPassword;
	private Doctor model;
	private PatientService patientService;
	private DepartmentService departmentService;
	private File myFile;
	private String fileName;
	private String saveName;
	private static final int BUFFER_SIZE = 8 * 1024;
	private WorkforceService workforceService;
	private PermissionService permissionService;
	private int regid;

	public String loginCheck() throws IOException
	{
		// 这里采用ajax的方式来实现数据传递
		HttpServletRequest requestA = ServletActionContext.getRequest();
		Integer userName = Integer.parseInt(requestA.getParameter("userName"));
		String password = requestA.getParameter("password");
		// System.out.println("ajax传来的账户！"+userName);
		// System.out.println("ajax传来的密码！"+password);
		HttpServletResponse responseA = ServletActionContext.getResponse();
		responseA.setContentType("text/html; charset=UTF-8");
		PrintWriter out = responseA.getWriter();
		Doctor d = doctorService.getDoctor(userName);
		if (d == null)
		{
			// System.out.println("这是账户错了");
			out.print("WrongName");
		} else if (!d.getDoctorPassword().equals(password))
		{
			// System.out.println("这是密码错了");
			// System.out.println("正确的是"+d.getDoctorPassword());
			out.print("WrongPassword");
		} else
		{
			out.print("success");
		}
		return null;
	}

	public String login()
	{
		Doctor d = doctorService.getDoctor(doctorId);
		if (d == null)
		{
			// System.out.println("222这是账户错了");
			return "error";
		} else if (!d.getDoctorPassword().equals(doctorPassword))
		{
			// System.out.println("222这是密码错了");
			return "error";
		} else
		{
			doctorService.setMyDoctor(d);
			return "home";
		}

	}

	public String quitSystem()
	{
		doctorService.clean();
		return "quit";
	}

	public String getName() throws IOException
	{
		// 先取
		HttpServletRequest request;
		request = ServletActionContext.getRequest();
		String name = null;
		name = (String) request.getSession().getAttribute("MyDoctorName");
		// 再发
		HttpServletResponse responseA = ServletActionContext.getResponse();
		responseA.setContentType("text/html; charset=UTF-8");
		PrintWriter out = responseA.getWriter();
		if (name != null)
		{
			out.print(name);
		} else
			out.print("null");

		return null;
	}

	public String doctorDetail()
	{
		// 验证一下用户登录的情况
		menuJudge();
		// 这里要填充一下排班信息
		//
		
		request.put("workforces", workforceService.getWorkforceByDoc(model.getDoctorId()));

		return "yspb";
	}

	public void prepareDoctorDetail()
	{
		Integer id = Integer.parseInt(getParam("id"));
		model = doctorService.getDoctor(id);
	}

	private String getParam(String key)
	{
		return ServletActionContext.getRequest().getParameter(key);
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

	// 查询

	// *******************zxc的通用套路**************************//
	public String list()
	{
		request.put("doctors", doctorService.getAllDoctor());
		return "list";
	}

	public String delete()
	{
		try
		{
			doctorService.delDoctor(id);

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

	public void prepareInput()//
	{
		// System.out.println(id + "*********");
		request.put("departments", departmentService.getAllDepartment());
		request.put("userRoles", permissionService.getAllRoles());
		model = doctorService.getDoctor(id);
	}

	public void prepareLook()
	{
		// System.out.println(id + "*********");
		model = doctorService.getDoctor(id);
	}

	public String look()
	{
		return "look";
	}

	public String add()
	{
		return "input";
	}

	public void prepareAdd()//
	{
		model = new Doctor();
		request.put("departments", departmentService.getAllDepartment());
		request.put("userRoles", permissionService.getAllRoles());
		request.put("status", 1);
	}

	public String save()
	{
		if(myFile!=null)
		{
			/* 截取后缀名 */
			int pos = fileName.lastIndexOf(".");
			String str = fileName.substring(pos);
			// 时间加后缀名保存
			saveName = new Date().getTime() + str;
			//System.out.println("1"+saveName);
			// 根据服务器的文件保存地址和原文件名创建目录文件全路径
			File imageFile = new File(ServletActionContext.getServletContext()
					.getRealPath("images/doctors") + "/" + saveName);
			copy(myFile, imageFile);
			model.setDoctorImg(saveName);
			System.out.println("2"+saveName);
		}
		
		doctorService.saveOrUpdate(model);
		System.out.println("3"+model.getDoctorImg());
		return "success";
	}

	public void prepareSave()
	{
		if (model.getDoctorId() == null)
		{
			model = new Doctor();
		} else
		{
			model = doctorService.getDoctor(id);
		}
	}

	// 复制方法
	public static void copy(File src, File dst)
	{
		try
		{
			InputStream in = null;
			OutputStream out = null;
			try
			{
				in = new BufferedInputStream(new FileInputStream(src),
						BUFFER_SIZE);
				out = new BufferedOutputStream(new FileOutputStream(dst),
						BUFFER_SIZE);
				byte[] buffer = new byte[BUFFER_SIZE];
				while (in.read(buffer) > 0)
				{
					out.write(buffer);
				}
			} finally
			{
				if (null != in)
				{
					in.close();
				}
				if (null != out)
				{
					out.close();
				}
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	public String search()
	{
		String key1 = new String();
		key1 = getParam("key1");
		String key2 = new String();
		key2 = getParam("key2");
		if (key1 == null || key1 == "")
		{
			key1 = "null";
		}
		if (key2 == null || key2 == "")
		{
			key2 = "null";
		}
		request.put("doctors", doctorService.getSomeDoctors(key1, key2));
		return "list";
	}

	// *******************zxc的通用套路**************************//
	//******接下来要写个人信息的模块了
	public String information()
	{
		request.put("departments", departmentService.getAllDepartment());
		
		return "myInf";
	}
	public void prepareInformation()
	{
		model = doctorService.getMyDoctor();
	}
	public String mysave()
	{
		if(myFile!=null)
		{
			/* 截取后缀名 */
			int pos = fileName.lastIndexOf(".");
			String str = fileName.substring(pos);
			// 时间加后缀名保存
			saveName = new Date().getTime() + str;
			//System.out.println("1"+saveName);
			// 根据服务器的文件保存地址和原文件名创建目录文件全路径
			File imageFile = new File(ServletActionContext.getServletContext()
					.getRealPath("images/doctors") + "/" + saveName);
			copy(myFile, imageFile);
			model.setDoctorImg(saveName);
			System.out.println("2"+saveName);
		}
		doctorService.saveOrUpdate(model);
		System.out.println("3"+model.getDoctorImg());
		return "mySave";
	}

	public void prepareMysave()
	{
		
	}
	//验证账户是否可用
	public String validateId() throws IOException
	{
		try
		{
			if(doctorService.ldIsValid(regid)){
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
	// ********************
	public Map<String, Object> getRequest()
	{
		return request;
	}

	public void setRequest(Map<String, Object> request)
	{
		this.request = request;
	}

	public DoctorService getDoctorService()
	{
		return doctorService;
	}

	public void setDoctorService(DoctorService doctorService)
	{
		this.doctorService = doctorService;
	}

	public Integer getDoctorId()
	{
		return doctorId;
	}

	public void setDoctorId(Integer doctorId)
	{
		this.doctorId = doctorId;
	}

	public String getDoctorPassword()
	{
		return doctorPassword;
	}

	public void setDoctorPassword(String doctorPassword)
	{
		this.doctorPassword = doctorPassword;
	}

	@Override
	public void setSession(Map<String, Object> arg0)
	{
		this.request = arg0;

	}

	public Doctor getModel()
	{
		return model;
	}

	public void setModel(Doctor model)
	{
		this.model = model;
	}

	@Override
	public void prepare() throws Exception
	{
		// TODO Auto-generated method stub

	}

	public PatientService getPatientService()
	{
		return patientService;
	}

	public void setPatientService(PatientService patientService)
	{
		this.patientService = patientService;
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

	public DepartmentService getDepartmentService()
	{
		return departmentService;
	}

	public void setDepartmentService(DepartmentService departmentService)
	{
		this.departmentService = departmentService;
	}

	public File getMyFile()
	{
		return myFile;
	}

	public void setMyFile(File myFile)
	{
		this.myFile = myFile;
	}

	public String getFileName()
	{
		return fileName;
	}

	public void setFileName(String fileName)
	{
		this.fileName = fileName;
	}

	public String getSaveName()
	{
		return saveName;
	}

	public void setSaveName(String saveName)
	{
		this.saveName = saveName;
	}
	
	public void setMyFileFileName(String fileName) {
        this.fileName = fileName;
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

	public PermissionService getPermissionService()
	{
		return permissionService;
	}

	public void setPermissionService(PermissionService permissionService)
	{
		this.permissionService = permissionService;
	}
	
	
}
