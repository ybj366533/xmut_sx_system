package com.test.dao;

import java.util.List;

import com.test.model.Department;
import com.test.model.Subitem;
import com.test.model.SubitemJson;
import com.test.model.Subject;

public interface SubitemDao {

	public Subitem getSubitemByid(int sid);

	public List<Subitem> getSubitemByPid(int pid);
	public List<SubitemJson> getSubitemJsonByPid(int pid);
	public List<SubitemJson> getSubitemJsonByUid(int uid);
	public boolean saveSubitem(Subitem subject);

	public boolean deleteSubitemByid(int sid);

	public boolean updateSubitem(Subitem subject);

	public List<Subitem> getSubitem();
}
