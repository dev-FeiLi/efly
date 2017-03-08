package com.dhc.eggsfly.login.persistence;

import com.dhc.eggsfly.login.domain.UserLoginInfo;

public interface UserDao {
	public UserLoginInfo selectByUserId(int userId);
	
	public UserLoginInfo selectByUserName(String userName);
}
