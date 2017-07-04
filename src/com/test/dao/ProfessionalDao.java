package com.test.dao;

import java.util.List;

import com.test.model.Professional;

public interface ProfessionalDao {
	/**
	 * ����רҵ��Id����ȡרҵ��ʵ�����
	 * @param pid רҵId
	 * @return ����רҵ��ʵ�����
	 */
	public Professional getProFeProfessionalById(int pid);
	/**
	 * �õ�����רҵ����
	 * @return
	 */
	public List<Professional> getProfessionals();
	/**
	 * ����ϵ����Id����ȡ��ϵ��������רҵ
	 * @param did
	 * @return
	 */
	public List<Professional> getProfessionalsBydid(int did);
	/**
	 * ����һ��רҵ
	 * @param professional ��������רҵ����
	 * @return
	 */
	public boolean saveProfessional(Professional professional);
	/**
	 * ����רҵ��Idɾ��һ��רҵ
	 * @param pid
	 * @return
	 */
	public boolean deleteProfessionalByid(int pid);
	/**
	 * ����һ��רҵ����
	 * @param professional רҵ��ʵ����
	 * @return ���سɹ�����ʧ��
	 */
	public boolean updateProfessional(Professional professional);
	
}
