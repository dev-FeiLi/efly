package com.dhc.eggsfly.managerReservation.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dhc.eggsfly.managerReservation.domain.ManagerReservation;
import com.dhc.eggsfly.managerReservation.domain.SearchCondition;
import com.dhc.eggsfly.managerReservation.service.ManagerReservationService;

/**
 * Controller of reservation manager
 * @author liuhu
 *
 */
@Controller
@RequestMapping("/adminReservation")
public class ManagerReservationController {
	/*admin's Reservation data */
    @Autowired
    private ManagerReservation managerReservation;
    /*admin's Reservation service */
	@Autowired
	private ManagerReservationService managerReservationService;
	private String adminId;
	
	/**
	 * manager reservation page index
	 * 
	 * @return
	 */
	@RequestMapping("/index")
    public String index(){
        return "admin/manager_reservation";
    }
	
	@RequestMapping("/getAllReservation")
	@ResponseBody
	public List<ManagerReservation> managerReservationInit()  {
		//Query all user reservation records
	    List<ManagerReservation> allUserReservation = managerReservationService.getAllMeetingInfo();
	    return allUserReservation;
	}
	
	/**
	 * manager reservation search
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/getReservation")
	@ResponseBody
	public List<ManagerReservation> managerReservationSearch(HttpServletRequest request)  {
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String room = request.getParameter("room");
		
		SearchCondition condition = new SearchCondition();
		condition.setStart(start);
		condition.setEnd(end);
		condition.setCalendar(room);
		
		//Query user reservation records with conditions
		List<ManagerReservation> meetingInfo = managerReservationService.searchMeetingInfo(condition);
	    return meetingInfo;
	}
	
	/**
	 * delete record
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public int userReservationDelete(HttpServletRequest request) {
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		int userId = Integer.parseInt(request.getParameter("userId"));
		managerReservation.setOrderId(orderId);
		managerReservation.setUserId(userId);

		//delete User reservation records
	    int a = managerReservationService.delete(managerReservation);
	    return a;
	}
}
