package com.dhc.eggsfly.reservation.domain;

import org.springframework.stereotype.Component;

@Component
public class UserReservation {
	/**user reservation id */
    private int orderId;
    /**user id */
    private int userId;
    /**metting's room name */
    private String roomName;
    /**meeting theme name */
    private String meetingThemeName;
    /**meeting start time */
    private String startTime;
    /**meeting end time */
    private String endTime;
    /**meeting time */
    private String time;
    /**meeting description */
    private String description;
    
    //get and set method
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getMeetingThemeName() {
		return meetingThemeName;
	}
	public void setMeetingThemeName(String meetingThemeName) {
		this.meetingThemeName = meetingThemeName;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
}
