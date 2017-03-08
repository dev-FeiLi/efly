package com.dhc.eggsfly.manager_equi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhc.eggsfly.manager_equi.domain.EquiInfo;
import com.dhc.eggsfly.manager_equi.persistence.EquiInfoDao;

/**
 * EquiInfo service
 * @author dengwenjie
 */


@Service
public class EquiInfoService {

	/** Dao for EquiInfo*/
	
	@Autowired
	private EquiInfoDao equiInfoDao;
	
	
	 /**
     * get all item
     * @return List
     */
	
	public List<EquiInfo> getEquiInfo(){
	
		return  equiInfoDao.getEquiInfo();
	}
	
	
	/**
     * edit EquiInfo
     * @param UserInfo userInfo
     */
	
	public  void  updateEquiInfo(EquiInfo equiInfo){
//		String amount=equiInfoDao.getEquiAmount(equiInfo);
		int a = Integer.parseInt(equiInfoDao.getEquiAmount(equiInfo).getEquipment_amount());
		equiInfo.setEquipment_amount(String.valueOf((Integer.parseInt(equiInfo.getEquipment_amount()) + a)));
		equiInfoDao.updateEquiInfo(equiInfo);

	}
}
