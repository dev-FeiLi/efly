package com.dhc.eggsfly.login.web;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dhc.eggsfly.login.domain.UserLoginInfo;
import com.dhc.eggsfly.login.service.LoginService;

@Controller
@RequestMapping(value="/login")
public class LoginController {

	@Autowired
	LoginService loginService;
	
	@RequestMapping(value="check")
	@ResponseBody
	public JSONObject loginSubmit(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, Model model) {
		JSONObject rtnData = new JSONObject();
		UserLoginInfo userInfo = null;
		String user_name = request.getParameter("username");
		String password = request.getParameter("password");
		
		String adminName = "";
		int adminId = 0 ;
		String adminPsw = "";
		try {
			Properties prop = new Properties();
			InputStream inputStream = this.getClass().getClassLoader().getResourceAsStream("admin.properties");
			prop.load(inputStream);
			adminName = prop.getProperty("admin_name");
			adminId = Integer.parseInt(prop.getProperty("admin_id"));
			adminPsw = prop.getProperty("admin_password");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Pattern pattern = Pattern.compile("[0-9]*");
		if(pattern.matcher(user_name).matches()) {
			Integer user_id = Integer.parseInt(user_name);
			userInfo = loginService.getUserInfoByUserId(user_id);
			//admin check
			if(adminId == user_id && adminPsw.equals(password)){
//				session.setAttribute("admin", adminName);
				session.setAttribute("admin", "555");
				session.setAttribute("adminName",adminName);
				rtnData.put("status", 1);
				rtnData.put("certification", "admin");
				rtnData.put("message", "success");
			}else if ( userInfo != null && password.equals(userInfo.getPassword())){
				session.setAttribute("username",userInfo.getUser_name());
				session.setAttribute("user","666");
				session.setAttribute("userId",userInfo.getUser_id() );
				rtnData.put("status", 1);
				rtnData.put("certification", "user");
				rtnData.put("message", "success");
			}else {
				rtnData.put("status", 0);
				rtnData.put("message", "用户或密码错误");
			}
		}else {
			userInfo = loginService.getUserInfoByUserName(user_name);
			if(adminName.equals(user_name) && adminPsw == password) {
				session.setAttribute("admin", "555");
				session.setAttribute("adminName",adminName);
				rtnData.put("status", 1);
				rtnData.put("certification", "admin");
				rtnData.put("message", "success");
			}else if(userInfo != null && password.equals(userInfo.getPassword())){
				session.setAttribute("username",userInfo.getUser_name());
				session.setAttribute("userId", userInfo.getUser_id());
//				session.setAttribute("user", userInfo);
				rtnData.put("status", 1);
				rtnData.put("certification", "user");
				rtnData.put("message", "success");
			}else{
				rtnData.put("status", 0);
				rtnData.put("message", "用户或密码错误");
			}
		}
		return rtnData;
	}
	
	@RequestMapping(value = "logout")
	public ModelAndView logout(HttpServletRequest request,HttpSession session,Model model){
		session.removeAttribute("username");
		session.removeAttribute("user");
		session.removeAttribute("userId");
		session.removeAttribute("admin");
		return new ModelAndView("redirect:/user/index");
	}

}
