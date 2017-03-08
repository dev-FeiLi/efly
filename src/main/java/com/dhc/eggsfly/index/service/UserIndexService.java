package com.dhc.eggsfly.index.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhc.eggsfly.index.domain.Appointment;
import com.dhc.eggsfly.index.domain.PersonalAppointment;
import com.dhc.eggsfly.index.persistence.UserIndexDao;

@Service
public class UserIndexService {
	@Autowired
	UserIndexDao userIndexDao;

	public List<Appointment> getAllAppoinments(){
		return userIndexDao.getAllAppoinments();
	}
	
	public void addSingleAppointment(PersonalAppointment personalAppointment ){
		userIndexDao.addSingleAppointment(personalAppointment);
	}
	
	public String check(Appointment appointment){
		List<Appointment> appointmentList = getAllAppoinments();
		String startTime = appointment.getStart()+".0";
		String endTime = appointment.getEnd()+".0";
		String room = appointment.getCalendar();
//		String startTime = formatTime(start);
//		String endTime = formatTime(end);
		
		for(Appointment exitedAppointment: appointmentList) {
			String s = exitedAppointment.getStart();
			String e = exitedAppointment.getEnd();
			if(room.equals(exitedAppointment.getCalendar())){
				if(startTime.compareTo(s)<=0 && endTime.compareTo(e)>=0){
					return "failed";
				}
				if( startTime.compareTo(s)<=0 
					&& ( endTime.compareTo(e)<=0 && endTime.compareTo(s)>0)){
					return "failed";
				}
				if( endTime.compareTo(e)>=0 
					&& ( startTime.compareTo(e)<0 && startTime.compareTo(s)>=0)){
					return "failed";
				}
			}
			
			
		}
		
		return "Success";
	}
	
	
	public String formatTime(String time){
		int year = Integer.valueOf(time.substring(6, 10));
		int month = Integer.valueOf(time.substring(3, 5));
		int date = Integer.valueOf(time.substring(0, 2));
		int hour = Integer.valueOf(time.substring(11, 13));
		int minute = Integer.valueOf(time.substring(14, 16));
		String sHour= String.valueOf(hour);
		String sMinute= String.valueOf(minute);
		String sMonth = String.valueOf(month);
		String sDate = String.valueOf(date); 
		String timeFlag = time.substring(17, 19);
		if(hour<10){
			sHour = "0"+sHour;
		}
		if(minute<10){
			sMinute = "0"+sMinute;
		}
		if(month<10){
			sMonth = "0"+sMonth;
		}
		if(date<10){
			sDate = "0"+sDate;
		}
		if("PM".equals(timeFlag)){
			if(hour<12){
				sHour = hour + 12 + ""; 
			}
		}
		
		return year+"-"+sMonth+"-"+sDate+" "+sHour+":"+sMinute+":00.0";
	}
}
