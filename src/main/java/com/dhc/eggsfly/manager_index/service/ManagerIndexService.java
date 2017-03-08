package com.dhc.eggsfly.manager_index.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhc.eggsfly.manager_index.domain.Manager;
import com.dhc.eggsfly.manager_index.persistence.ManagerDao;

	/**
	 * UserPw controller
	 * @author tangying
	 */

@Service
public class ManagerIndexService {
	
	/** Dao for ManagerIndex*/
	@Autowired
	private ManagerDao managerDao;
	
	public  ArrayList<Manager> selectAppointment() {
		return managerDao.selectAppointment();
	}
	public void deleteAppointment(Manager manager) {
		managerDao.deleteAppointment(manager);
	}
}
