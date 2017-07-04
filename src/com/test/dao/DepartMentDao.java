package com.test.dao;

import java.util.List;

import com.test.model.Department;
import com.test.model.Professional;

public interface DepartMentDao {
	
	/**
	 * 根据部门的Id来获取系部的实体对象
	 * @param pid 系部Id
	 * @return 返回系部的实体对象
	 */
	public Department getDepartMentById(int did);
	/**
	 * 得到所有系部集合
	 * @return
	 */
	public List<Department> getDepartments();
	/**
	 * 新增一个系部
	 * @param professional 待新增的系部对象
	 * @return
	 */
	public boolean saveDepartment(Department department);
	/**
	 * 根据系部的Id删除一个系部
	 * @param pid
	 * @return
	 */
	public boolean deleteDepartmentByid(int did);
	/**
	 * 更新一个系部对象
	 * @param professional 系部的实体类
	 * @return 返回成功或者失败
	 */
	public boolean updateDepartment(Department department);
	
}
