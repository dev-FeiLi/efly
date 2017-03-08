package com.dhc.eggsfly.user_info.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dhc.eggsfly.user_info.domain.UserInfo;
import com.dhc.eggsfly.user_info.service.UserInfoService;

/**
 * UserInfo controller
 * @author dengwenjie
 */

@Controller
@RequestMapping("/userInfo")
public class UserInfoController {
	
	 /** Service for userInfo */
	@Autowired
	private UserInfoService userInfoService;
	
	/**
     * main page move to user_info page
     * @return URL
     */
	
	@RequestMapping(value="/init")
	public String initPage(HttpServletRequest request,HttpSession session){
		Object authen=session.getAttribute("user");
		if(authen =="666"){
			
			return "/user/user_info";
		}else{
			
			return "/user/user_index";
		}
	}

	
	/**
     * get all item for initialization user_info  page
     * @return Map
     */
	
	@RequestMapping(value="/getUserInfo",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> getUserInfo(HttpServletRequest request,HttpSession session){
		Object authen=session.getAttribute("user");
		Map<String, Object> userInfoMap=new HashMap<String, Object>();
		if(authen =="666"){
			
			String user_id= session.getAttribute("userId").toString();
			
			UserInfo userInfo=userInfoService.getUserInfo(user_id);
			
			userInfoMap.put("data", userInfo);
			userInfoMap.put("status",2);
			return userInfoMap;

		}else{
			if(authen == null){
				userInfoMap.put("status", null);
			}else{
				userInfoMap.put("status", 1);
			}
			return userInfoMap;
		}
	}
	
	/**
     * edit info
     * @param UserInfo userInfo
     * @param session HttpSession
     * @return Map
     */
	
	@RequestMapping(value="/updateUserInfo",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> updateUserInfo(@RequestBody UserInfo userInfo,HttpSession session){
		Map<String, Object> statusMap = new HashMap<String, Object>();
		Object authen = session.getAttribute("user");
		if(authen == "666"){
			try {
				userInfoService.updateUserInfo(userInfo);
				statusMap.put("status", 2);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println(e.toString());
				statusMap.put("status", 0);
			}
			return statusMap;
			
		}
		else{
			if(authen == null){
				statusMap.put("status", null);
			}else{
				statusMap.put("status", 1);
			}
			return statusMap;
		}
	}
}
