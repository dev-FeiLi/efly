package com.dhc.eggsfly.index.persistence;

import java.util.List;

import com.dhc.eggsfly.index.domain.Appointment;
import com.dhc.eggsfly.index.domain.PersonalAppointment;

public interface UserIndexDao {

	public List<Appointment> getAllAppoinments();
	
	public void addSingleAppointment(PersonalAppointment personalAppointment);
}
