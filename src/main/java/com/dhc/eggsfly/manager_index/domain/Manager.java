package com.dhc.eggsfly.manager_index.domain;

import org.springframework.stereotype.Component;

/**
 * EFLY UserPw userPw attribute
 * 
 * @author
 */

public class Manager {
	private int id;
	private String user_name;
	private String description;
	private String meeting_theme_name;
	private String subject;
	private String calendar;
	private String start;
	private String end;
	private boolean resizable;
	private boolean draggable;
	private boolean readOnly;

	public int getId() {
		return id;
	}

	public void setOrder_id(int id) {
		this.id = id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getMeeting_theme_name() {
		return meeting_theme_name;
	}

	public void setMeeting_theme_name(String meeting_theme_name) {
		this.meeting_theme_name = meeting_theme_name;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getCalendar() {
		return calendar;
	}

	public void setCalendar(String calendar) {
		this.calendar = calendar;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public boolean isResizable() {
		return resizable;
	}

	public void setResizable(boolean resizable) {
		this.resizable = resizable;
	}

	public boolean isDraggable() {
		return draggable;
	}

	public void setDraggable(boolean draggable) {
		this.draggable = draggable;
	}

	public boolean isReadOnly() {
		return readOnly;
	}

	public void setReadOnly(boolean readOnly) {
		this.readOnly = readOnly;
	}

	public void setId(int id) {
		this.id = id;
	}

}
