package com.dhc.eggsfly.user_info.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhc.eggsfly.user_info.domain.UserInfo;
import com.dhc.eggsfly.user_info.persistence.UserInfoDao;

/**
 * UserInfo service
 * @author dengwenjie
 */

@Service
public class UserInfoService {
	
	/** Dao for UserInfo*/
	
	@Autowired
	private UserInfoDao userInfoDao;
	
	/**
     * get all item
     * @return userInfo
     */
	
	public UserInfo getUserInfo(String user_id){
		return userInfoDao.getUserInfo(user_id);
		
	}

	/**
     * edit UserInfo
     * @param UserInfo userInfo
     */
	
	public void updateUserInfo(UserInfo userInfo) {

		userInfoDao.updateUserInfo(userInfo);
	}
}
