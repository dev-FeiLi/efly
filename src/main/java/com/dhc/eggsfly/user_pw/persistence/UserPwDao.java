package com.dhc.eggsfly.user_pw.persistence;

import com.dhc.eggsfly.user_pw.domain.UserPw;

/**
 * UserPw userPw Dao
 * @author dengwenjie
 */

public interface UserPwDao {

	/**
     * edit
     * @param UserPw userPw
     */
	
	public void updateUserPw(UserPw userPw);
}
