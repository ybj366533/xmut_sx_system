package com.test.service;

import java.util.List;

import org.springframework.stereotype.Component;
import com.test.model.Works;

@Component("worksmanage")
public class WorksManage {

	public Works getWorksByid(int tid) {
		return Factory.getWorksDao().getWorksById(tid);
	}

	public List<Works> getWorksByPid(int tid) {
		return Factory.getWorksDao().getWorksBytid(tid);
	}
	public List<Works> getWorksList() {
		return Factory.getWorksDao().getWorksList();
	}
	public int saveWorks(Works works) {
		return Factory.getWorksDao().saveWorks(works);
	}

	public boolean deleteWorksByid(int tid) {
		return Factory.getWorksDao().deleteWorks(tid);
	}

	public boolean updateWorks(Works works) {
		return Factory.getWorksDao().updateWorks(works);
	}
}
