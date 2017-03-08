package com.dhc.eggsfly.manager.persistence;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

import com.dhc.eggsfly.manager.domain.UserForAdmin;

@Component
public interface UserForAdminDao {
	
	public int selectUser(UserForAdmin user) ;

    public ArrayList<UserForAdmin> selectUserAll(UserForAdmin user);

    public int insertUser(UserForAdmin user);

    public int deleteUser(UserForAdmin user);
}
