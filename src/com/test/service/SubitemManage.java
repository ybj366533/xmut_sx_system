package com.test.service;

import java.util.List;

import org.springframework.stereotype.Component;

import com.test.model.Subitem;
import com.test.model.SubitemJson;
import com.test.model.Subject;

@Component("subitemmanage")
public class SubitemManage {

	public Subitem getSubitemByid(int sid) {
		return Factory.getSubitemDao().getSubitemByid(sid);
	}

	public List<Subitem> getSubitemByPid(int pid) {
		return Factory.getSubitemDao().getSubitemByPid(pid);
	}
	public List<SubitemJson> getSubitemJsonByPid(int pid) {
		return Factory.getSubitemDao().getSubitemJsonByPid(pid);
	}
	public List<SubitemJson> getSubitemJsonByUid(int pid) {
		return Factory.getSubitemDao().getSubitemJsonByUid(pid);
	}
	public boolean saveSubitem(Subitem subitem) {
		return Factory.getSubitemDao().saveSubitem(subitem);
	}

	public boolean deleteSubitemByid(int sid) {
		return Factory.getSubitemDao().deleteSubitemByid(sid);
	}

	public boolean updateSubitem(Subitem subitem) {
		return Factory.getSubitemDao().updateSubitem(subitem);
	}

}
