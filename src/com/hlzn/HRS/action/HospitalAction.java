package com.hlzn.HRS.action;



import com.hlzn.HRS.entities.Hospital;
import com.hlzn.HRS.service.HospitalService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;



public class HospitalAction extends ActionSupport implements 
ModelDriven<Hospital>,Preparable
{
	
	/**
	 * 
	 */
	private HospitalService hospitalService;
	private Hospital model;
	
	private static final long serialVersionUID = 1L;
	
	
	public void setHospitalService(HospitalService hospitalService) {
		this.hospitalService = hospitalService;
	}
	public HospitalService getHospitalService() {
		return hospitalService;
	}

	
	public String input(){	
		return "input";
	}	
	public void prepareInput(){
		
		model=hospitalService.getHospital();
		
	}
	public String save(){	
		System.out.println(model);
		hospitalService.saveOrUpdate(model);
		return "input";
	}				

	public void setModel(Hospital model) {
		this.model = model;
	}
	@Override
	public Hospital getModel() {
		// TODO Auto-generated method stub
		return model;
	}

	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
	}
}
