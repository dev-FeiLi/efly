package com.dhc.eggsfly.manager_equi.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dhc.eggsfly.manager_equi.domain.EquiInfo;
import com.dhc.eggsfly.manager_equi.service.EquiInfoService;

/**
 * EquiInfo controller
 * @author dengwenjie
 */

@Controller
@RequestMapping("/equiInfo")
public class EquiInfoController {
	
	 /** Service for equiInfo */
	
	@Autowired
	private EquiInfoService equiInfoService;


	/**
     * main page move to manager_equi page
     * @return URL
     */
	
	@RequestMapping(value = "init")
	public String initEqui(HttpSession session) {
		 return "/admin/manager_equi";
//		Object authen = session.getAttribute("admin");
//		 if(authen == "555"){
//			 return "/admin/manager_equi";
//		 }else{
//			 return "/admin/manager_index";
//		 }
//		
	}

	/**
     * get all item for initialization manager_equi page
     * @return Map
     */
	
	@RequestMapping(value = "/getEquiInfo", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getEquiInfo(HttpSession session) {
		Map<String, Object> equiInfoMap = new HashMap<String, Object>();
		Object authen = session.getAttribute("admin");
		if(authen == "555"){
			List<EquiInfo> equiInfo = equiInfoService.getEquiInfo();
			equiInfoMap.put("data", equiInfo);
			equiInfoMap.put("status", 2);
			return equiInfoMap;
		}else{
			if(authen == null){
			equiInfoMap.put("status", null);
			}else{
			equiInfoMap.put("status", 1);
			}
			return equiInfoMap;
		}
		
	}

	/**
     * edit info
     * @param EquiInfo equiInfo
     * @param session HttpSession
     * @return Map
     */
	
	@RequestMapping(value = "/updateEquiInfo", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateEquiInfo(@RequestBody EquiInfo equiInfo,
			HttpSession session) {
		Map<String, Object> statusMap = new HashMap<String, Object>();
		Object authen = session.getAttribute("admin");
		EquiInfo equiInfo2 = new EquiInfo();
		String infoId = equiInfo.getEquipment_id();
		String infoAmount = equiInfo.getEquipment_amount();
		if(authen == "555"){

			if (equiInfo.getRoom_id().length() > 1) {
			for (int i = 1; i <= 2; i++) {
				String a = String.valueOf(i);

				equiInfo2.setEquipment_id(infoId);
				equiInfo2.setEquipment_amount(infoAmount);
				equiInfo2.setRoom_id(a);

				try {
					equiInfoService.updateEquiInfo(equiInfo2);
					statusMap.put("status", 2);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					statusMap.put("status", 0);
				}
			}
		} else {
//			System.out.println(equiInfo.getRoom_id().length());
			try {
				equiInfoService.updateEquiInfo(equiInfo);
				statusMap.put("status", 2);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				statusMap.put("status", 0);
			}
		}

		return statusMap;
		}else{
			if(authen == null){
				statusMap.put("status", 1);
			}else{
				statusMap.put("status", 3);
			}
		}
		return statusMap;

	}
}
