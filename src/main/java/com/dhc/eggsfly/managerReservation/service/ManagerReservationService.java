package com.dhc.eggsfly.managerReservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhc.eggsfly.managerReservation.domain.ManagerReservation;
import com.dhc.eggsfly.managerReservation.domain.SearchCondition;
import com.dhc.eggsfly.managerReservation.persistence.ManagerReservationDao;

/**
 * Service of reservation manager
 * @author liuhu
 *
 */
@Service
public class ManagerReservationService {
	/*DAO of meeting_information table  */
	@Autowired
	private ManagerReservationDao managerReservationDao;
	
	//Query all user reservation records
	public List<ManagerReservation> getAllMeetingInfo() {
		List<ManagerReservation> allUserInfo = managerReservationDao.select();
		for(ManagerReservation item : allUserInfo) {
			item.setTime(item.getStartTime().substring(0, 16) + "~" + item.getEndTime().substring(0, 16));
		}
		return allUserInfo;
	}
	
	//Query user reservation records with condition
    public List<ManagerReservation> searchMeetingInfo(SearchCondition condition) {
		List<ManagerReservation> meetingInfo = managerReservationDao.searchWidthCondition(condition);
		for(ManagerReservation item : meetingInfo) {
			item.setTime(item.getStartTime().substring(0, 16) + "~" + item.getEndTime().substring(0, 16));
		}
		return meetingInfo;
	}
    
    //delete User reservation records by userId and orderId
  	public int delete(ManagerReservation reservation) {
  		return managerReservationDao.delete(reservation);
  	}
}
