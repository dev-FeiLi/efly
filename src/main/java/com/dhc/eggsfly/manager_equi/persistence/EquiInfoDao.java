package com.dhc.eggsfly.manager_equi.persistence;

import java.util.List;

import com.dhc.eggsfly.manager_equi.domain.EquiInfo;

/**
 * EquiInfo equiInfo Dao
 * @author dengwenjie
 */

public interface EquiInfoDao {

	/**
     * get all item
     */
	
	public List<EquiInfo> getEquiInfo();
	
	/**
     * get EquiAmount
     */
	
	public EquiInfo getEquiAmount(EquiInfo equiInfo);
	
	/**
     * edit
     * @param EquiInfo equiInfo
     */
	
	public EquiInfo updateEquiInfo(EquiInfo equiInfo);
}
