package com.dhc.eggsfly.user_pw.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhc.eggsfly.user_pw.domain.UserPw;
import com.dhc.eggsfly.user_pw.persistence.UserPwDao;

/**
 * UserPw service
 * @author dengwenjie
 */

@Service
public class UserPwService {
	
	 /** Dao for UserPw*/
	@Autowired
	private UserPwDao userPwDao;
	
	/**
     * edit UserPw
     * @param UserPw userPw
     * @throws AspectException AspectException
     */
	
	public void  updateUserPw(UserPw userPw){
		
		userPwDao.updateUserPw(userPw);
		
	}
}
