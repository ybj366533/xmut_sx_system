package com.test.dao;

import java.util.List;

import com.test.model.Placard;

public interface PlacardDao {
	/**
	 * @return
	 */
	public List<Placard> getPlacard();
	
	/**
	 * @param tid
	 * @return
	 */
	public List<Placard> getPlacardBytid(int tid);
	/**
	 * @param id
	 * @return
	 */
	public Placard getPlacardById(int id);
	
	/**
	 * @param answer
	 * @return
	 */
	public int savePlacard(Placard placard);
	
	/**
	 * @param answer
	 * @return
	 */
	public boolean updatePlacard(Placard placard);
	
	/**
	 * @param answer
	 * @return
	 */
	public boolean deletePlacard(int tid);
}
