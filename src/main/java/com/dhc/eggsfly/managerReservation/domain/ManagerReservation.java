package com.dhc.eggsfly.managerReservation.domain;

import org.springframework.stereotype.Component;

/**
 * 
 * @author liuhu
 *
 */
@Component
public class ManagerReservation {
	/**user reservation id */
    private int orderId;
    /**user id */
    private int userId;
    /**user name */
    private String userName;
    /**meeting theme name */
    private String subject;
    /**meeting start time */
    private String startTime;
    /**meeting end time */
    private String endTime;
    /**meeting time */
    private String time;
    /**meeting's description */
    private String description;
    /**meeting's room name  */
    private String roomName;
    /**meeting's room id  */
    private int roomId;

    // get and set method
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
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
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
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
    
}
