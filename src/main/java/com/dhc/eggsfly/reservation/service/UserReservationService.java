package com.dhc.eggsfly.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhc.eggsfly.managerReservation.domain.ManagerReservation;
import com.dhc.eggsfly.reservation.domain.UserReservation;
import com.dhc.eggsfly.reservation.persistence.UserReservationDao;


/**
 * Service of reservation manager
 * @author liuhu
 *
 */
@Service
public class UserReservationService {
	/*DAO of meeting_information table  */
	@Autowired
	private UserReservationDao userReservationDao;
	
	//Query User reservation records by userId
	public List<UserReservation> select(String userId) {
		List<UserReservation> userReservation = userReservationDao.select(userId);
		for(UserReservation item : userReservation) {
            item.setTime(item.getStartTime().substring(0, 16) + "~" + item.getEndTime().substring(0, 16));
		}
		return userReservation;
	}
	
	//delete User reservation records by userId and orderId
	public int delete(UserReservation reservation) {
		return userReservationDao.delete(reservation);
	}
}
