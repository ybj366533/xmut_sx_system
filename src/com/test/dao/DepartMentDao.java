package com.test.dao;

import java.util.List;

import com.test.model.Department;
import com.test.model.Professional;

public interface DepartMentDao {
	
	/**
	 * ���ݲ��ŵ�Id����ȡϵ����ʵ�����
	 * @param pid ϵ��Id
	 * @return ����ϵ����ʵ�����
	 */
	public Department getDepartMentById(int did);
	/**
	 * �õ�����ϵ������
	 * @return
	 */
	public List<Department> getDepartments();
	/**
	 * ����һ��ϵ��
	 * @param professional ��������ϵ������
	 * @return
	 */
	public boolean saveDepartment(Department department);
	/**
	 * ����ϵ����Idɾ��һ��ϵ��
	 * @param pid
	 * @return
	 */
	public boolean deleteDepartmentByid(int did);
	/**
	 * ����һ��ϵ������
	 * @param professional ϵ����ʵ����
	 * @return ���سɹ�����ʧ��
	 */
	public boolean updateDepartment(Department department);
	
}
