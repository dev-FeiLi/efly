package com.dhc.eggsfly.managerReservation.domain;
/**
 * the conditions of search
 * @author liuhu
 *
 */
public class SearchCondition {
	/*the meeting's start time */
	private String start;
	/*the meeting's end time */
    private String end;
    /*the meeting's room */
    private String calendar;
    //get and set method
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
	public String getCalendar() {
		return calendar;
	}
	public void setCalendar(String calendar) {
		this.calendar = calendar;
	}
    
}
