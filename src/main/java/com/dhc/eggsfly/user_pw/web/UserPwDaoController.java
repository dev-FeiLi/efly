package com.dhc.eggsfly.user_pw.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dhc.eggsfly.user_pw.domain.UserPw;
import com.dhc.eggsfly.user_pw.service.UserPwService;

/**
 * UserPw controller
 * @author dengwenjie
 */

@Controller
@RequestMapping(value="/userPw")
public class UserPwDaoController {
	
	 /** Service for userPw */
	@Autowired
	private UserPwService userPwService;
	
	/**
     * main page move to user_pw page
     * @return URL
     */
	
	@RequestMapping(value="/init")
	public String getUserPw(HttpSession session){
		Object authen=session.getAttribute("user");		
		
		if(authen =="666"){
			return "/user/user_pw";
		}else{
			return "/user/user_index";
		}
	}
	
	/**
     * edit userPws
     * @param UserPw userPw
     * @param session HttpSession
     * @return Map
     */
	
	@RequestMapping(value="/updateUserPw",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateUserPw(@RequestBody UserPw userPw,HttpSession session){
		Object authen = session.getAttribute("user");
		
		Map<String, Object> statusMap=new HashMap<String, Object>();
		if(authen == "666"){
			try {
				userPwService.updateUserPw(userPw);
				statusMap.put("status", 2);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				statusMap.put("status", 0);
			}
			return statusMap;
			
		}else{
			statusMap.put("status", 1);
			return statusMap;
		}
	}

}
