package com.dhc.eggsfly.manager.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhc.eggsfly.manager.domain.UserForAdmin;
import com.dhc.eggsfly.manager.persistence.UserForAdminDao;

@Service
public class UserService {
	
	@Autowired
	private UserForAdminDao userDao;
    
    public ArrayList<UserForAdmin> getUserList(UserForAdmin user) {
        user.setUser_id("%" + user.getUser_id() + "%");
        user.setUser_name("%" + user.getUser_name() + "%");
        user.setGroup_name("%" + user.getGroup_name() + "%");
        return userDao.selectUserAll(user);
    }
    
    public int insertUser(UserForAdmin user) {
        user.setPassword(user.getUser_id());
        return userDao.insertUser(user);
    }
    
    public int deleteUser(UserForAdmin user) {
        return userDao.deleteUser(user);
    }
}
