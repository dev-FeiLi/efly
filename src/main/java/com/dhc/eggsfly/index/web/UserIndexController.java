package com.dhc.eggsfly.index.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dhc.eggsfly.index.domain.Appointment;
import com.dhc.eggsfly.index.domain.PersonalAppointment;
import com.dhc.eggsfly.index.service.UserIndexService;



/**
 * index page
 * 
 * @author lifei
 * since 03/18
 */

@Controller
@RequestMapping("/user")
public class UserIndexController {
	
	@Autowired
	UserIndexService userIndexService;
	
	
	@RequestMapping("index")
	public String initView() {
		return "user/user_index";
	}
	
	@RequestMapping(value="getAllAppoinments" , method=RequestMethod.POST)
	@ResponseBody
	public List<Appointment>  getAllAppoinments() {
		List<Appointment> appointments = userIndexService.getAllAppoinments();
		return appointments;
	}
	
	@RequestMapping(value="addSingleAppointment",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject addSingleAppointment(@RequestBody PersonalAppointment personalAppointment ,HttpSession session) {
		JSONObject status =  new JSONObject();
		String user_id = String.valueOf(session.getAttribute("userId"));
		String user_name = (String)session.getAttribute("username");
		personalAppointment.setUser_id(user_id);
		personalAppointment.setUser_name(user_name);
		
		try {
			userIndexService.addSingleAppointment(personalAppointment);
			status.put("status", 1);
		}catch(Exception ex){
			status.put("status", 0);
		}
		return status;
	}
	
	@RequestMapping(value="checkBeforeAdd", method=RequestMethod.POST)
	@ResponseBody
	public JSONObject checkBeforeAdd(Appointment appointment) {
		JSONObject checkStatus = new JSONObject();
		String checkResult = userIndexService.check(appointment);
		if("Success".equals(checkResult)){
			checkStatus.put("checkStatus", "1");
		}else{
			checkStatus.put("checkStatus", "0");
		}
		return checkStatus;
	}
	
	
}
