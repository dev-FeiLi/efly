package com.dhc.eggsfly.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhc.eggsfly.login.domain.UserLoginInfo;
import com.dhc.eggsfly.login.persistence.UserDao;

@Service
public class LoginService {
	@Autowired
	UserDao userDao;
	
	
	public boolean isExistByUserName(String userName){
		UserLoginInfo userInfo = userDao.selectByUserName(userName);
		if(userInfo != null) {
			return true;
		}
		return true;
	}
	
	public boolean isExistByUserId(Integer userId){
		UserLoginInfo userInfo = userDao.selectByUserId(userId);
		if(userInfo != null) {
			return true;
		}
		return false;
	}
	
	
	public UserLoginInfo getUserInfoByUserId(Integer userId){
		UserLoginInfo userInfo = null;
		if(isExistByUserId(userId)){
			userInfo = userDao.selectByUserId(userId);
		}
		return userInfo; 
	}
	
	public UserLoginInfo getUserInfoByUserName(String userName){
		UserLoginInfo userInfo = null;
		if(isExistByUserName(userName)){
			userInfo = userDao.selectByUserName(userName);
		}
		return userInfo;
	}
}
