package com.dhc.eggsfly.user_info.persistence;

import com.dhc.eggsfly.user_info.domain.UserInfo;

/**
 * UserInfo userInfo Dao
 * @author dengwenjie
 */
public interface UserInfoDao {

	/**
     * get all item
     */
	
	public UserInfo getUserInfo(String user_id);
	
	 /**
     * edit
     * @param UserInfo userInfo
     */
	
	public void updateUserInfo(UserInfo userInfo);
}
