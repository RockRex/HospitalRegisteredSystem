package com.hlzn.HRS.service;

import java.util.List;

import com.hlzn.HRS.dao.DepartmentDao;
import com.hlzn.HRS.entities.Department;


public class DepartmentService {
	private DepartmentDao departmentDao;
	
	public void setDepartmentDao(DepartmentDao departmentDao) {
		this.departmentDao = departmentDao;
	}
	 public void delDepartment(Integer id){
		 departmentDao.delDepartment(id);
	 }
	public List<Department> getAllDepartment(){
		return departmentDao.getAllDepartment();
	}
	
	public void saveOrUpdate(Department department){
		departmentDao.saveOrUpdate(department);
	}
	
	public Department getDepartment(Integer id){
		return departmentDao.getDepartment(id);
	}
	public List<Department> searchDepartment(String key)
	{
		return departmentDao.getSearchDepartment(key);
	}
}
