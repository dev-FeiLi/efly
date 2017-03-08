package com.dhc.eggsfly.reservation.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dhc.eggsfly.reservation.domain.UserReservation;
import com.dhc.eggsfly.reservation.service.UserReservationService;

/**
 * Controller of reservation manager
 * @author liuhu
 */
@Controller
@RequestMapping("/userReservation")
public class UserReservationController {
	/*user's Reservation data */
    @Autowired
    private UserReservation userReservation;
    /*user's Reservation service */
	@Autowired
	private UserReservationService userReservationService;
	private String userId;
	
	/**
	 * user reservation page index
	 * 
	 * @return
	 */
	@RequestMapping("/index")
    public String index(){
        return "user/user_apply";
    }
	
	/**
	 * The User Reservation Manager Initialize 
	 * 
	 * @param userId
	 * @return a UserReservation object
	 * @throws Throwable 
	 * @throws JsonMappingException 
	 * @throws JsonGenerationException 
	 */
	@RequestMapping("/getReservation")
	@ResponseBody
	public List<UserReservation> userReservationInit(HttpSession session) {
		//Query User reservation records
		userId = session.getAttribute("userId").toString();
		System.out.println("************"+userId);
	    List<UserReservation> userReservation = userReservationService.select(userId);
	    
	    return userReservation;
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
		userReservation.setOrderId(orderId);
		
		userReservation.setUserId(Integer.parseInt(userId));
		//Query User reservation records
	    int a = userReservationService.delete(userReservation);
	    return a;
	}
}
