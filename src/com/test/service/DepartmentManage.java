package com.test.service;

import java.util.List;

import org.springframework.stereotype.Component;

import com.test.dao.DepartMentDao;
import com.test.model.Department;
@Component("departmentmanage")
public class DepartmentManage {

	public Department getDepartMentById(int did) {
		return Factory.getDepartmentDao().getDepartMentById(did);
	}

	public List<Department> getDepartments() {
		return Factory.getDepartmentDao().getDepartments();
	}

	public boolean saveDepartment(Department department) {
		return Factory.getDepartmentDao().saveDepartment(department);
	}

	public boolean deleteDepartmentByid(int did) {
		return Factory.getDepartmentDao().deleteDepartmentByid(did);
	}

	public boolean updateDepartment(Department department) {
		return Factory.getDepartmentDao().updateDepartment(department);
	}

}
