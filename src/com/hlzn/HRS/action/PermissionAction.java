package com.hlzn.HRS.action;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;

import com.alibaba.fastjson.JSON;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.hlzn.HRS.entities.Doctor;
import com.hlzn.HRS.entities.Permission;
import com.hlzn.HRS.entities.RolePermission;
import com.hlzn.HRS.entities.UserRole;
import com.hlzn.HRS.service.DoctorService;
import com.hlzn.HRS.service.PermissionService;
import com.hlzn.HRS.tool.SimplePropertyFilter;
import com.opensymphony.xwork2.ActionSupport;

public class PermissionAction extends ActionSupport implements RequestAware
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private PermissionService permissionService;
	private Map<String, Object> request;
	private Integer id;
	private InputStream inputStream;
	private DoctorService doctorService;

	// 角色管理菜单跳转
	public String roleManage()
	{
		// 获取所有的角色信息，填充到视图里
		request.put("userRoles", permissionService.getAllRoles());
		return "roleList";
	}

	public String roleInput()
	{
		UserRole role = permissionService.getRole(id);
		request.put("userRole", role);
		request.put("status", 1);
		return "roleInput";
	}

	public String roleAdd()
	{
		return "roleInput";
	}

	public String roleSave()
	{
		UserRole userRole;
		String userRoleId = getParam("userRoleId");
		String userTypeName = getParam("userTypeName");
		if (userRoleId == null || userRoleId == "")
		{
			userRole = new UserRole();
		} else
		{
			int rid = Integer.parseInt(userRoleId);
			userRole = permissionService.getRole(rid);
		}
		userRole.setUserTypeName(userTypeName);
		permissionService.saveRole(userRole);
		return "roleList2";
	}

	public String roleDelete()
	{
		try
		{
			permissionService.delRole(id);

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

	public String lookUser()
	{
		request.put("doctors", doctorService.getByRole(id));
		return "ysList";
	}

	// 权限管理菜单跳转
	public String permitManage()
	{
		request.put("userRoles", permissionService.getAllRoles());
		return "permit";
	}

	// 上线前夕的加班，ajax
	public String permitList() throws Exception
	{
		HttpServletRequest requestV = ServletActionContext.getRequest();
		int roleID = Integer.parseInt(requestV.getParameter("roleID"));
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		System.out.println("标记0" + roleID);
		List<RolePermission> list = permissionService.showPermissions(roleID);
		/*
		 * for (RolePermission rolePermission : list) {
		 * System.out.println(list); }
		 */
		try
		{
			SimplePropertyFilter filter = new SimplePropertyFilter();
			String str = JSON.toJSONString(list, filter);
			out.print(str);
		} catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public String getPowerList() throws IOException
	{
		// 先取缓存中的用户的角色
		UserRole me=doctorService.getMyDoctor().getUserRole();
		// 调用服务获取权限
		List<RolePermission> list = permissionService.showPermissions(me.getUserRoleId());
		//发送
		HttpServletResponse responseA = ServletActionContext.getResponse();
		responseA.setContentType("text/html; charset=UTF-8");
		PrintWriter out = responseA.getWriter();
		try
		{
			SimplePropertyFilter filter = new SimplePropertyFilter();
			String str = JSON.toJSONString(list, filter);
			out.print(str);
		} catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public String permitSet()
	{
		HttpServletRequest requestV = ServletActionContext.getRequest();
		Integer typeName = Integer.parseInt(requestV.getParameter("typeName"));

		String yyjj = requestV.getParameter("yyjj");
		if (yyjj == null)
		{
			permissionService.delPermissions(typeName, "医院简介");
		} else
		{
			permissionService.newPermissions(typeName, yyjj);
		}
		String xwzx = requestV.getParameter("xwzx");
		if (xwzx == null)
		{
			permissionService.delPermissions(typeName, "新闻中心");
		} else
		{
			permissionService.newPermissions(typeName, xwzx);
		}
		String ysxx = requestV.getParameter("ysxx");
		if (ysxx == null)
		{
			permissionService.delPermissions(typeName, "医生信息");
		} else
		{
			permissionService.newPermissions(typeName, ysxx);
		}
		String brxx = requestV.getParameter("brxx");
		if (brxx == null)
		{
			permissionService.delPermissions(typeName, "病人信息");
		} else
		{
			permissionService.newPermissions(typeName, brxx);
		}
		String jsgl = requestV.getParameter("jsgl");
		if (jsgl == null)
		{
			permissionService.delPermissions(typeName, "角色管理");
		} else
		{
			permissionService.newPermissions(typeName, jsgl);
		}
		String jsqx = requestV.getParameter("jsqx");
		if (jsqx == null)
		{
			permissionService.delPermissions(typeName, "角色权限");
		} else
		{
			permissionService.newPermissions(typeName, jsqx);
		}
		String ksgl = requestV.getParameter("ksgl");
		if (ksgl == null)
		{
			permissionService.delPermissions(typeName, "科室管理");
		} else
		{
			permissionService.newPermissions(typeName, ksgl);
		}
		String yspb = requestV.getParameter("yspb");
		if (yspb == null)
		{
			permissionService.delPermissions(typeName, "医生排班");
		} else
		{
			permissionService.newPermissions(typeName, yspb);
		}
		String bryy = requestV.getParameter("bryy");
		if (bryy == null)
		{
			permissionService.delPermissions(typeName, "病人预约");
		} else
		{
			permissionService.newPermissions(typeName, bryy);
		}
		String lsyy = requestV.getParameter("lsyy");
		if (lsyy == null)
		{
			permissionService.delPermissions(typeName, "历史预约");
		} else
		{
			permissionService.newPermissions(typeName, lsyy);
		}
		String grxx = requestV.getParameter("grxx");
		if (grxx == null)
		{
			permissionService.delPermissions(typeName, "个人信息");
		} else
		{
			permissionService.newPermissions(typeName, grxx);
		}
		String wdbr = requestV.getParameter("wdbr");
		if (wdbr == null)
		{
			permissionService.delPermissions(typeName, "我的病人");
		} else
		{
			permissionService.newPermissions(typeName, wdbr);
		}
		String yywc = requestV.getParameter("yywc");
		if (yywc == null)
		{
			permissionService.delPermissions(typeName, "预约完成");
		} else
		{
			permissionService.newPermissions(typeName, yywc);
		}
		String wdpb = requestV.getParameter("wdpb");
		if (wdpb == null)
		{
			permissionService.delPermissions(typeName, "我的排班");
		} else
		{
			permissionService.newPermissions(typeName, wdpb);
		}
		return "permit2";
	}

	private String getParam(String key)
	{
		return ServletActionContext.getRequest().getParameter(key);
	}

	// ****************GETTER&SETTER****************************
	public PermissionService getPermissionService()
	{
		return permissionService;
	}

	public void setPermissionService(PermissionService permissionService)
	{
		this.permissionService = permissionService;
	}

	@Override
	public void setRequest(Map<String, Object> request)
	{
		this.request = request;
	}

	public Integer getId()
	{
		return id;
	}

	public void setId(Integer id)
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

	public DoctorService getDoctorService()
	{
		return doctorService;
	}

	public void setDoctorService(DoctorService doctorService)
	{
		this.doctorService = doctorService;
	}

}
