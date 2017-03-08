package com.dhc.eggsfly.manager_index.web;

import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.Map;

//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;

//import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dhc.eggsfly.manager_index.domain.Manager;
import com.dhc.eggsfly.manager_index.service.ManagerIndexService;

	/**
	 * ManagerIndex service
	 * @author tangying
	 */

@Controller
@RequestMapping(value="/managerAppointment")
public class ManagerIndexController {
	@Autowired
	private ManagerIndexService managerIndexService;
	
	/**
	 * main page move to manager_index page
	 * @return
	 */
	
	@RequestMapping(value="init")
	public String getManagerIndex(){
	 	return "/admin/manager_index";
	}
	
	@RequestMapping(value="getAppointment",method=RequestMethod.POST)
	@ResponseBody
	public ArrayList<Manager> getAppointment(){
		// System.out.println("-------------------");
		//Map<String, Object> appointInfoMap=new HashMap<String, Object>();
		ArrayList<Manager> manager=managerIndexService.selectAppointment();
		//appointInfoMap.put("data", manager);
		return manager;
	}
	
	@RequestMapping(value="deleteAppointment",method=RequestMethod.POST)
	public String deleteAppointment( String id){
		Manager manager = new Manager();
		int i = Integer.parseInt(id);
		manager.setId(i);
		managerIndexService.deleteAppointment(manager);
		 return "admin/manager_index";
	}
	
}
