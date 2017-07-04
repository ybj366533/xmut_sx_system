package com.test.dao;

import java.util.List;

import com.test.model.Professional;

public interface ProfessionalDao {
	/**
	 * 根据专业的Id来获取专业的实体对象
	 * @param pid 专业Id
	 * @return 返回专业的实体对象
	 */
	public Professional getProFeProfessionalById(int pid);
	/**
	 * 得到所有专业集合
	 * @return
	 */
	public List<Professional> getProfessionals();
	/**
	 * 根据系部的Id来获取该系部的所有专业
	 * @param did
	 * @return
	 */
	public List<Professional> getProfessionalsBydid(int did);
	/**
	 * 新增一个专业
	 * @param professional 待新增的专业对象
	 * @return
	 */
	public boolean saveProfessional(Professional professional);
	/**
	 * 根据专业的Id删除一个专业
	 * @param pid
	 * @return
	 */
	public boolean deleteProfessionalByid(int pid);
	/**
	 * 更新一个专业对象
	 * @param professional 专业的实体类
	 * @return 返回成功或者失败
	 */
	public boolean updateProfessional(Professional professional);
	
}
