package com.dhc.eggsfly.managerReservation.persistence;

import java.util.List;

import org.springframework.stereotype.Component;

import com.dhc.eggsfly.managerReservation.domain.ManagerReservation;
import com.dhc.eggsfly.managerReservation.domain.SearchCondition;
/**
 * Dao of reservation manager
 * <br>
 * @author liuhu
 *
 */
@Component
public interface ManagerReservationDao {
	//Query all user reservation records
    List<ManagerReservation> select();
    //Query all user reservation records
    List<ManagerReservation> searchWidthCondition(SearchCondition condition);
    //delete User reservation records by userId and orderId
  	int delete(ManagerReservation reservation);
}
