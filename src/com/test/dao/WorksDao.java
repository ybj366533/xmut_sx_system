package com.test.dao;

import java.util.List;

import com.test.model.Placard;
import com.test.model.Works;

public interface WorksDao {

	public List<Works> getWorks();

	public List<Works> getWorksBytid(int tid);

	public List<Works> getWorksList();

	public Works getWorksById(int id);

	public int saveWorks(Works works);

	public boolean updateWorks(Works works);

	public boolean deleteWorks(int tid);
}
