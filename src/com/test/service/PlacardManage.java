package com.test.service;

import java.util.List;


import org.springframework.stereotype.Component;
import com.test.model.Placard;


@Component("placardmanage")
public class PlacardManage {


	
	public Placard getPlacardByid(int tid) {
		return Factory.getPlacardDao().getPlacardById(tid);
	}

	public List<Placard> getPlacardByPid(int tid) {
		return Factory.getPlacardDao().getPlacardBytid(tid);
	}

	public int savePlacard(Placard placard) {
		return Factory.getPlacardDao().savePlacard(placard);
	}
	public boolean deletePlacardByid(int tid) {
		return Factory.getPlacardDao().deletePlacard(tid);
	}

	public boolean updatePlacard(Placard placard) {
		return Factory.getPlacardDao().updatePlacard(placard);
	}
}
