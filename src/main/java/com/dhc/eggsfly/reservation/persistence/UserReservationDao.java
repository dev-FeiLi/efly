package com.dhc.eggsfly.reservation.persistence;

import java.util.List;

import org.springframework.stereotype.Component;

import com.dhc.eggsfly.reservation.domain.UserReservation;


/**
 * Dao of reservation manager
 * 
 * @author liuhu
 */
@Component
public interface UserReservationDao {
    //Query User reservation records by userId
	List<UserReservation> select(String userId);
	//delete User reservation records by userId and orderId
	int delete(UserReservation reservation);
}
