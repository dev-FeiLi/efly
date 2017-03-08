package com.dhc.eggsfly.manager_index.persistence;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

import com.dhc.eggsfly.manager_index.domain.Manager;

	/**
	 * ManagerIndex Dao
	 * @author tangying
	 */

@Component
public interface ManagerDao {
	
	/**
	 * get all meeting_appointment
	 */
	public ArrayList<Manager> selectAppointment() ;
	
	/**
	 * delete selected meeting_appointment
	 */
    public void deleteAppointment(Manager manager) ;
	
	
}
